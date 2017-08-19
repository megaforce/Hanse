#include "unterpreter_t.h"
#include <QDebug>
unterpreter_t::unterpreter_t(QObject *parent) : QObject(parent)
{
    connect(this, SIGNAL(unterpreter(qint16,QByteArray)), this, SLOT (acceptTrade(qint16,QByteArray)));
    connect(this, SIGNAL(unterpreter(qint16,QByteArray)), this, SLOT (denyTrade(qint16,QByteArray)));
    connect(this, SIGNAL(unterpreter(qint16,QByteArray)), this, SLOT (createTrade(qint16,QByteArray)));
    connect(this, SIGNAL(unterpreter(qint16,QByteArray)), this, SLOT (finishedTurn(qint16,QByteArray)));
    connect(this, SIGNAL(unterpreter(qint16,QByteArray)), this, SLOT (setUsername(qint16,QByteArray)));
}

void unterpreter_t::setUsername(qint16 socketID, const QByteArray &data)
{
    // converts data back to json
    QJsonDocument jsonDocumentData = QJsonDocument::fromBinaryData(data);
    QJsonObject jsonData = jsonDocumentData.object();

    // returns if data is not meant to set username
    if (static_cast<codes_t>(jsonData["type"].toInt()) != codes_t::SET_USERNAME) return;

    // extract new username from data
    QString username = jsonData["username"].toString();
    emit newUsername(socketID, username);

}

void unterpreter_t::acceptTrade(qint16 socketID, const QByteArray &data)
{
    // converts data back to json
    QJsonDocument jsonDocumentData = QJsonDocument::fromBinaryData(data);
    QJsonObject jsonData = jsonDocumentData.object();

    // returns if data is not meant to accept a trade
    if (static_cast<codes_t>(jsonData["type"].toInt()) != codes_t::TRADE_ACCEPT) return;

    qint16 tradeID = jsonData["tradeID"].toInt();
    logConsole << "Trade with ID: " + QString::number(tradeID) + " has been accepted!";

    Resources acceptedAmount;
    acceptedAmount.wood = jsonData["woodAmount"].toInt();
    acceptedAmount.stone= jsonData["stoneAmount"].toInt();
    acceptedAmount.iron = jsonData["ironAmount"].toInt();
    acceptedAmount.food = jsonData["foodAmount"].toInt();

    emit tradeAccepted(tradeID, acceptedAmount);
}

void unterpreter_t::denyTrade(qint16 socketID, const QByteArray &data)
{
    // converts data back to json
    QJsonDocument jsonDocumentData = QJsonDocument::fromBinaryData(data);
    QJsonObject jsonData = jsonDocumentData.object();

    // returns if data is not meant to deny a trade
    if (static_cast<codes_t>(jsonData["type"].toInt()) != codes_t::TRADE_DENY) return;
}

void unterpreter_t::createTrade(qint16 socketID, const QByteArray &data)
{
    // converts data back to json
    QJsonDocument jsonDocumentData = QJsonDocument::fromBinaryData(data);
    QJsonObject jsonData = jsonDocumentData.object();

    // returns if data is not meant to create a trade
    if (static_cast<codes_t>(jsonData["type"].toInt()) != codes_t::TRADE_REQUEST) return;
    Resources amountOffered, amountRequested, amountGiven;

    // retrieve offered values
    amountOffered.wood      = jsonData["woodOffered"].toInt();
    amountOffered.stone     = jsonData["stoneOffered"].toInt();
    amountOffered.iron      = jsonData["ironOffered"].toInt();
    amountOffered.food      = jsonData["foodOffered"].toInt();

    // retrieve requested values
    amountRequested.wood    = jsonData["woodRequested"] .toInt();
    amountRequested.stone   = jsonData["stoneRequested"].toInt();
    amountRequested.iron    = jsonData["ironRequested"] .toInt();
    amountRequested.food    = jsonData["foodRequested"] .toInt();

    // retrieve amount the player is actually giving
    amountGiven.wood    = jsonData["woodGiven"] .toInt();
    amountGiven.stone   = jsonData["stoneGiven"].toInt();
    amountGiven.iron    = jsonData["ironGiven"] .toInt();
    amountGiven.food    = jsonData["foodGiven"] .toInt();

    QString toPlayer = jsonData["toPlayer"].toString();
    emit tradeData(socketID, toPlayer, amountOffered, amountRequested, amountGiven);
}

void unterpreter_t::finishedTurn(qint16 socketID, const QByteArray &data)
{
    // converts data back to json
    QJsonDocument jsonDocumentData = QJsonDocument::fromBinaryData(data);
    QJsonObject jsonData = jsonDocumentData.object();

    // returns if data is not meant to signal the finish of the turn
    if (static_cast<codes_t>(jsonData["type"].toInt()) != codes_t::TURN_END) return;
}

