#include "send_msg_button.h"
#include <QDebug>

SendMessageButton::SendMessageButton(QObject *parent) :
    QObject(parent)
{
}

void SendMessageButton::click(QString messageText)
{
qDebug() << "Message from QML: " << messageText;
}
