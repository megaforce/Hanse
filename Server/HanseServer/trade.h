#ifndef TRADE_H
#define TRADE_H

#include <QObject>
#include "player.h"
#include <QJsonDocument>
#include <QJsonObject>
#include "globalvariables.h"
#include "debugconsole.h"
class Trade : public QObject
{
    Q_OBJECT

    Player *m_senderPlayer, *m_recieverPlayer;
    Resources m_amountOffered, m_amountRequested, m_amountGiven, m_amountAccepted;
    QByteArray buildOffer();
    bool hasTradeBeenAccepted;
    static qint16 tradeID;
    static qint16 getTradeID();
    qint16 m_tradeID;
public:
    explicit Trade(Player *sender, Player *reciever, \
                   Resources amountOffered, Resources amountRequested, Resources amountGiven, QObject *parent = nullptr);
    void startTrade();
    const bool isAccepted() const { return hasTradeBeenAccepted; }

signals:
    void sendOffer(Player *reciever, const QByteArray &data);

public slots:
    void executeTrade();
    void checkAccept(qint16 tradeID, Resources amountAccepted);
};

#endif // TRADE_H
