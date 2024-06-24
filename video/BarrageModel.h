#pragma once

#include <QAbstractListModel>
#include <QList>
#include <QString>

class BarrageModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles { BarrageRole = Qt::UserRole + 1 };

    BarrageModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addBarrage(const QString &barrage);

    bool isEmpty() const;

private:
    QList<QString> barrages;
};
