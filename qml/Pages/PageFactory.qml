pragma Singleton

import QtQuick 2.15

import Common 1.0 as Common
import Pages 1.0 as Pages

QtObject {
    id: pageFactory

    function getLoginPage(pageId) {
        var page;

        switch (pageId) {
        case Common.Enums.PageEnumeration.AUTHENTICATION_PAGE:
            page = Qt.createComponent("Login/AuthenticationPage.qml");
            break;
        case Common.Enums.PageEnumeration.MAIN_MENU_PAGE:
            page = Qt.createComponent("Menu/MainMenuPage.qml");
            break;
        default:
            console("---> " + pageId);
        }

        return page;
    }
}
