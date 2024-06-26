#include "BarrageModel.h"

BarrageModel::BarrageModel(QObject *parent)
    : QAbstractListModel(parent)
{}

int BarrageModel::rowCount(const QModelIndex &parent) const
{
    //返回barrages列表的大小
    Q_UNUSED(parent);
    return barrages.count();
}

QVariant BarrageModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= barrages.count())
        return QVariant();

    switch (role) {
    case BarrageRole:
        return barrages.at(index.row());
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> BarrageModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[BarrageRole] = "barrage";
    return roles;
}

void BarrageModel::addBarrage(const QString &barrage)
{
    beginInsertRows(QModelIndex(), barrages.count(), barrages.count());
    barrages.append(barrage);
    endInsertRows();
}
