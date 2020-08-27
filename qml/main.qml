import QtQuick 2.12
import QtQuick.Window 2.12

import "./views"

Window {
    id: mainApp

    visible: true
    width: 350
    height: 600
    title: qsTr("Ogeto's")

    property alias fontAwesomeFontLoader: fontAwesomeFontLoader
    property alias monsterratFontLoader: monsterratFontLoader

    MainView
    {
        id: mainView
    }

    FontLoader
    {
        id: fontAwesomeFontLoader
        source: "qrc:/assets/fonts/fontawesome.otf"
    }

    FontLoader
    {
        id: monsterratFontLoader
        source: "qrc:/assets/fonts/Montserrat-Regular.ttf"
    }
}
