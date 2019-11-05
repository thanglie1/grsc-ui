#include "todoinfo.h"

ToDoInfo::ToDoInfo (const int &numCVEs,const QString &foundIn,const int &solution){
    this->numCVEs = numCVEs;
    this->foundIn = foundIn;
    this->solution = solution;
}

int ToDoInfo::getNumCVEs() const{
    return numCVEs;
}

QString ToDoInfo::getFoundIn() const {
    return foundIn;
}

int ToDoInfo::getSolution() const{
    return solution;
}
//ToDoInfoListModel
ToDoInfoListModel::ToDoInfoListModel(QObject *parent) : QAbstractListModel(parent)
{
    toDoInfoList = new QList<ToDoInfo>();
}

ToDoInfoListModel::ToDoInfoListModel(QList<ToDoInfo> *_toDoInfoList)
{
    toDoInfoList = _toDoInfoList;
}

void ToDoInfoListModel::addToDoInfo(const ToDoInfo &toDoInfo){
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        toDoInfoList->append(toDoInfo);
        endInsertRows();
}

int ToDoInfoListModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return toDoInfoList->count();
}

QVariant ToDoInfoListModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= toDoInfoList->count())
        return QVariant();

    const ToDoInfo todoInfo = toDoInfoList->at(index.row());
    if (role == NumberCVEsRole)
        return todoInfo.getNumCVEs();
    else if (role == FoundInRole)
        return todoInfo.getFoundIn();
    else if (role == SolutionRole)
        return todoInfo.getSolution();
    return QVariant();
}

QHash<int, QByteArray> ToDoInfoListModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NumberCVEsRole]   = "numCVEs";
    roles[FoundInRole]      = "foundIn";
    roles[SolutionRole]     = "solution";
    return roles;
}

QList<ToDoInfo>* ToDoInfoListModel::getToDoInfoList(){
    return toDoInfoList;
}

void ToDoInfoListModel::setToDoInfoList(QList<ToDoInfo> *_toDoInfoList){
    toDoInfoList = _toDoInfoList;
}

