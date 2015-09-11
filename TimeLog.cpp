#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickWindow>

#include "TimeLog.h"
#include "TimeLog_p.h"

Q_GLOBAL_STATIC(TimeLogSingleton, timeLog)

TimeLog::TimeLog(QObject *parent) : QObject(parent)
{

}

TimeLog::~TimeLog()
{

}

TimeLog *TimeLog::instance()
{
    return static_cast<TimeLog*>(timeLog);
}

TimeLogData TimeLog::createTimeLogData(QDateTime startTime, int durationTime,
                                       QString category, QString comment)
{
    return TimeLogData(startTime, durationTime, category, comment);
}

QPointF TimeLog::mapToGlobal(QQuickItem *item)
{
    if (!item) {
        return QPointF();
    }

    return (item->window()->mapToGlobal(QPoint()) + item->mapToScene(QPointF()));
}
