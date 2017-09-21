#ifndef STATS_H
#define STATS_H

#include <QObject>

class Stats : public QObject
{
	Q_OBJECT
public:
	explicit Stats(QObject *parent = nullptr);

signals:

public slots:

private:
	qint32 cheated;
};

#endif // STATS_H
