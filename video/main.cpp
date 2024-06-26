#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "BarrageModel.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    BarrageModel barrageModel;
    engine.rootContext()->setContextProperty("barragemodel", &barrageModel);
    qmlRegisterType<BarrageModel>("BarrageModels", 1, 0, "BarrageModel");
    const QUrl url(QStringLiteral("qrc:/video/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
