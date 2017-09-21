#ifndef DEBUGCONSOLE_H
#define DEBUGCONSOLE_H

#include <QObject>
#include <QTextStream>
#include <QFile>
#include <QDateTime>
#include <iostream>

class DebugConsole : public QObject
{
    Q_OBJECT
    QTextStream *log;
    QFile *logFile;
public:
    explicit DebugConsole(QObject *parent = 0);
    DebugConsole& operator<<(QString data);
    ~DebugConsole();
signals:

public slots:
    void write(QString data);
};

extern DebugConsole logConsole;

#endif // DEBUGCONSOLE_H
