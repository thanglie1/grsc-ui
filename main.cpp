#include <QApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>
#include <dashboard.h>
#include <constant.h>
#include <applications.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    Applications *applications = new Applications();
    context->setContextProperty("applications", applications);
    Dashboard *dashboard = new Dashboard();
    context->setContextProperty("dashboard", dashboard);


    //context->setContextProperty("modelItem",&model);
    
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    
    return app.exec();
}
