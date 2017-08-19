#ifndef DEBUGCONSOLE_H
#define DEBUGCONSOLE_H

#include <QObject>
#include <QTextEdit>

class DebugConsole : public QObject
{
    Q_OBJECT
    QTextEdit *log;
public:
    explicit DebugConsole(QObject *parent = 0);
    void setLogBox(QTextEdit *box);
    DebugConsole& operator<<(QString data);
signals:

public slots:
    void write(QString data);
};

extern DebugConsole logConsole;

#endif // DEBUGCONSOLE_H
