/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 6.5
import UntitledProject

Rectangle {
    id: rectangle

    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor

    Rectangle {
        id: mainRec

        width: 380
        height: 350
        radius: 10
        color: "#dcdcdc"
        anchors {
            left: parent.left
            right: parent.right
            margins: 10
            centerIn: parent
        }

        Text {
            id: txtTitle
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: mainRec.top
                topMargin: 20
            }
            text: qsTr("Login")
            font.pixelSize: 25
            font.bold: true
        }

        GridLayout {
            id: gridInput
            rowSpacing: 20

            anchors {
                left: parent.left
                right: parent.right
                top: txtTitle.bottom
                bottom: btRegister.top
                margins: 10
                topMargin: 50
            }
            columns: 2

            Label {
                id: lbUserName

                text: qsTr("Username:")
                font.pixelSize: 22
                font.family: "Aial"
            }
            TextField {
                id: tfUserName

                Layout.fillWidth: true
                placeholderText: qsTr("Username...")
                font.pixelSize: 16
            }

            Label {
                id: lbPassword

                text: qsTr("Password:")
                font.pixelSize: 22
                font.family: "Aial"
            }
            TextField {
                id: tfPassword

                Layout.fillWidth: true
                placeholderText: qsTr("Password...")
                font.pixelSize: 16
                echoMode: TextField.Password
            }
        }

        Button {
            id: btLogin

            anchors {
                left: parent.left
                right: parent.right
                top: gridInput.bottom
                leftMargin: 10
                rightMargin: 10
                topMargin: 50
            }
            text: qsTr("Login")

            onClicked:{
                registerText.text = tfPassword.text
            }
        }
        Text {
            id: registerText

            anchors.top: btLogin.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("you don't have an acount Register from <b><i> Here </i></b>")
            font.pixelSize: 12

            Button{
             anchors.fill: parent
             opacity: 0
             onClicked:{
                registerText.text = "red"
             }
            }


        }
    }
}
