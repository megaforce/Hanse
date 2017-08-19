#include "clientthread.h"
#include <QDebug>
ClientThread::ClientThread(qintptr clientID, QObject *parent) : QObject(parent)
{
    socketDescriptor = clientID;
    connect(this, SIGNAL(startingSignal()), this, SLOT(startingSlot()), Qt::DirectConnection);
}

void ClientThread::readyRead()
{
    data.append(client->readAll());
    if(data.contains("\0"))
    {
        emit dataRecieved(socketDescriptor, data);
        data.clear();
    }
}

void ClientThread::disconnected()
{
    emit clientDisconnected(socketDescriptor);
    logConsole << "Client " + QString::number(socketDescriptor) + " disconnected!";
    client->deleteLater();
    thread()->exit(0);
}


void ClientThread::write(const QByteArray &data)
{
    if(QThread::currentThread() != thread())
    {
        QMetaObject::invokeMethod(this, "write", Qt::QueuedConnection, Q_ARG(const QByteArray&, data));
        return;
    }
    client->write(data);
}

void ClientThread::startingSlot()
{
    if(QThread::currentThread() != thread())
    {
        QMetaObject::invokeMethod(this, "startingSlot", Qt::QueuedConnection);
        return;
    }
    emit addingNewClient();
    client = new QTcpSocket();
    if(!client->setSocketDescriptor(socketDescriptor))
    {
        //something went wrong log to console
       logConsole << "Client failed to start!";
    }
    else
    {
        //client is fine connect signals
        connect(client, SIGNAL(readyRead()), this, SLOT(readyRead()), Qt::DirectConnection);
        connect(client, SIGNAL(disconnected()), this, SLOT(disconnected()));
        logConsole << "Client connected: " + client->peerAddress().toString();
        emit clientConnected(socketDescriptor);
    }
}

void ClientThread::checkData(qint16 clientID, const QByteArray &data)
{
    if (static_cast<qint16>(socketDescriptor) != clientID) return;
    else write(data);
}

void ClientThread::start()
{
    emit startingSignal();
}
