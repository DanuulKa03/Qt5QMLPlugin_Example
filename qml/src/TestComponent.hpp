#pragma once

#include <QObject>

class TestComponent : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)

    public:
    explicit TestComponent(QObject *parent = nullptr);
    QString text() const;
    void setText(const QString &text);
    signals:
      void textChanged();
private:
    QString m_text;
}