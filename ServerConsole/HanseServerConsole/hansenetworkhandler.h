#ifndef HANSENETWORKHANDLER_H
#define HANSENETWORKHANDLER_H

#include <QObject>
#include <QThread>
#include <QTcpServer>
#include <QTcpSocket>
#include <QList>
#include <QSignalMapper>
#include "clientthread.h"
#include "debugconsole.h"
#include <QMap>
#include <QHostAddress>
#include <QNetworkInterface>
#include <QByteArray>
#include "player.h"
#include "unterpreter_t.h"


class HanseNetworkHandler : public QTcpServer
{
    Q_OBJECT
    QMap<qint32, ClientThread*> clients;
    //unterpreter_t *interpret;
public:
    explicit HanseNetworkHandler(QObject *parent = 0);
    void startServer();
    void stopServer();
    //const unterpreter_t* getUnterpreter() const { return interpret; }
signals:
    void serverStartFailed();
    void serverStartSucceded();
    void serverStopped();
    void newClientConnected(qint16 clientID, QString username);
    void dataRecieved(qint16 clientID, const QByteArray& data);
    void sendDataToClients(qint16 clientID, const QByteArray& data);
public slots:
    void sendData(qint16 clientID, QByteArray data);


protected:
    void incomingConnection(qintptr socketDescriptor);
};

#endif // HANSENETWORKHANDLER_H
