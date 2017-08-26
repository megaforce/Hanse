#include <QCoreApplication>
#include "debugconsole.h"
#include "game.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    logConsole << "Starting game...";
    Game *game = new Game();
    game->begin();
    return a.exec();
}
