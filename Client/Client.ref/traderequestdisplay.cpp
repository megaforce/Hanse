#include "traderequestdisplay.h"
#include "ui_traderequestdisplay.h"

TradeRequestDisplay::TradeRequestDisplay(Trade *trade, QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TradeRequestDisplay)
{
    ui->setupUi(this);

    m_trade = trade;

    ui->lb_username->setText(trade->getSender());

    ui->lb_woodOffered->setText(QString::number(trade->getAmountOffered().wood));
    ui->lb_stoneOffered->setText(QString::number(trade->getAmountOffered().stone));
    ui->lb_ironOffered->setText(QString::number(trade->getAmountOffered().iron));
    ui->lb_foodOffered->setText(QString::number(trade->getAmountOffered().food));

    ui->lb_woodRequested->setText(QString::number(trade->getAmountRequested().wood));
    ui->lb_stoneRequested->setText(QString::number(trade->getAmountRequested().stone));
    ui->lb_ironRequested->setText(QString::number(trade->getAmountRequested().iron));
    ui->lb_foodRequested->setText(QString::number(trade->getAmountRequested().food));

    ui->sb_woodAccepted->setValue(trade->getAmountRequested().wood);
    ui->sb_stoneAccepted->setValue(trade->getAmountRequested().stone);
    ui->sb_ironAccepted->setValue(trade->getAmountRequested().iron);
    ui->sb_foodAccepted->setValue(trade->getAmountRequested().food);
}

TradeRequestDisplay::~TradeRequestDisplay()
{
    delete ui;
}

void TradeRequestDisplay::on_pb_acceptTrade_clicked()
{
    QJsonObject tradeDetails
    {
        {"type", static_cast<int>(codes_t::TRADE_ACCEPT)},
        {"tradeID", m_trade->getTradeID()},

        {"woodAmount", ui->sb_woodAccepted->value()},
        {"stoneAmount", ui->sb_stoneAccepted->value()},
        {"ironAmount", ui->sb_ironAccepted->value()},
        {"foodAmount", ui->sb_foodAccepted->value()}
    };
    QJsonDocument doc;
    doc.setObject(tradeDetails);
    emit sendData(doc.toBinaryData());
    delete this;
}

void TradeRequestDisplay::on_pb_denyTrade_clicked()
{
    QJsonObject tradeDetails
    {
        {"type", static_cast<int>(codes_t::TRADE_DENY)},
        {"tradeID", m_trade->getTradeID()},
    };
    QJsonDocument doc;
    doc.setObject(tradeDetails);
    emit sendData(doc.toBinaryData());
    delete this;
}
