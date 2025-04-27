import QtQuick 2.15

import Common 1.0 as Common
import Pages 1.0 as Pages

TopPanel_Form {
    id: topPanel

    signal back()
    signal next(Component page)

    onSettingButtonClicked: {
        next(Pages.PageFactory.getLoginPage(Common.Enums.PageEnumeration.MAIN_MENU_PAGE));
    }

    // ...
} // TopPanel_Form
