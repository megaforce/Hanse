#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QString>
#include "debugconsole.h"
#include "resources.h"
class Player : public QObject
{
    Q_OBJECT
    Resources inventory;
    QString username;

public:
    explicit Player(QObject *parent = nullptr);
    //qint16 getID() { return id; }
    const QString &getUsername()    const { return username; }
    const Resources &getInventory() const { return inventory; }
signals:
    void playerLost(QString);

public slots:
   // void setID(qint16 clientID) { id = clientID; }
    void takeResources(Resources resources);
    void giveResources(Resources resources);
    void checkState();
    void setUsername(QString un) { username = un;  logConsole << "User with name " + un + " added to players"; }
};

#endif // PLAYER_H
