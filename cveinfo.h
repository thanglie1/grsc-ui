#ifndef CVEINFO_H
#define CVEINFO_H

#include <QObject>
#include <QAbstractListModel>

class CVEInfo
{
public:
    CVEInfo(QString CVEId,int lastUpdatedTime, float OPSWATScore,float CVSS3Score, float CVSS2Score);
    QString getCVEId() const;
    int getLastUpdatedTime() const;
    float getOPSWATScore() const;
    float getCVSS3Score() const;
    float getCVSS2Score() const;
private:
    QString CVEId;
    int     lastUpdatedTime;
    float   OPSWATScore;
    float   CVSS3Score;
    float   CVSS2Score;
};

//Model
class CVEsInfoListModel : public QAbstractListModel{
    Q_OBJECT
public:
    CVEsInfoListModel(QObject *parent = nullptr);
    CVEsInfoListModel(QList<CVEInfo> *CVEInfoList);
    void addCVEInfo(const CVEInfo &CVEInfo);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;
    enum CVEInfoRole {
            CVEId,
            LastUpdatedTime,
            OPSWATScore,
            CVSS3Score,
            CVSS2Score
        };
    QList<CVEInfo> *getCVEsInfoList();
    void setCVEsInfoList(QList<CVEInfo> *CVEsInfoList);
private:
     QList<CVEInfo> *CVEsInfoList;
};
#endif
