#include "hanseserverthread.h"
#include <QDebug>

HanseServerThread::HanseServerThread(QObject *parent) : QObject(parent)
{

}

void HanseServerThread::sendData(const QByteArray &data)
{
    if(QThread::currentThread() != thread())
    {
        QMetaObject::invokeMethod(this, "sendData", Qt::QueuedConnection, Q_ARG(QByteArray, data));
        return;
    }
    serverConnection->write(data);
}

void HanseServerThread::readyRead()
{
    qDebug() << "Recieved some data!";
    data.append(serverConnection->readAll());
    if(data.contains("\0"))
    {
        emit dataRecieved(data);
        data.clear();
    }
}

void HanseServerThread::introduceToServer()
{
    QJsonDocument introduction;
    QJsonObject object
    {
        {"type", static_cast<int>(codes_t::SET_USERNAME)},
        {"username", username}
    };
    introduction.setObject(object);
    serverConnection->write(introduction.toBinaryData());
}

void HanseServerThread::startConnection(QString serverAddress, QString un)
{
    if(QThread::currentThread() != thread())
    {
        QMetaObject::invokeMethod(this, "startConnection", Qt::QueuedConnection, Q_ARG(QString, serverAddress), Q_ARG(QString, un));
        return;
    }
    qDebug() << "here!";
    serverConnection = new QTcpSocket(this);
    connect(serverConnection, SIGNAL(readyRead()), this, SLOT(readyRead()));
    username = un;
    serverConnection->connectToHost(serverAddress, 20445);
    introduceToServer();
}
