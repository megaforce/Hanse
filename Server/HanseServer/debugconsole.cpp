#include "debugconsole.h"

DebugConsole logConsole;

DebugConsole::DebugConsole(QObject *parent) : QObject(parent)
{

}

void DebugConsole::setLogBox(QTextEdit *box)
{
    log = box;
}

DebugConsole& DebugConsole::operator<<(QString data)
{
    write(data);
    return *this;
}

void DebugConsole::write(QString data)
{
    log->append(data);
    //log->append("\n");
}
