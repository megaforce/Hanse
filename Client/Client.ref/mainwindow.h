#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QStringList>
#include <QThread>
#include <QLabel>
#include <QFrame>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QPushButton>
#include <QLayout>
#include <QDebug>
#include <QWidget>

#include "hanseserverthread.h"
#include "loginscreen.h"
#include "resources.h"
#include "globalvariables.h"
#include "tradeofferdialog.h"
#include "trade.h"
#include "traderequestdisplay.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    HanseServerThread *serverConnection;
    Resources inventory;
    QString username;
    QStringList players;
    QWidget *pendingTradeButton(Trade *trade);
    void displayData();
    bool isTurnActive;
signals:
    void startConnection(QString serverAddress, QString un);
    void sendData(const QByteArray& data);
public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
private slots:
    void setState(const QByteArray &data);
    void recieveTradeOffer(const QByteArray &data);
    void displayTradeOfferDialog(QString player);
    void sendTrade(QString toPlayer, Resources amountOffered, Resources amountRequested, Resources amountGiven);
    //void clearTrades();
    void clearOffers();
    void clearRequests();
    void clearPlayers();
    void endOfTurn(const QByteArray &data);
    void displayTradeRequest(Trade *request);
private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
