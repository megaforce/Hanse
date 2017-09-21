#include "stats.h"

Stats::Stats(QObject *parent) :
        QObject(parent)
{

}

qint32 Stats::cheated(const qint32 &i)
{
	return cheatIndex += i;
}


