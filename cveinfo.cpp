#include "cveinfo.h"

CVEInfo::CVEInfo(QString CVEId,int lastUpdatedTime, float OPSWATScore,float CVSS3Score, float CVSS2Score){
    this->CVEId = CVEId;
    this->lastUpdatedTime = lastUpdatedTime;
    this->OPSWATScore = OPSWATScore;
    this->CVSS3Score = CVSS3Score;
    this->CVSS2Score = CVSS2Score;
}
QString CVEInfo::getCVEId() const{
    return CVEId;
}
int CVEInfo::getLastUpdatedTime() const{
    return lastUpdatedTime;
}

float CVEInfo::getOPSWATScore() const{
    return OPSWATScore;
}

float CVEInfo::getCVSS3Score() const{
    return CVSS3Score;
}

float CVEInfo::getCVSS2Score() const {
    return CVSS2Score;
}

//CVEInfoListModel
CVEsInfoListModel::CVEsInfoListModel(QObject *parent) : QAbstractListModel(parent)
{
    CVEsInfoList = new QList<CVEInfo>();
}

CVEsInfoListModel::CVEsInfoListModel(QList<CVEInfo> *_CVEInfoList)
{
    CVEsInfoList = _CVEInfoList;
}

void CVEsInfoListModel::addCVEInfo(const CVEInfo &CVEInfo){
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        CVEsInfoList->append(CVEInfo);
        endInsertRows();
}

int CVEsInfoListModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return CVEsInfoList->count();
}

QVariant CVEsInfoListModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= CVEsInfoList->count())
        return QVariant();

    const CVEInfo CVEInfo = CVEsInfoList->at(index.row());
    if (role == CVEId)
        return CVEInfo.getCVEId();
    else if (role == LastUpdatedTime)
        return CVEInfo.getLastUpdatedTime();
    else if (role == OPSWATScore)
        return CVEInfo.getOPSWATScore();
    else if (role == CVSS3Score)
        return CVEInfo.getCVSS3Score();
    else if (role == CVSS2Score)
        return CVEInfo.getCVSS2Score();
    return QVariant();
}

QHash<int, QByteArray> CVEsInfoListModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[CVEId]            = "CVEId";
    roles[LastUpdatedTime]  = "lastUpdatedTime";
    roles[OPSWATScore]      = "OPSWATScore";
    roles[CVSS3Score]       = "CVSS3Score";
    roles[CVSS2Score]       = "CVSS2Score";
    return roles;
}

QList<CVEInfo>* CVEsInfoListModel::getCVEsInfoList(){
    return CVEsInfoList;
}

void CVEsInfoListModel::setCVEsInfoList(QList<CVEInfo> *_CVEsInfoList){
    CVEsInfoList = _CVEsInfoList;
}
