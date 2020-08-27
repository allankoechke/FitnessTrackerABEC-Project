import QtQuick 2.0
import QtQuick.Layouts 1.3

import "../views"
import "../components"

Item {
    Layout.fillWidth:  true
    Layout.preferredHeight: 40

    property alias textInput: textInput
    property string hintText
    property bool isPassword: false

    Rectangle
    {
        color: "grey"
        height: 2
        width: parent.width

        anchors.bottom: parent.bottom
    }

    TextInput
    {
        id: textInput
        font.family: monsterratFontLoader.name
        color: "black"
        height: parent.height*0.8
        font.pixelSize: 17
        echoMode: isPassword? TextInput.Password:TextInput.Normal
        clip: true
        verticalAlignment: TextInput.AlignVCenter

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20

        AppText
        {
            color: "grey"
            text: hintText
            size: parent.font.pixelSize-2
            visible: parent.text===""

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
