#ifndef DATABUILDER_H
#define DATABUILDER_H

#include <QObject>
#include <QByteArray>
class DataBuilder : public QObject
{
    Q_OBJECT
public:
    explicit DataBuilder(QObject *parent = nullptr);


signals:

public slots:
    QByteArray startTurn(qint16 clientID, qint32 woodAmount, qint32 stoneAmount, qint32 ironAmount, qint32 clayAmount, QString firstPlayer, qint16 firstPlayerID, \
                         QString secondPlayer, qint16 secondPlayerID, QString thirdPlayer, qint16 thirdPlayerID);
};

#endif // DATABUILDER_H
