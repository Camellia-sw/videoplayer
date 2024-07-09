#pragma once

#include <QAbstractListModel>
#include <QList>
#include <QString>

class BarrageModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles { BarrageRole = Qt::UserRole + 1 }; //定义枚举类型

    BarrageModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override; //返回弹幕列表大小
    QVariant data(const QModelIndex &index,
                  int role = Qt::DisplayRole) const override; //从弹幕列表中获取数据
    QHash<int, QByteArray> roleNames()
        const override; //返回一个哈希表，该哈希表将角色枚举值映射到字节数组

    Q_INVOKABLE void addBarrage(const QString &barrage); //添加新的弹幕

private:
    QList<QString> barrages;
};
