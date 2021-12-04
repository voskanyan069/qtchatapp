import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

Window {
    id: mainWindow
    title: qsTr("Chatapp")
    visible: true
    width: 640
    height: 480
    minimumWidth: 300
    minimumHeight: 300
    onWidthChanged: {
        if (width < 375) {
            chatsLayout.visible = false
        } else {
            chatsLayout.visible = true
        }
    }
    SplitView {
        id: mainLayout
        anchors.fill: parent
        orientation: Qt.Horizontal
        Rectangle {
            id: chatsLayout
            width: 200
            Layout.minimumWidth: 75
            color: "lightblue"
        }
        Rectangle {
            id: messagesLayout
            Layout.minimumWidth: 300
            Layout.fillWidth: true
            color: "lightgray"
            onWidthChanged: {
                if (width < 350) {
                    chatsLayout.width = chatsLayout.width - 5;
                }
            }
        }
    }
}
