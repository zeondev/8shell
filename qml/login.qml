import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    id: window
    width: 400
    height: 515
    visible: true
    title: qsTr("8shell - Login")
    // flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWidnowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    
    QtObject {
        id: internal
        // property string user

        function launchWindow(username) {
            var component = Qt.createComponent("app.qml")
            var win = component.createObject()
            win.username = username
            visible = false
            // win.showExpanded();
            win.showFullScreen()
            // win.show()
        }

        function useOffline() {
            launchWindow("User")
        }

        function checkLogin(username, password) { 
            var http = new XMLHttpRequest()
            var url = "https://zeon.dev/api/users/?u=" + username + "&p=" + password;
            var params = "";
            http.open("POST", url, true);

            // Send the proper header information along with the request
            http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            http.setRequestHeader("Content-length", params.length);
            http.setRequestHeader("Connection", "close");

            http.onreadystatechange = function() { // Call a function when the state changes.
                if (http.readyState == 4) {
                    if (http.status == 200) {
                        console.log("ok", http.responseText)
                        var userjson = JSON.parse(http.responseText)

                        console.log(userjson.success)

                        if (userjson.success == "1") {
                            console.log(userjson)
                            launchWindow(userjson.username)
                        } else {
                            console.log("failed" + userjson)
                        }
                    } else {
                        console.log("error: " + http.status)
                    }
                }
            }

            http.send()
        }
    }
    

    Rectangle {
        id: topBar
        height: 30
        color: Material.color(Material.Blue)
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        // radius: 10

        Text {
            text: qsTr("8Shell - A Zeon Product")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#fff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }
    }

    Image {
        id: img
        width: 175
        height: 175
        source: "../img/8shell.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topBar.bottom
        anchors.topMargin: 30
    }

    TextField {
        id: usernameField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Username...")
        verticalAlignment: Text.AlignVCenter
        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: img.bottom
        anchors.topMargin: 30
    }

    TextField {
        id: passwordField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Password...")
        verticalAlignment: Text.AlignVCenter
        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: usernameField.bottom
        anchors.topMargin: 15
        echoMode: TextInput.Password
    }

    Button {
        id: buttonLogin
        width: 300
        text: qsTr("LOGIN")
        anchors.top: passwordField.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: internal.checkLogin(usernameField.text, passwordField.text)
    }

    Button {
        id: buttonLogin2
        width: 300
        text: qsTr("USE OFFLINE")
        anchors.top: buttonLogin.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: internal.useOffline()
    }
}