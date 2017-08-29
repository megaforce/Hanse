#ifndef HANSESERVERTHREAD_H
#define HANSESERVERTHREAD_H

#include <QObject>
#include <QThread>
#include <QTcpSocket>
#include <QByteArray>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonValue>
#include <QVariant>
#include "globalvariables.h"

class HanseServerThread : public QObject
{
    Q_OBJECT
    QTcpSocket *serverConnection;
    QByteArray data;
    QString username;

public:
    explicit HanseServerThread(QObject *parent = nullptr);

signals:
    void dataRecieved(const QByteArray &data);
public slots:
    void sendData(const QByteArray &data);
    void readyRead();
    void introduceToServer();
    void startConnection(QString serverAddress, QString un);
};

#endif // HANSESERVERTHREAD_H
