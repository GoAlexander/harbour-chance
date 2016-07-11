# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-chance

CONFIG += sailfishapp

SOURCES += src/harbour-chance.cpp

OTHER_FILES += qml/harbour-chance.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/harbour-chance.changes.in \
    rpm/harbour-chance.spec \
    rpm/harbour-chance.yaml \
    translations/*.ts \
    harbour-chance.desktop
    #images/* \
    #qml/pages/magic-ball.png

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-chance-de.ts \
    translations/harbour-chance-fr.ts \
	translations/harbour-chance-it.ts

DISTFILES += \
    qml/pages/AboutPage.qml \
    qml/pages/ShakeSensor.qml
