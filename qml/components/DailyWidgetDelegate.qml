import QtQuick 2.0

Rectangle {
    id: root

    width: 40
    height: 40
    radius: height/2
    color: "transparent"
    border.width: 1
    border.color: isToday? "#ff9000":"transparent"

    property bool isToday: false
    property string label: ""

    signal clicked()

    AppText
    {
        anchors.centerIn: parent

        size: 13
        color: "white"
        text: label
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
