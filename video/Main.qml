import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Window
import "video.js" as Controller
ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Video Player")
    id:rootWindow

    property int curIndex: 0
    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action:actions.open }
            MenuItem { action:actions.exit }
        }

        Menu{
            title: qsTr("&Help")
            contentData:[ actions.contents,
                actions.about ]
        }
    }

    header: ToolBar {
        RowLayout{
            ToolButton{ action: actions.open }
            ToolButton{
                action:actions.screenshot
                id:screenshotbutton
                onClicked:{
                    //screenshot.shootScreen(screenshotbutton)
                    //screenshot.shootScreenWindow(rootWindow)
                    screenShotCom.source = "screenshot.qml";
               }
            }
            ToolButton{
                action: actions.save
            }
        }
    }

    // Loader{
    //     id: screenShotCom
    //     onLoaded: {
    //         item.closing.connect(function (){
    //             screenShotCom.source = "";
    //         });
    //     }
    // }
    Actions{
        id:actions
        open.onTriggered: content.dialogs.openfile.open()
        save.onTriggered: Controller.save();
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        PlayerList{
            id:playerlist
        }

        Content{
            id:content
            anchors.fill:parent
        }

        Footer{
            id:footer
        }

    }
}

