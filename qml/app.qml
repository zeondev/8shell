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
            console.log("test");
        }

        function closeWindow(window) {
            window.visible = false
            desktop.visible = true
        }

        function openWindow(window) {
            window.visible = true
            desktop.visible = false
        }
    }

    Rectangle {
        id: fileTop

        width: parent.width
        height: 25
        color: "#0f0f0f"
        anchors.top: parent.top
        Text {
            width: parent.width
            text: qsTr("Welcome, " + window.username)
            color: "#fff"
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: desktop
        visible: true

        anchors {
            top: fileTop.bottom
            bottom: itemManager.top
            left: parent.left
            right: parent.right
        }

        // Background

        Image {
            id: img
            source: "../img/background.jpg"
            anchors.fill: parent.parent
        }

        
        // Launch Settings
    
        Image {
            id: settingsAppLaunch

            height: 55
            width: 55

            source: "../img/settings.png"

            anchors {
                topMargin: 25
                leftMargin: 25
                top: parent.top
                left: parent.left
            }
            

            MouseArea {
                anchors.fill: parent
                onClicked: internal.openWindow(settingsApp)
            }

        }

    }
    // Item manager
    Rectangle {
        id: itemManager
        width: parent.width
        height: 40
        color: "#0f0f0f"
        anchors.bottom: parent.bottom
    }   

    
    // Settings app
    Rectangle {
        id: settingsApp
        visible: false
        color: "#2e2e2e"
        Button {
            id: settingsAppClose
            highlighted: true
            Material.background: Material.Pink
            anchors.top: settingsApp.top
            width: 20
            anchors.left: settingsApp.left
            onClicked: internal.closeWindow(settingsApp)
        }
        Text {
            text: qsTr("Settings")
            color: "#fff"
            font.pointSize: 11
            anchors {
                left: settingsAppClose.right
                verticalCenter: settingsAppClose.verticalCenter 
                leftMargin: 10
            }
        }
        anchors {
            left: parent.left
            right: parent.right
            top: fileTop.bottom
            bottom: itemManager.top
        }

        
        Rectangle {
            // Content

            id: settingsAppContent

            anchors {
                top: settingsAppClose.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                leftMargin: 12
                topMargin: 7
                rightMargin: 12
                bottomMargin:7
            }
            color: "transparent"

            Text {
                anchors.top: parent.top
                font.pointSize: 15
                color: "#ffffff"
                text: qsTr("Settings to 8shell!")
            }
        }
            
    }

}