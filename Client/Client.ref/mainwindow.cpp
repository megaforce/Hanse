#include "mainwindow.h"
#include "ui_mainwindow.h"

QWidget *MainWindow::pendingTradeButton(Trade *trade)
{
    QWidget *buttonWidget = new QWidget(this);
    QHBoxLayout *button = new QHBoxLayout(buttonWidget);

    QLabel *tradeSender = new QLabel(trade->getSender(),buttonWidget);
    button->addWidget(tradeSender);

    QPushButton *showTrade = new QPushButton("Show", buttonWidget);
    connect(showTrade, &QPushButton::clicked, [this, trade, buttonWidget]() { displayTradeRequest(trade); delete buttonWidget; });
    button->addWidget(showTrade);


    buttonWidget->setLayout(button);
    qDebug() << "here!";
    return buttonWidget;
}

void MainWindow::displayData()
{
    ui->lb_usernameDisplay->setText(username);

    ui->lb_displayFood  ->  setText(QString::number(inventory.food));
    ui->lb_displayWood  ->  setText(QString::number(inventory.wood));
    ui->lb_displayStone ->  setText(QString::number(inventory.stone));
    ui->lb_displayIron  ->  setText(QString::number(inventory.iron));

    QVBoxLayout *playersLayout = new QVBoxLayout(this);
    foreach(QString player, players)
    {
        QHBoxLayout *playerDisplay = new QHBoxLayout(this);

        // add username
        QLabel *playerData = new QLabel(this);
        playerData->setText(player);
        playerData->setSizePolicy(QSizePolicy::Minimum, QSizePolicy::Maximum);
        playerDisplay->addWidget(playerData);

        // add offer trade button
        QPushButton *tradeOffer = new QPushButton(this);
        tradeOffer->setText("Offer trade");
        connect(tradeOffer, &QPushButton::clicked, [this, player](){ displayTradeOfferDialog(player); });
        playerDisplay->addWidget(tradeOffer);

        // add to list
        playersLayout->addLayout(playerDisplay);
    }
    // set list
    ui->fr_playerDisplay->setLayout(playersLayout);
}

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    isTurnActive = false;
    ui->setupUi(this);
    QVBoxLayout *tradeLayout = new QVBoxLayout(this);
    ui->fr_tradesWindow->setLayout(tradeLayout);
    LoginScreen screen(this);
    screen.exec();
    serverConnection = new HanseServerThread();
    QThread *serverThread = new QThread(this);
    serverThread->start();

    //connect receiving slots
    connect(serverConnection, SIGNAL(dataRecieved(QByteArray)), this, SLOT(setState(QByteArray)));
    connect(serverConnection, SIGNAL(dataRecieved(QByteArray)), this, SLOT(recieveTradeOffer(QByteArray)));
    connect(serverConnection, SIGNAL(dataRecieved(QByteArray)), this, SLOT(endOfTurn(QByteArray)));

    connect(this, SIGNAL(startConnection(QString, QString)), serverConnection, SLOT(startConnection(QString,QString)));
    serverConnection->moveToThread(serverThread);
    username = screen.getUsername();
    connect(this, SIGNAL(sendData(QByteArray)), serverConnection, SLOT(sendData(QByteArray)));
    emit startConnection(QString("93.103.236.159"), username);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::setState(const QByteArray &data)
{
     // converts data back to json
    QJsonDocument stateDataDocument = QJsonDocument::fromBinaryData(data);
    QJsonObject stateData = stateDataDocument.object();

    // returns if data is not meant for state
    if(static_cast<codes_t>(stateData["type"].toInt()) != codes_t::STATE_DATA) return;

    // retrieve inventory from data
    inventory.wood = stateData["amountWood"].toInt();
    inventory.stone= stateData["amountStone"].toInt();
    inventory.iron = stateData["amountIron"].toInt();
    inventory.food = stateData["amountFood"].toInt();

    // read all players
    QJsonArray playerArray = stateData["players"].toArray();
    players.clear();
    foreach(QJsonValue val, playerArray)
    {
        players << val.toString();
    }
    displayData();

    isTurnActive = true;
}

void MainWindow::recieveTradeOffer(const QByteArray &data)
{
   // converts data back to json
   QJsonDocument tradeDataDocument = QJsonDocument::fromBinaryData(data);
   QJsonObject tradeData = tradeDataDocument.object();

   // returns if data is not meant for state
   if(static_cast<codes_t>(tradeData["type"].toInt()) != codes_t::TRADE_OFFER) return;

   qDebug() << "Got a trade offer!";
   Resources amountOffered;
   Resources amountRequested;
   qint16    tradeID;
   QString   sender;

   amountOffered.wood = tradeData["offeredWood"].toInt();
   amountOffered.stone= tradeData["offeredStone"].toInt();
   amountOffered.iron = tradeData["offeredIron"].toInt();
   amountOffered.food = tradeData["offeredFood"].toInt();

   amountRequested.wood = tradeData["requestedWood"].toInt();
   amountRequested.stone= tradeData["requestedStone"].toInt();
   amountRequested.iron = tradeData["requestedIron"].toInt();
   amountRequested.food = tradeData["requestedFood"].toInt();

   tradeID = tradeData["tradeID"].toInt();
   sender = tradeData["sender"].toString();

   Trade *newTrade = new Trade(tradeID, sender, amountOffered, amountRequested, this);
   ui->fr_tradesWindow->layout()->addWidget(pendingTradeButton(newTrade));
}

