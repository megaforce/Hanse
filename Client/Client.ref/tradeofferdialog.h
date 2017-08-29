#ifndef TRADEOFFERDIALOG_H
#define TRADEOFFERDIALOG_H

#include <QWidget>
#include <QSpinBox>
#include <QLabel>

#include "resources.h"
namespace Ui {
class TradeOfferDialog;
}

class TradeOfferDialog : public QWidget
{
    Q_OBJECT

public:
    explicit TradeOfferDialog(QWidget *parent = 0);
    ~TradeOfferDialog();
public slots:
    void setUsername(QString username);
private slots:
    void on_lb_sendTrade_clicked();
signals:
    void tradeDetails(QString toPlayer, Resources offeredAmount, Resources requestedAmount, Resources givenAmount);


private:
    Ui::TradeOfferDialog *ui;
};

#endif // TRADEOFFERDIALOG_H
