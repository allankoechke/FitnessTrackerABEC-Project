import QtQuick 2.0
import QtQuick.Controls 2.4

Label {
    property real size

    color: "white"
    font.pixelSize: size
    font.family: monsterratFontLoader.name
}
