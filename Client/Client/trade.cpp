#include "trade.h"

Trade::Trade(qint16 tradeID, QString sender, Resources amountOffered, Resources amountRequested, QObject *parent) : QObject(parent)
{
	m_tradeID = tradeID;
	m_sender  = sender;
	m_amountOffered     = amountOffered;
	m_amountRequested   = amountRequested;
}
