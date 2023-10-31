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
        height: 480
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
            anchors{
                horizontalCenter: parent.horizontalCenter
                top: mainRec.top
                topMargin: 20
            }
            text: qsTr("Register")
            font.pixelSize: 25
            font.bold: true
        }

        GridLayout {
            id: gridInput

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: txtTitle.bottom
            anchors.bottom: btRegister.top
            anchors.margins: 10
            columns: 2

            Label {
                id: lbUserName

                text: qsTr("User Name:")
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
                id: lbEmail

                text: qsTr("Email:")
                font.pixelSize: 22
                font.family: "Aial"
            }
            TextField {
                id: tfEmail

                Layout.fillWidth: true
                placeholderText: qsTr("Email...")
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
            }


        }

        Button {
            id: btRegister

            text: qsTr("Register")
            anchors
            {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                leftMargin: 10
                rightMargin: 10
                bottomMargin: 50

            }
        }

    }
}
