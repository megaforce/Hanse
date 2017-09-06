#include <QGuiApplication>
#include <QQmlApplicationEngine>

QGuiApplication* papp;
#include "backend.h"

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);
	papp = &app;

	qmlRegisterType<BackEnd>("trade.backend", 1, 0, "BackEnd");

	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	return app.exec();
}
