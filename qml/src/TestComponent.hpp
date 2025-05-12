#pragma once

#include <QObject>
#include <QtQml/qqml.h>

class TestComponent : public QObject {
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)

    public:
    explicit TestComponent(QObject *parent = nullptr){};
    QString text() const;
    void setText(const QString &text);
    signals:
      void textChanged();
private:
    QString m_text;
};
