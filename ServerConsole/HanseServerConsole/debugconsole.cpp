#include "debugconsole.h"

DebugConsole logConsole;

DebugConsole::DebugConsole(QObject *parent) : QObject(parent)
{
    log = new QTextStream( stdout );
}


DebugConsole& DebugConsole::operator<<(QString data)
{
    write(data);
    return *this;
}

void DebugConsole::write(QString data)
{
    (*log) << data << '\n';
    (*log).flush();
    //log->append("\n");
}
