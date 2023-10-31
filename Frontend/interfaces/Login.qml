import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 6.5

// import UntitledProject
Item {
    id: loginItem

    visible: true

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
                id: tfEmail

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

            // Button {
            //     id: button
            //     text: "click Me"

            //     onClicked: {
            //         // ====================
            //         response = "";
            //         status = "";
            //         stackView.push("Home.qml");
            //         // ====================
            //     }
            // }
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

            onClicked: {
                var email = tfEmail.text;
                var password = tfPassword.text;
                if (email.trim() !== "" && password.trim() !== "") {
                    var request = createRequest();

                    // Set the request URL and method
                    request.open("POST", "http://localhost/backend/login.php", true);
                    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    // Prepare the request data
                    status = "Preparing request data...";
                    var requestData = "submit=&email=" + encodeURIComponent(email) + "&password=" + encodeURIComponent(password);

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

            anchors.top: btLogin.bottom
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
                        stackView.push("Register.qml");
                    }
                }
            }
        }
    }

    // Dialog {
    //     id: dialog
    //     title: "Response"
    //     visible: false
    //     anchors.centerIn: parent
    //     standardButtons: Dialog.Ok | Dialog.Cancel

    //     onAccepted: console.log("Ok clicked")
    //     onRejected: console.log("Cancel clicked")
    //     Text {
    //         text: "Response: " + response
    //     }
    // }
}
