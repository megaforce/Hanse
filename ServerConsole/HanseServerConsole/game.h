#ifndef GAME_H
#define GAME_H

#include <QObject>
#include "hansenetworkhandler.h"
#include "debugconsole.h"
#include "trade.h"
#include "unterpreter_t.h"
#include "resources.h"
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QTimer>
#include <iostream>

class Game : public QObject
{
    Q_OBJECT
    HanseNetworkHandler *server;
    QMap<qint16, Player*> players;
    QList<Trade*> pendingTrades;
    unterpreter_t *interpret;
    qint16 idFromName(const QString &name);
    void sendStateData();
    void sendGameOver();
    void startGame();
    QTimer *turnTimer;
    bool isGameOver;
public:
    explicit Game(QObject *parent = nullptr);
    ~Game();
    void begin();
signals:
    void executeTrades();

public slots:
private slots:
    void addPlayer(qint16 playerID);

    void playerIntroduction(qint16 playerID, QString username);

    void endTurn();
    void startTurn();
    void addTrade(qint16 socketID, const QString& name, const Resources& amountOffered, \
        const Resources& amountRequested, const Resources& amountGiven);
    void sendData(Player* player, const QByteArray &data);
};

#endif // GAME_H
