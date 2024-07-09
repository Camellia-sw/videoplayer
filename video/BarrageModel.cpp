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
        return QVariant(); // 如果索引无效或超出范围，则返回无效QVariant

    switch (role) {
    case BarrageRole:
        return barrages.at(index.row()); // 如果请求的是自定义的BarrageRole，返回弹幕文本
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
    beginInsertRows(QModelIndex(), barrages.count(), barrages.count()); //插入
    barrages.append(barrage); //向列表中添加新弹幕
    endInsertRows();          //结束插入
}
