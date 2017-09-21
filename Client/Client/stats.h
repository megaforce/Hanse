#ifndef STATS_H
#define STATS_H

#include <QObject>

class Stats : public QObject
{
	Q_OBJECT
public:
	explicit Stats(QObject *parent = nullptr);

	qint32 cheated(const qint32 &i = 0);

signals:

public slots:

private:
	qint32 cheatIndex;
};

#endif // STATS_H
