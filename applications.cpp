#include "applications.h"

Applications::Applications(QObject *parent) : QObject(parent)
{
    QString id = "B%1";
    CVEsList<<CVEInfo(id.arg(rand()),rand(), rand()*10, rand()*10, rand()*10);
    CVEsList<<CVEInfo(id.arg(rand()*10),rand(), rand()*10, rand()*10, rand()*10);
    CVEsList<<CVEInfo(id.arg(rand()*10),rand(), rand()*10, rand()*10, rand()*10);
    CVEsList<<CVEInfo(id.arg(rand()*10),rand(), rand()*10, rand()*10, rand()*10);
    CVEsInfoList = new CVEsInfoListModel(&CVEsList);
}
CVEsInfoListModel* Applications::getCVEsInfoList() const{
    return CVEsInfoList;
}
void Applications::onClickAddItem(){
    QString id = "C%1";
    //CVEsList<<CVEInfo(id.arg(rand()*10),rand(), rand()*10, rand()*10, rand()*10);
    //CVEsInfoList->getCVEsInfoList()->append(CVEInfo(id.arg(rand()*10),rand(), rand()*10, rand()*10, rand()*10));
    CVEsInfoList->addCVEInfo(CVEInfo(id.arg(rand()*10),rand(), rand()*10, rand()*10, rand()*10));
    emit notifyCVEsInfoListChanged();
}
