#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>

QGuiApplication *papp;
QObject *pqmain;
#include "backend.h"

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);
	papp = &app;

	qmlRegisterType<BackEnd>("trade.backend", 1, 0, "BackEnd");

	QQmlApplicationEngine engine;
	QQmlComponent component(&engine,
	                        QUrl(QStringLiteral("qrc:/main.qml")));
	pqmain = component.create();
	//engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	return app.exec();
}
