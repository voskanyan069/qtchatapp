#ifndef SEND_MSG_BUTTON_H
#define SEND_MSG_BUTTON_H

#include <QObject>

class SendMessageButton : public QObject
{
    Q_OBJECT
public:
    explicit SendMessageButton(QObject *parent = 0);
    Q_INVOKABLE void click(QString messageText);

signals:
public slots:
};

#endif // SEND_MSG_BUTTON_H
