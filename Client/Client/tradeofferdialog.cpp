#include "tradeofferdialog.h"
#include "ui_tradeofferdialog.h"

TradeOfferDialog::TradeOfferDialog(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TradeOfferDialog)
{
    ui->setupUi(this);
}

TradeOfferDialog::~TradeOfferDialog()
{
    delete ui;
}

void TradeOfferDialog::setUsername(QString username)
{
    ui->lb_userName->setText(username);
}

void TradeOfferDialog::on_lb_sendTrade_clicked()
{
    Resources offeredAmount;
    offeredAmount.stone = ui->sb_stoneOffer ->value();
    offeredAmount.wood  = ui->sb_woodOffer  ->value();
    offeredAmount.iron  = ui->sb_ironOffered->value();
    offeredAmount.food  = ui->sb_foodOffered->value();

    Resources requestedAmount;
    requestedAmount.stone   = ui->sb_stoneRequested->value();
    requestedAmount.wood    = ui->sb_woodRequested->value();
    requestedAmount.iron    = ui->sb_ironRequested->value();
    requestedAmount.food    = ui->sb_foodRequested->value();

    Resources givenAmount;
    givenAmount.stone   = ui->sb_stoneGiven->value();
    givenAmount.wood    = ui->sb_woodGiven->value();
    givenAmount.iron    = ui->sb_ironGiven->value();
    givenAmount.food    = ui->sb_foodGiven->value();

    emit tradeDetails(ui->lb_userName->text() ,offeredAmount, requestedAmount, givenAmount);
}
