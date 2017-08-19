#ifndef UNTERPRETER_T_H
#define UNTERPRETER_T_H

#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include <QString>
#include "debugconsole.h"
#include "resources.h"
#include "globalvariables.h"

class unterpreter_t : public QObject
{
    Q_OBJECT
public:
    explicit unterpreter_t(QObject *parent = nullptr);


signals:
    void unterpreter    (qint16 socketID, const QByteArray& data);
    void newUsername    (qint16 socketID, const QString& name);
    void tradeData      (qint16 socketID, const QString& name, const Resources& amountOffered, \
                                const Resources& amountRequested, const Resources& amountGiven);
    void tradeAccepted(qint16 tradeID, Resources amountAccepted);
public slots:
    //void unterpret(qint16 clientID, QByteArray a);

    // slots that check if data is meant for them and process it accordingly
    void setUsername    (qint16 socketID, const QByteArray& data);
    void acceptTrade    (qint16 socketID, const QByteArray& data);
    void denyTrade      (qint16 socketID, const QByteArray& data);
    void createTrade    (qint16 socketID, const QByteArray& data);
    void finishedTurn   (qint16 socketID, const QByteArray& data);

private:
    qint8 getUniqueID(){
        return qrand();
    }

};

#endif // UNTERPRETER_T_H
