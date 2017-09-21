#include "stats.h"

Stats::Stats(QObject *parent) :
        QObject(parent)
{

}

void Stats::cheated(const qint32 &i)
{
	cheatIndex += i;
}


