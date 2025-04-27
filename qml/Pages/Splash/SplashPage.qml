import QtQuick 2.15
import QtQuick.Controls 2.15

import Common 1.0 as Common
import Pages 1.0 as Pages

SplashPage_Form {
    id: formSplashPage

    onSplashPageClicked: {
        next(Pages.PageFactory.getLoginPage(Common.Enums.PageEnumeration.AUTHENTICATION_PAGE));
    }
} // SplashPage_Form
