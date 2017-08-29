#include "backend.h"
#include <QDebug>

BackEnd::BackEnd(QObject *parent) :
        QObject(parent)
{
	qDebug() << "init";

	isTurnActive = false;
	tradeData["type"] = static_cast<int>(codes_t::TRADE_REQUEST);

	serverConnection = new HanseServerThread();
	QThread *serverThread = new QThread(this);
	serverThread->start();

	//connect receiving slots
	connect(serverConnection, SIGNAL(dataRecieved(QByteArray)), this, SLOT(setState(QByteArray)));
	connect(serverConnection, SIGNAL(dataRecieved(QByteArray)), this, SLOT(recieveTradeOffer(QByteArray)));
	connect(serverConnection, SIGNAL(dataRecieved(QByteArray)), this, SLOT(endOfTurn(QByteArray)));

	connect(this, SIGNAL(startConnection(QString, QString)), serverConnection, SLOT(startConnection(QString,QString)));
	serverConnection->moveToThread(serverThread);

	username = "";
	inventory.food  = 1000;
	inventory.wood  = 1000;
	inventory.stone = 1000;
	inventory.iron  = 1000;

	connect(this, SIGNAL(sendData(QByteArray)), serverConnection, SLOT(sendData(QByteArray)));
	emit startConnection(QString("93.103.236.159"), username);
}

auto BackEnd::setTradeProperty(const QString &tradeProperty, const QString &tradeValue) -> void
{
	qDebug() << "trade[" + tradeProperty + "] = " + tradeValue;
	tradeData[tradeProperty] = tradeValue.toInt();
}

auto BackEnd::setTradePartner(const qint32 &num) -> void
{
	tradeData["toPlayer"] = players.at(num);
}

auto BackEnd::sendTrade() -> void
{
	qDebug() << "sendTrade";
	QJsonDocument doc;
	doc.setObject(tradeData);
	emit sendData(doc.toBinaryData());
}

auto BackEnd::clearTrade() -> void
{
	qDebug() << "clearTrade";
}

auto BackEnd::setState(const QByteArray &data) -> void
{
	qDebug() << "setState";

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
	//may be unnecessary
	//displayData();

	isTurnActive = true;
}

auto BackEnd::recieveTradeOffer(const QByteArray &data) -> void
{
	qDebug() << "recieveTradeOffer";

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
	// TODO: display trade offer
}

auto BackEnd::endOfTurn(const QByteArray &data) -> void
{
	qDebug() << "endOfTurn";

	// converts data back to json
	QJsonDocument stateDataDocument = QJsonDocument::fromBinaryData(data);
	QJsonObject stateData = stateDataDocument.object();

	// returns if data is not meant for state
	if(static_cast<codes_t>(stateData["type"].toInt()) != codes_t::TURN_END) return;
	isTurnActive = false;
}

auto BackEnd::foodRes() -> QString
{
	return QString::number(inventory.food);
}
auto BackEnd::woodRes() -> QString
{
	return QString::number(inventory.wood);
}
auto BackEnd::stoneRes() -> QString
{
	return QString::number(inventory.stone);
}
auto BackEnd::ironRes() -> QString
{
	return QString::number(inventory.iron);
}

auto BackEnd::setFoodRes(const QString &foodRes) -> void
{
	if (foodRes.toInt() == inventory.food) return;

	inventory.food = foodRes.toInt();
	emit foodResChanged();
}
auto BackEnd::setWoodRes(const QString &woodRes) -> void
{
	if (woodRes.toInt() == inventory.wood) return;

	inventory.wood = woodRes.toInt();
	emit woodResChanged();
}
auto BackEnd::setStoneRes(const QString &stoneRes) -> void
{
	if (stoneRes.toInt() == inventory.stone) return;

	inventory.stone = stoneRes.toInt();
	emit stoneResChanged();
}
auto BackEnd::setIronRes(const QString &ironRes) -> void
{
	if (ironRes.toInt() == inventory.iron) return;

	inventory.iron = ironRes.toInt();
	emit ironResChanged();
}












