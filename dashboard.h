#ifndef DASHBOARD_H
#define DASHBOARD_H

#include "constant.h"
#include <QObject>
#include "todoinfo.h"
class Dashboard : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int totalCVEs READ getTotalCVEs NOTIFY notifyTotalCVEsChanged)
    Q_PROPERTY(int deviceIsAtRisk READ getDeviceIsAtRisk NOTIFY notifyDeviceIsAtRiskChanged)
    Q_PROPERTY(int vulApps READ getVulApps NOTIFY notifyVulAppsChanged)
    Q_PROPERTY(int totalVulApps READ getTotalVulApps NOTIFY notifyTotalVulAppsChanged)
    Q_PROPERTY(ToDoInfoListModel* toDoList READ getToDoList NOTIFY notifyToDoListChanged)
public:
    Dashboard(QObject *parent = nullptr);
    int getTotalCVEs();
    int getDeviceIsAtRisk();
    int getVulApps();
    int getTotalVulApps();
    ToDoInfoListModel* getToDoList() const;
private:
    int totalCVEs;
    int deviceIsAtRisk;
    int vulApps;
    int totalVulApps;
    ToDoInfoListModel* toDoList;
    QList<ToDoInfo> toDoInfoList;
signals:
    void notifyTotalCVEsChanged();
    void notifyDeviceIsAtRiskChanged();
    void notifyVulAppsChanged();
    void notifyTotalVulAppsChanged();
    void notifyToDoListChanged();
public slots:
    void setTotalCVEs (int totalCVEs);
    void setDeviceIsAtRisk (int deviceIsAtRisk);
    void onClickScan();
    void onClickUpdateAll();
};
#endif
