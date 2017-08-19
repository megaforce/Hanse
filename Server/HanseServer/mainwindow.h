#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "hansenetworkhandler.h"
#include "debugconsole.h"
#include "trade.h"
#include "unterpreter_t.h"
#include "resources.h"
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QTimer>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    HanseNetworkHandler *server;
    QMap<qint16, Player*> players;
    QList<Trade*> pendingTrades;
    unterpreter_t *interpret;
    qint16 idFromName(const QString &name);
    void sendStateData();
    void startGame();
    QTimer *turnTimer;
public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
public slots:

private slots:
    void on_startServerBtn_clicked();

    void on_stopServerBtn_clicked();

    void addPlayer(qint16 playerID);

    void playerIntroduction(qint16 playerID, QString username);

    void endTurn();
    void startTurn();
    void addTrade(qint16 socketID, const QString& name, const Resources& amountOffered, \
        const Resources& amountRequested, const Resources& amountGiven);
    void sendData(Player* player, const QByteArray &data);
private:
    Ui::MainWindow *ui;
signals:
    void executeTrades();
};

#endif // MAINWINDOW_H
