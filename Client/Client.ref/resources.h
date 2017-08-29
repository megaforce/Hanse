#ifndef RESOURCES_H
#define RESOURCES_H

#include <QObject>

class Resources : public QObject
{
    Q_OBJECT
public:
    explicit Resources(QObject *parent = nullptr);
    Resources(const Resources &rhs, QObject *parent = nullptr);
    qint32 stone;
    qint32 wood;
    qint32 iron;
    qint32 food;
    Resources& operator=(const Resources &rhs);

signals:

public slots:
};

#endif // RESOURCES_H
