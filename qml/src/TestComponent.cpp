#include "TestComponent.hpp"

QString TestComponent::text() const {
    return m_text;
}

void TestComponent::setText(const QString &text) {
    this->m_text = text;
    emit textChanged();
}
