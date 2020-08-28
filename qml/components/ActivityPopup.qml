import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Popup {
    id: root

    width: 300
    height: 300

    property bool isWorkoutSet: false

    contentItem: Rectangle
    {
        color: "#002e4d"
        anchors.fill: parent

        border.color: Qt.darker("#002e4d")
        border.width: 1

        ColumnLayout
        {
            anchors.fill: parent

            AppText
            {
                color: "white"
                size: 18
                font.bold: true
                text: qsTr("Workout Time")

                Layout.preferredHeight: 30
                Layout.alignment: Qt.AlignHCenter
                verticalAlignment: AppText.AlignVCenter
            }

            Rectangle
            {
                color: "grey"
                Layout.fillWidth: true
                Layout.preferredHeight: 1
            }

            Item
            {
                Layout.fillWidth: true
                Layout.fillHeight: true

                AppText
                {
                    color: "white"
                    size: 17
                    text: isWorkoutSet? qsTr("Workout session time set"):qsTr("Set a workout session time")

                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.leftMargin: 20
                    anchors.left: parent.left
                }

                RowLayout
                {
                    anchors.centerIn: parent

                    CustomSpinBox
                    {
                        id: _from
                        from: 0; to: 24
                        height: 100
                        width: 100
                        value: 16
                    }

                    AppText{
                        color: "white"
                        size: 40
                        font.bold: true
                        text: qsTr(" : ")

                        Layout.alignment: Qt.AlignVCenter
                    }

                    CustomSpinBox
                    {
                        id: _to
                        from: 0; to: 59
                        height: 100
                        width: 100
                        value: 30
                    }
                }

                Rectangle
                {
                    color: Qt.lighter("#002e4d")
                    width: 70
                    height: 30
                    radius: height/2
                    border.color: "#ff9000"
                    border.width: 1

                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.bottomMargin: 20
                    anchors.rightMargin: 20

                    AppText
                    {
                        anchors.centerIn: parent
                        text: qsTr("ADD")
                        color: "white"
                        size: 15
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: {
                            var status = addWorkoutDay(selected, _from.value, _to.value)
                            console.log(status)
                            if(selected === today)
                            {
                                if(checkIfDayExists(selected)){
                                    var arr = getTimeSaved(today)
                                    console.log(arr)
                                    var a = arr[0]<10? "0"+arr[0].toString():arr[0].toString()
                                    var b = arr[1]<10? "0"+arr[1].toString():arr[1].toString()
                                    setTime = a + ":" + b;
                                }
                            }

                            root.close();
                        }
                    }
                }
            }
        }
    }
}
