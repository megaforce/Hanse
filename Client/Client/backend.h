#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QStringList>
#include <QThread>
#include <QGuiApplication>

#include "hanseserverthread.h"
#include "resources.h"
#include "globalvariables.h"
#include "trade.h"

extern QGuiApplication* papp;

class BackEnd : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QString foodRes READ foodRes WRITE setFoodRes NOTIFY foodResChanged)
	Q_PROPERTY(QString woodRes READ woodRes WRITE setWoodRes NOTIFY woodResChanged)
	Q_PROPERTY(QString stoneRes READ stoneRes WRITE setStoneRes NOTIFY stoneResChanged)
	Q_PROPERTY(QString ironRes READ ironRes WRITE setIronRes NOTIFY ironResChanged)

public:
	explicit BackEnd(QObject *parent = nullptr);

	Q_INVOKABLE void setTradeProperty(const QString &tradeProperty, const QString &tradeValue);
	Q_INVOKABLE void setTradePartner(const qint32 &num);
	Q_INVOKABLE void startGame(const QString &uname);
	Q_INVOKABLE void sendTrade();
	Q_INVOKABLE void clearTrade();
	Q_INVOKABLE void acceptTrade(QString wood, QString stone, QString iron, QString food);
	Q_INVOKABLE void denyTrade();

	Q_INVOKABLE qint32 tradeInfo(const QString &res);

	void startup(){ //WHYYYYY
		QObject::connect(papp, SIGNAL(aboutToQuit()), this, SLOT(cleanup()));
	}


	QString foodRes();
	QString woodRes();
	QString stoneRes();
	QString ironRes();
	void setFoodRes(const QString &foodRes);
	void setWoodRes(const QString &woodRes);
	void setStoneRes(const QString &stoneRes);
	void setIronRes(const QString &ironRes);

signals:
	void startConnection(QString serverAddress, QString un);
	void sendData(const QByteArray& data);

	void foodResChanged();
	void woodResChanged();
	void stoneResChanged();
	void ironResChanged();

private slots:
	void setState(const QByteArray &data);
	void recieveTradeOffer(const QByteArray &data);
	void endOfTurn(const QByteArray &data);
	void cleanup(){
		serverThread->exit();
	}

private:
	QJsonObject tradeData;
	QThread *serverThread;

	HanseServerThread *serverConnection;
	Resources inventory;
	QString username;
	QStringList players;
	bool isTurnActive;

	QList<Trade *> trades;
	qint16 currTrade;
};

#endif // BACKEND_H
