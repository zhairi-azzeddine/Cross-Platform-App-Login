import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 6.5

Item {
    id: homeItem

    visible: true

    property string userName: ""

    function loadData() {
        var request = createRequest();

        // Prepare the request data
        request.open("POST", "http://localhost/backend/index.php", true);
        request.setRequestHeader("Content-Type", "application/x-www-form-urlenconded");

        // Handle the response
        status = "Handling response...";
        request.onreadystatechange = function () {
            if (request.readyState === XMLHttpRequest.DONE) {
                var serverResponse = JSON.parse(request.responseText); // Parse the JSON response
                if (response.status === 200) {
                    status = serverResponse.status;
                    response = serverResponse.message;
                    tfName.text = serverResponse.data;
                    console.log("User name: ", serverResponse.data);
                } else {
                    status = serverResponse.status;
                    response = serverResponse.message;
                    console.log("User name: ", serverResponse.data);
                    tfName.text = serverResponse.data;
                    console.error("Request failed with status: ", serverResponse.message);
                }
            }
        };

        // Send the request
        request.send();
    }

    function initialize() {
        response = "";
        status = "";
        loadData();
    }

    Component.onCompleted: {
        initialize();
    }

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
            text: qsTr("Home")
            font.pixelSize: 25
            font.bold: true
        }

        Rectangle {
            id: textRec

            anchors {
                left: parent.left
                right: parent.right
                top: txtTitle.bottom
                topMargin: -20
                // bottom: btRegister.top
            }
            width: tfStartWorld.width + 8 + tfName.width
            height: tfName.height
            color: "transparent"
            anchors.centerIn: parent

            Text {
                id: tfStartWorld
                text: qsTr("Hello Mr.")
                font.pixelSize: 25
            }

            Text {
                id: tfName

                text: qsTr("")
                font.pixelSize: 25
                anchors.left: tfStartWorld.right
                anchors.top: tfStartWorld.top
                anchors.leftMargin: 8
            }
        }

        Text {
            id: registerText
            visible: true

            anchors.top: textRec.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("you don't have an acount Register from")
            font.pixelSize: 12

            Text {

                text: qsTr("Here")
                anchors.left: registerText.right
                anchors.leftMargin: 5
                color: "blue"

                Button {
                    anchors.fill: parent
                    opacity: 0
                    onClicked: {
                        registerText.color = "red";
                    }
                }
            }
        }

        Button {
            id: btlogout

            anchors {
                left: parent.left
                right: parent.right
                top: registerText.bottom
                leftMargin: 10
                rightMargin: 10
                topMargin: 50
            }
            text: qsTr("Logout")

            onClicked: {
                // Create a new XMLHttpRequest object
                status = "Creating request...";
                var request = new XMLHttpRequest();
                request.open("POST", "http://localhost/backend/logout.php", true);
                request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                // Prepare the request data
                status = "Preparing request data...";
                var requestData = "";

                // Handle the response
                status = "Handling response...";
                request.onreadystatechange = function () {
                    if (request.readyState === XMLHttpRequest.DONE) {
                        if (request.status === 200) {
                            status = "Request successful";

                            // Request successful
                            console.log("Response received:", request.responseText);
                            response = request.responseText;
                            stackView.pop();
                        } else {

                            // Request failed
                            status = "Request failed";
                            console.error("Request failed with status:", request.status);
                        }
                    }
                };
                request.send(requestData);
            }
        }
    }
}
