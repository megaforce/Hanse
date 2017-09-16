#include "game.h"
#include <QDebug>

qint16 Game::idFromName(const QString &name)
{
    foreach(Player* player, players)
    {
        if(player->getUsername() == name)
        {
            return players.key(player);
        }
    }
    return -1;
}

void Game::sendStateData()
{
    foreach(Player *player, players)
    {
        QJsonObject stateData;
        QJsonArray allPlayers;
        foreach(Player* opponent, players)
        {
               allPlayers.append(opponent->getUsername());
        }

        stateData["players"]    = allPlayers;

        stateData["amountWood"] = player->getInventory().wood;
        stateData["amountStone"]= player->getInventory().stone;
        stateData["amountIron"] = player->getInventory().iron;
        stateData["amountFood"] = player->getInventory().food;

        stateData["type"]       = static_cast<int>(codes_t::STATE_DATA);
        QJsonDocument document;
        document.setObject(stateData);
        sendData(player, document.toBinaryData());
        logConsole << "Sending state data to: " + player->getUsername();
    }
}

void Game::startGame()
{
    startTurn();
}

Game::Game(QObject *parent) :
    QObject(parent)
{
    server = nullptr;
    interpret = new unterpreter_t(this);
    turnTimer = new QTimer(this);
    turnTimer->setInterval(20000);
    connect(turnTimer, SIGNAL(timeout()), this, SLOT(endTurn()));
}

Game::~Game()
{
    players.clear();

}

void Game::begin()
{
    if(server != nullptr)return;
    server = new HanseNetworkHandler(this);
    server->startServer();
    //connect server to interpreter
    connect(server, SIGNAL(dataRecieved(qint16,QByteArray)), interpret, SIGNAL(unterpreter(qint16,QByteArray)));

    //connect interpreter to other functions
    connect(interpret, SIGNAL(newUsername(qint16,QString)), this, SLOT(playerIntroduction(qint16,QString)));
    connect(interpret, SIGNAL(tradeData(qint16,QString,Resources,Resources,Resources)), this, SLOT(addTrade(qint16,QString,Resources,Resources,Resources)));

}

/*void Game::on_stopServerBtn_clicked()
{
    if(server == nullptr)return;
    server->stopServer();
    delete server;
    server = nullptr;
}*/

void Game::addPlayer(qint16 playerID)
{
    players.insert(playerID, new Player());
}
// add player and set his username
void Game::playerIntroduction(qint16 playerID, QString username)
{
    addPlayer(playerID);
    players[playerID]->setUsername(username);
    qDebug() << "New player now fully added and introduced!";
    if(players.size() >= 4)
    {
        server->close();
        startGame();
    }
}

void Game::endTurn()
{
    logConsole << "Turn now over!";
    turnTimer->stop();
    emit executeTrades();
    qDeleteAll(pendingTrades);
    pendingTrades.clear();
    foreach(Player* player, players)
    {
        Resources takeFood;
        takeFood.wood = 0;
        takeFood.stone= 0;
        takeFood.iron = 0;
        takeFood.food = 100;
        player->takeResources(takeFood);

        player->checkState();

        QJsonObject endOfTurn { {"type", static_cast<int>(codes_t::TURN_END)} };
        QJsonDocument doc;
        doc.setObject(endOfTurn);
        emit sendData(player, doc.toBinaryData());
    }
    startTurn();
}

void Game::startTurn()
{
    logConsole << "Turn has started!";
    sendStateData();
    turnTimer->start();
}

void Game::addTrade(qint16 socketID, const QString &name, const Resources &amountOffered, const Resources &amountRequested, const Resources &amountGiven)
{
    Trade *newTrade = new Trade(players[socketID], players[idFromName(name)], amountOffered, amountRequested, amountGiven);
    connect(newTrade, SIGNAL(sendOffer(Player* ,QByteArray)), this, SLOT(sendData(Player*,QByteArray)));
    connect(this, SIGNAL(executeTrades()), newTrade, SLOT(executeTrade()), Qt::DirectConnection);
    connect(interpret, SIGNAL(tradeAccepted(qint16,Resources)), newTrade, SLOT(checkAccept(qint16,Resources)));
    newTrade->startTrade();
    pendingTrades.append(newTrade);
}

// converts Player* to his socket id
void Game::sendData(Player *player, const QByteArray &data)
{
    server->sendData(idFromName(player->getUsername()), data);
}
