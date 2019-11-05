#include "dashboard.h"

Dashboard::Dashboard(QObject *parent) : QObject(parent)
{
    this->totalCVEs = NUM_TOTAL_CVES;
    this->deviceIsAtRisk = NUM_DEVICE_IS_AT_RISK;
    this->vulApps = NUM_VUL_APPS;
    this->totalVulApps = NUM_TOTAL_VUL_APPS;
    QString foundIn = "D%1";
    toDoInfoList<<ToDoInfo(rand()*10, foundIn.arg(rand()*10), rand()*10);
    toDoInfoList<<ToDoInfo(rand()*10, foundIn.arg(rand()*10), rand()*10);
    toDoInfoList<<ToDoInfo(rand()*10, foundIn.arg(rand()*10), rand()*10);
    this->toDoList = new ToDoInfoListModel(&toDoInfoList);
}

void Dashboard::setTotalCVEs(int totalCVEs){
    this->totalCVEs = totalCVEs;
    emit notifyTotalCVEsChanged();
}

void Dashboard::onClickScan(){
    this->totalCVEs++;
    emit notifyTotalCVEsChanged();
}
void Dashboard::onClickUpdateAll(){
    QString foundIn = "D %1";
    toDoList->addToDoInfo(ToDoInfo(rand()*10, foundIn.arg(rand()*10), rand()*10));
    emit notifyToDoListChanged();
}

int Dashboard::getTotalCVEs(){
    return this->totalCVEs;
}

ToDoInfoListModel* Dashboard::getToDoList() const{
    return toDoList;
}

int Dashboard::getDeviceIsAtRisk(){
    return this->deviceIsAtRisk;
}

int Dashboard::getVulApps(){
    return this->vulApps;
}

int Dashboard::getTotalVulApps(){
    return this->totalVulApps;
}

void Dashboard::setDeviceIsAtRisk (int deviceIsAtRisk){
    this->deviceIsAtRisk = deviceIsAtRisk;
}
