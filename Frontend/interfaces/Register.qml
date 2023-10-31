import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 6.5

Item {
    id: rectangle

    visible: true

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
            anchors {
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
                echoMode: TextField.Password
            }
        }

        Button {
            id: btRegister

            text: qsTr("Register")
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                leftMargin: 10
                rightMargin: 10
                bottomMargin: 50
            }
            onClicked: {
                var username = tfUserName.text;
                var email = tfEmail.text;
                var password = tfPassword.text;
                if (username.trim() !== "" && email.trim() !== "" && password.trim() !== "") {
                    var request = createRequest();

                    // Set the request URL and method
                    request.open("POST", "http://localhost/backend/register.php", true);
                    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    // Prepare the request data
                    status = "Preparing request data...";
                    var requestData = "submit=&username=" + encodeURIComponent(username) + "&email=" + encodeURIComponent(email) + "&password=" + encodeURIComponent(password);

                    // Handle the response
                    status = "Handling response...";
                    request.onreadystatechange = function () {
                        if (request.readyState === XMLHttpRequest.DONE) {
                            var serverResponse = JSON.parse(request.responseText); // Parse the JSON response
                            if (request.status === 200) {
                                console.log("Response received:", request.responseText);
                                status = serverResponse.status;
                                response = serverResponse.message;
                                stackView.push("Home.qml");
                            } else {

                                // Request failed
                                status = serverResponse.status;
                                response = serverResponse.message;
                                console.error("Request failed with status:", request.status);
                            }
                        }
                    };

                    // Send the request
                    request.send(requestData);
                } else {
                    console.error("Please enter a valid name");
                }
            }
        }

        Text {
            id: registerText

            anchors.top: btRegister.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("you have an acount Login from")
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
                        stackView.pop();
                    }
                }
            }
        }
    }
}
