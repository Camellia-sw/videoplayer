import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Window{
    width: 400
    height: 200
    visible: true
    title: qsTr("Screen Shot")

    ToolBar {
        RowLayout{
            ToolButton{ action: actions.open }
            ToolButton{
                action:actions.screenshot
                id:screenshotbutton
                onClicked:{
                    screenshot.shootScreen(screenshotbutton)
                    screenshot.shootScreenWindow(rootWindow)
               }
            }
        }
    }
}
