#include "screenshot.h"
#include <QDateTime>
ScreenShot::ScreenShot(QObject *parent)
    : QObject(parent)
{}

void ScreenShot::shootScreen(QObject *itemObj)
{
    grabItem = qobject_cast<QQuickItem *>(itemObj);
    grabResult = grabItem->grabToImage();

    QQuickItemGrabResult *grabResultData = grabResult.data();
    connect(grabResultData, SIGNAL(ready()), this, SLOT(saveimage()));
}

void ScreenShot::shootScreenWindow(QQuickWindow *rootWindow)
{
    QImage image = rootWindow->grabWindow();
    QString filePathName = "/myPath/";
    filePathName += QDateTime::currentDateTime().toString("yyyy-MM-dd hh-mm-ss-zzz");
    filePathName += QString(".jpg");

    image.save(filePathName, "JPG");
}

void ScreenShot::saveimage()
{
    QString filePathName = "/myPath/";
    filePathName += QDateTime::currentDateTime().toString("yyyy-MM-dd hh-mm-ss-zzz");
    filePathName += QString(".jpg");
    QImage img = grabResult->image();
    if (img.save(filePathName)) {
        qDebug("save sucessfully!");
    }
}
