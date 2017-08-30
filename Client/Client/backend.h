#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>

class BackEnd : public QObject
{
	Q_OBJECT

public:
	explicit BackEnd(QObject *parent = nullptr);

	Q_INVOKABLE void setTradeProperty(const QString &tradeProperty, const QString &tradeValue);
	Q_INVOKABLE void sendTrade();
	Q_INVOKABLE void clearTrade();

signals:
	void sendData(const QByteArray& data);

private:
	QJsonObject tradeData;
};

#endif // BACKEND_H
