import QtQuick 2
import content.components 1.0

Window {
    color: "red"
    height: 500
    title: qsTr("Hello World!")
    visible: true
    width: 700

    Rectangle {
        id: mainRec
        height: 300
        width: 500
        anchors.centerIn: parent
        color: "f9fabf"
    }
}
