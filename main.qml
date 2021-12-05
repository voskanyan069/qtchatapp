import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.12
import SendMessageButton 1.0

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

        if (messagesLayout.width == 300) {
            chatsLayout.width = width - 300
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

        ColumnLayout {
            id: messagesLayout
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 300
            Layout.preferredWidth: 300
            spacing: 0

            Rectangle {
                id: messageListLayout
                color: 'teal'
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    anchors.centerIn: parent
                    text: parent.width + 'x' + parent.height
                }
            }

            RowLayout {
                id: messageInputLayout
                Layout.fillWidth: true
                Layout.fillHeight: false
                height: 50
                Layout.maximumHeight: 100
                Layout.alignment: Qt.AlignBottom

                ScrollView {
                    id: messageScrollBar
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    TextArea {
                        id: messageInput
                        wrapMode: TextArea.Wrap
                        selectByMouse: true
                        selectByKeyboard: true
                        placeholderText: qsTr("Enter message...")
                    }
                }

                Button {
                    id: sendMessageBtn
                    height: 50
                    text: qsTr("Send")
                    enabled: messageInput.length > 0
                    onClicked: {
                        sendMessageBtnObj.click(messageInput.text)
                        messageInput.text = '';
                    }

                    SendMessageButton {
                        id: sendMessageBtnObj
                    }
                }
            }
        }
    }
}
