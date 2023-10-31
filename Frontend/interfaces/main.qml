import QtQuick 6.4
import QtQuick.Controls 6.5
import QtWebSockets
import mainLib 1.0

Window {
    id: window

    width: 430
    height: 932
    title: qsTr("Auth App" + " | Response: " + response + " | Status: " + status)
    visible: true
    color: "#ccc"

    property string response: ""
    property string status: ""

    function createRequest() {
        // Create a new XMLHttpRequest object
        status = "Creating request...";
        var request = new XMLHttpRequest();
        return request;
    }

    WebSocket {
        id: socket
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Login {
            id: login
        }
    }

    Row {
        spacing: 20
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: responseText
            text: "Response: " + response
        }
        Text {
            id: statusText
            text: "Status: " + status
        }
    }
}