void MainWindow::displayTradeOfferDialog(QString player)
{
    if(!isTurnActive)return;
    clearOffers();
    TradeOfferDialog *offer = new TradeOfferDialog(this);
    connect(offer, SIGNAL(tradeDetails(QString,Resources,Resources,Resources)), this, SLOT(sendTrade(QString,Resources,Resources,Resources)));
    offer->setUsername(player);
    QVBoxLayout *offerLayout = new QVBoxLayout(this);
    offerLayout->addWidget(offer);

    ui->fr_mainDisplay->setLayout(offerLayout);
}

void MainWindow::sendTrade(QString toPlayer, Resources amountOffered, Resources amountRequested, Resources amountGiven)
{
    QJsonObject tradeData
    {
        {"type", static_cast<int>(codes_t::TRADE_REQUEST)},

        {"woodOffered",     amountOffered.wood},
        {"stoneOffered",    amountOffered.stone},
        {"ironOffered",     amountOffered.iron},
        {"foodOffered",     amountOffered.food},

        {"woodRequested",   amountRequested.wood},
        {"stoneRequested",  amountRequested.stone},
        {"ironRequested",   amountRequested.iron},
        {"foodRequested",   amountRequested.food},

        {"woodGiven",       amountGiven.wood},
        {"stoneGiven",      amountGiven.stone},
        {"ironGiven",       amountGiven.iron},
        {"foodGiven",       amountGiven.food},

        {"toPlayer",        toPlayer}
    };
    QJsonDocument doc;
    doc.setObject(tradeData);
    emit sendData(doc.toBinaryData());
}
/*
void MainWindow::clearTrades()
{
    if( ui->fr_tradesWindow->layout() != nullptr )
    {
        QLayoutItem *item;
        while( ( item =  ui->fr_tradesWindow->layout()->takeAt(0)) != nullptr )
        {
            delete item->widget();
            delete item;
        }
        delete ui->fr_tradesWindow->layout();
    }
}*/

void MainWindow::clearOffers()
{
    if( ui->fr_mainDisplay->layout() != nullptr )
    {
        QLayoutItem *item;
        while( ( item =  ui->fr_mainDisplay->layout()->takeAt(0)) != nullptr )
        {
            delete item->widget();
            delete item;
        }
        delete ui->fr_mainDisplay->layout();
    }
}

void MainWindow::clearRequests()
{
    if( ui->fr_tradesWindow->layout() != nullptr )
    {
        QLayoutItem *item;
        while( ( item =  ui->fr_tradesWindow->layout()->takeAt(0)) != nullptr )
        {
            delete item->widget();
            delete item;
        }
        delete ui->fr_tradesWindow->layout();
        ui->fr_tradesWindow->setLayout(new QVBoxLayout(this));
    }
}

void MainWindow::clearPlayers()
{
    if( ui->fr_playerDisplay->layout() != nullptr )
    {
        QLayoutItem *item;
        while( ( item =  ui->fr_playerDisplay->layout()->takeAt(0)) != nullptr )
        {
            delete item->widget();
            delete item;
        }
        delete ui->fr_playerDisplay->layout();
    }
}

void MainWindow::endOfTurn(const QByteArray &data)
{
   // converts data back to json
   QJsonDocument stateDataDocument = QJsonDocument::fromBinaryData(data);
   QJsonObject stateData = stateDataDocument.object();

   // returns if data is not meant for state
   if(static_cast<codes_t>(stateData["type"].toInt()) != codes_t::TURN_END) return;
   isTurnActive = false;
   //clearTrades();
   clearOffers();
   clearRequests();
   clearPlayers();
}

void MainWindow::displayTradeRequest(Trade *request)
{
    if(!isTurnActive)return;
    TradeRequestDisplay *newTradeRequest = new TradeRequestDisplay(request, this);
    connect(newTradeRequest, SIGNAL(sendData(QByteArray)), this, SIGNAL(sendData(QByteArray)));
    QHBoxLayout *requestLayout = new QHBoxLayout(this);
    requestLayout->addWidget(newTradeRequest);
    clearOffers();
    ui->fr_mainDisplay->setLayout(requestLayout);
}
