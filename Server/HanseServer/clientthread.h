#ifndef CLIENTTHREAD_H
#define CLIENTTHREAD_H

#include <QObject>
#include <QThread>
#include <QTcpSocket>
#include "debugconsole.h"
#include <QDebug>
#include <QByteArray>
#include <QHostAddress>
#include "unterpreter_t.h"

class ClientThread : public QObject
{
    Q_OBJECT
    QTcpSocket *client;
    qintptr socketDescriptor;
    QByteArray data;


public:
    explicit ClientThread(qintptr clientID, QObject *parent = 0);
signals:
    void clientFailedToConnect();
    void addingNewClient();
    void clientConnected(qint32);
    void clientDisconnected(qint32);
    void dataRecieved(qint16, QByteArray);
    void startingSignal();
public slots:
    void readyRead();
    void disconnected();
    void start();
    void write(const QByteArray &data);
    void startingSlot();
    void checkData(qint16 clientID, const QByteArray& data);
private slots:

};

#endif // CLIENTTHREAD_H
