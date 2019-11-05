#ifndef TODOINFO_H
#define TODOINFO_H

#include <QObject>
#include <QAbstractListModel>

class ToDoInfo
{
public:
    ToDoInfo (const int &numCVEs, const QString &foundIn, const int &solution);
    int getNumCVEs() const;
    QString getFoundIn() const;
    int getSolution() const;
private:
    int numCVEs;
    QString foundIn;
    int solution;
};

//Model
class ToDoInfoListModel : public QAbstractListModel{
    Q_OBJECT
public:
    ToDoInfoListModel(QObject *parent = nullptr);
    ToDoInfoListModel(QList<ToDoInfo> *toDoInfoList);
    void addToDoInfo(const ToDoInfo &toDoInfo);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;
    enum ToDoInfoRole {
            NumberCVEsRole,
            FoundInRole,
            SolutionRole
        };
    QList<ToDoInfo> *getToDoInfoList();
    void setToDoInfoList(QList<ToDoInfo> *toDoInfoList);
private:
     QList<ToDoInfo> *toDoInfoList;
};
#endif
