#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "radialbar.h"
#include "qmlinterface.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QmlInterface qmlInterface;

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));

    engine.rootContext()->setContextProperty("QmlInterface", &qmlInterface);

    qmlRegisterType<RadialBar>("RadialBar", 1, 0, "RadialBar");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
