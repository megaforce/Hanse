#include "hansenetworkhandler.h"
#include <QDebug>
HanseNetworkHandler::HanseNetworkHandler(QObject *parent) : QTcpServer(parent)
{
    //interpret = new unterpreter_t(this);
    //connect(interpret, SIGNAL(sendData(qint16,QByteArray)), this, SLOT(sendData(qint16,QByteArray)));
}


void HanseNetworkHandler::startServer()
{
    QList<QHostAddress> ipList = QNetworkInterface::allAddresses();
    QHostAddress nonLocalIp;
    foreach (QHostAddress ip, ipList)
    {
        if (ip != QHostAddress::LocalHost && ip.toIPv4Address())
        {
            nonLocalIp = ip;
            break;
        }
    }

    if(!listen(nonLocalIp, 20445))
    {
        logConsole << "Server failed to start!";
    }
    else
    {
        logConsole << "Server started succefully on: " + serverAddress().toString();
    }
}

void HanseNetworkHandler::incomingConnection(qintptr socketDescriptor)
{
    ClientThread *newClient = new ClientThread(socketDescriptor);
    clients.insert(socketDescriptor, newClient);

    connect(newClient, SIGNAL(dataRecieved(qint16,QByteArray)), this, SIGNAL(dataRecieved(qint16,QByteArray)));
    connect(this, SIGNAL(sendDataToClients(qint16,QByteArray)), newClient, SLOT(checkData(qint16,QByteArray)));

    QThread *clientThread = new QThread(this);
    clientThread->start();
    newClient->moveToThread(clientThread);
    //connect(newClient, SIGNAL(finished()), newClient, SLOT(deleteLater()))
    //connect the client to the interpreter

    newClient->start();
    qDebug() << "New clients thread is: " << newClient->thread();
    qDebug() << "Main thread is: " << QThread::currentThread();


}

void HanseNetworkHandler::stopServer()
{
    close();
    logConsole << "Server stopped!";
}

void HanseNetworkHandler::sendData(qint16 clientID, QByteArray data)
{
    qDebug() << QString::number(clientID) << ",\t" << clients.value(clientID);
    //emit sendDataToClients(clientID, data);
    clients.value(clientID)->write(data);
    //QMetaObject::invokeMethod(clients.value(clientID), "write", Qt::QueuedConnection, Q_ARG(QByteArray, data));
}

