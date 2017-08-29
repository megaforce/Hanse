#ifndef TRADE_H
#define TRADE_H

#include <QObject>
#include "resources.h"
class Trade : public QObject
{
    Q_OBJECT
    Resources m_amountOffered;
    Resources m_amountRequested;
    qint16    m_tradeID;
    QString   m_sender;
public:
    explicit Trade(qint16 tradeID, QString sender, Resources amountOffered, Resources amountRequested, QObject *parent = nullptr);
    const Resources &getAmountOffered()     const { return m_amountOffered;     }
    const Resources &getAmountRequested()   const { return m_amountRequested;   }
    const qint16    &getTradeID()           const { return m_tradeID;           }
    const QString   &getSender()            const { return m_sender;            }
signals:

public slots:
};

#endif // TRADE_H
