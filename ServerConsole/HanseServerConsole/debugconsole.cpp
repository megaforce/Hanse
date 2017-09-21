#include "debugconsole.h"

DebugConsole logConsole;

DebugConsole::DebugConsole(QObject *parent) : QObject(parent)
{
    log = new QTextStream( stdout );
    logFile = new QFile("game.log");
    logFile->open(QIODevice::Append);
}


DebugConsole& DebugConsole::operator<<(QString data)
{
    write(data);
    return *this;
}

DebugConsole::~DebugConsole()
{
    logFile->close();
    delete logFile;
}

void DebugConsole::write(QString data)
{
    QString message = "[" + QDateTime::currentDateTime().toString() + "] " + data + "\r\n";

    (*log) << message;
    (*log).flush();
    (*logFile).write(message.toLocal8Bit());
}
