#ifndef APPLICATIONS_H
#define APPLICATIONS_H

#include <QObject>
#include "cveinfo.h"

class Applications : public QObject
{
    Q_OBJECT
    Q_PROPERTY(CVEsInfoListModel* CVEsInfoList READ getCVEsInfoList NOTIFY notifyCVEsInfoListChanged)
public:
    Applications(QObject *parent = nullptr);
    CVEsInfoListModel* getCVEsInfoList() const;

private:
    CVEsInfoListModel* CVEsInfoList;
    QList<CVEInfo> CVEsList;

signals:
    void notifyCVEsInfoListChanged();

public slots:
    void onClickAddItem();
};
#endif
