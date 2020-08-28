#include "qmlinterface.h"

QmlInterface::QmlInterface(QObject *parent) : QObject(parent)
{
    connect(this, &QmlInterface::timeChanged, this, &QmlInterface::onTimeChnaged);
    connect(this, &QmlInterface::msecChanged, this, &QmlInterface::onMsecChanged);
}

void QmlInterface::getDateInHMSMs(QVariant dt)
{
    int milliseconds = dt.toInt();
    QString hours = (milliseconds / 3600000)<10? "0"+QString::number(milliseconds / 3600000):QString::number(milliseconds / 3600000);
    int _hours = milliseconds % 3600000;
    QString mins = (_hours / 60000)<10? "0"+QString::number(_hours / 60000):QString::number(_hours / 60000);
    int _mins = _hours % 60000;
    QString secs = (_mins / 1000)<10? "0"+QString::number(_mins / 1000):QString::number(_mins / 1000);
    int _msec = _mins % 1000;
    //int msec = _msec / 100;

    QString msecs;

    if(_msec >= 100)
        msecs = (_msec / 10)<10? "0"+QString::number(_msec / 10):QString::number(_msec / 10);

    else
        msecs = QString::number(_msec);

    QString h = hours + ":" + mins + \
            ":" + secs;

    QString s = msecs;

    if(h != m_hours)
    {
        m_hours = h;
        emit timeChanged();
    }

    if(s != m_msecs)
    {
        m_msecs = s;
        emit msecChanged();
    }
}

void QmlInterface::startCounter()
{
    m_startTime = QDateTime::currentDateTime();
    qDebug() << m_startTime;
}

void QmlInterface::stopCounter()
{

}

void QmlInterface::getInterval()
{
    QDateTime t = QDateTime::currentDateTime();
}

void QmlInterface::onTimeChnaged()
{
    emit emitTimeChanged(m_hours);
}

void QmlInterface::onMsecChanged()
{
    emit emitMsecChanged(m_msecs);
}
