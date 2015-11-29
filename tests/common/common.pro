QT += testlib

TARGET = tst_common
TEMPLATE = lib
CONFIG += staticlib

SOURCES += \
    tst_common.cpp

HEADERS += \
    tst_common.h
unix {
    target.path = /usr/lib
    INSTALLS += target
}

# timetracker lib
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../src/lib/ -ltimetracker
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../src/lib/ -ltimetrackerd
else:unix: LIBS += -L$$OUT_PWD/../../src/lib/ -ltimetracker

INCLUDEPATH += $$PWD/../../src/lib
DEPENDPATH += $$PWD/../../src/lib

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../../src/lib/libtimetracker.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../../src/lib/libtimetrackerd.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../../src/lib/timetracker.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../../src/lib/timetrackerd.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../../src/lib/libtimetracker.a