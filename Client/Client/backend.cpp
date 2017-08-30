#include "backend.h"
#include <QDebug>

BackEnd::BackEnd(QObject *parent) :
        QObject(parent)
{
}

auto BackEnd::setTradeProperty(const QString &tradeProperty, const QString &tradeValue) -> void
{
	qDebug() << "trade[" + tradeProperty + "] = " + tradeValue;
	tradeData[tradeProperty] = tradeValue;
}

auto BackEnd::sendTrade() -> void
{
	qDebug() << "sendTrade";
}

auto BackEnd::clearTrade() -> void
{
	qDebug() << "clearTrade";
	QJsonDocument doc;
	doc.setObject(tradeData);
	emit sendData(doc.toBinaryData());
}
