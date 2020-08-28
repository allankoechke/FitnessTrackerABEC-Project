import QtQuick 2.0
import QtQuick.Layouts 1.3

import "../components"

Rectangle{
    id: root

    property int value: 0
    property int from: 0
    property int to: 100
    property int interval: 1

    border.color: "grey"
    border.width: 1
    color: "#002e4d"

    width: 70
    height: 100

    ColumnLayout
    {
        anchors.fill: parent
        spacing: 0

        Rectangle
        {
            Layout.fillWidth: true
            Layout.preferredHeight: 30

            color: Qt.lighter("#002e4d")

            AppIcon
            {
                color: "white"
                size: 25
                icon: "\uf0de"

                anchors.centerIn: parent
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    if(value < to)
                    {
                        value += interval;
                    }
                }
            }
        }

        Rectangle
        {
            color: "#f8f9fa"
            Layout.fillWidth: true
            Layout.fillHeight: true

            AppText
            {
                color: "black"
                size: 25
                text: value<10? "0"+value.toString():value.toString()

                anchors.centerIn: parent
            }
        }

        Rectangle
        {
            Layout.fillWidth: true
            Layout.preferredHeight: 30

            color: Qt.lighter("#002e4d")

            AppIcon
            {
                color: "white"
                size: 25
                icon: "\uf0dd"

                anchors.centerIn: parent
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    if(value > from)
                    {
                        value -= interval;
                    }
                }
            }
        }
    }
}
