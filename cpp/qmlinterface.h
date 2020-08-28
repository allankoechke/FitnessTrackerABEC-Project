#ifndef QMLINTERFACE_H
#define QMLINTERFACE_H

#include <QObject>
#include <QVariant>
#include <QDebug>
#include <QDateTime>

class QmlInterface : public QObject
{
    Q_OBJECT
public:
    explicit QmlInterface(QObject *parent = nullptr);

    Q_PROPERTY(QString time MEMBER m_hours  NOTIFY timeChanged);

    Q_PROPERTY(QString msec MEMBER m_msecs NOTIFY msecChanged);

    Q_INVOKABLE void getDateInHMSMs(QVariant dt);

    Q_INVOKABLE void startCounter();

    Q_INVOKABLE void stopCounter();

    Q_INVOKABLE void getInterval();

signals:
    void timeChanged();

    void msecChanged();

    void emitTimeChanged(QString time);

    void emitMsecChanged(QString msec);

private slots:
    void onTimeChnaged();

    void onMsecChanged();

private:
    QString m_hours, m_msecs;

    QDateTime m_startTime;
};

#endif // QMLINTERFACE_H
