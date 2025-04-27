import QtQuick 2.15

import Common 1.0 as Common
import Pages 1.0 as Pages

AuthenticationPage_Form {
    id: formAuthenticationPage

    onLeftButtonClicked: {
        back();
    }

    onRightButtonClicked: {
        next(Pages.PageFactory.getLoginPage(Common.Enums.PageEnumeration.MAIN_MENU_PAGE));
    }
} // AuthenticationPage_Form
