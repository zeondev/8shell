import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    id: window
    visible: true
    width: 700
    height: 500
    visibility: ApplicationWindow.FullScreen
    title: qsTr("8shell")

    property string username: "User"
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue
    
    QtObject {
        id: internal
        // JavaScript Here!!!
        function test() {
            console.log("test")
        }
        function closeWindow(window) {
            window.visible = false
        }
    }

    // Item manager
    Rectangle {
        id: itemManager
        width: parent.width
        height: 40
        color: "#141414"
        anchors.bottom: parent.bottom
    }

    Rectangle {
        id: fileTop
        width: parent.width
        height: 25
        color: "#141414"
        anchors.top: parent.top
        Text {
            text: qsTr("Welcome, " + window.username)
            color: "#fff"
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    
    // Welcome app
    Rectangle {
        id: welcomeApp
        visible: true
        color: "#2e2e2e"
        Button {
            id: welcomeAppClose
            highlighted: true
            Material.background: Material.Pink
            anchors.top: welcomeApp.top
            width: 20
            anchors.left: welcomeApp.left
            onClicked: internal.closeWindow(welcomeApp)
        }
        anchors {
            left: parent.left
            right: parent.right
            top: fileTop.bottom
            bottom: itemManager.top
        }

        
        Rectangle {
            // Content

            anchors {
                top: welcomeAppClose.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            color: "transparent"
            Text {
                text: qsTr("")
            }
        }
            
    }

}