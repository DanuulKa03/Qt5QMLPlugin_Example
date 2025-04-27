include "TestComponent.h"

QString TestComponent::text() const {
    return this->m_text;
}

void TestComponent::setText(const QString &text) {
    this->m_text = text;
    emit textChanged();
}