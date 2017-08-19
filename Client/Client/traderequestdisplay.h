#ifndef TRADEREQUESTDISPLAY_H
#define TRADEREQUESTDISPLAY_H

#include <QWidget>
#include <QLabel>
#include <QPushButton>
#include <QSpinBox>
#include <QJsonObject>
#include <QJsonDocument>

#include "trade.h"
#include "globalvariables.h"
#include "resources.h"

namespace Ui {
class TradeRequestDisplay;
}

class TradeRequestDisplay : public QWidget
{
    Q_OBJECT
    Trade *m_trade;

public:
    explicit TradeRequestDisplay(Trade* trade, QWidget *parent = 0);
    ~TradeRequestDisplay();

private slots:

    void on_pb_acceptTrade_clicked();

    void on_pb_denyTrade_clicked();

private:
    Ui::TradeRequestDisplay *ui;
signals:
    void sendData(const QByteArray& data);
};

#endif // TRADEREQUESTDISPLAY_H
