import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

import "video.js" as Controller

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Video Clip")

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action:actions.open }
            MenuItem { action:actions.exit }
        }

        Menu{
            title: qsTr("&Help")
            MenuItem{ action:actions.contents}
            MenuItem{ action:actions.about }
        }

        Menu{
            title: qsTr("&倍速")
            MenuItem { action:actions.half }
            MenuItem { action:actions.one }
            MenuItem { action:actions.two }
        }
    }

    header: ToolBar {
        RowLayout{
            ToolButton{ action: actions.open }
            ToolButton{ action: actions.folder }
        }
    }

    Actions{
        id:actions
        open.onTriggered: content.dialogs.openfile.open()
        folder.onTriggered: content.dialogs.folderOpen.open()
        half.onTriggered: Controller.half()
        one.onTriggered: Controller.one()
        two.onTriggered: Controller.two()
    }

    Content{
        id:content
        anchors.fill: parent
    }


    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        Frame{
            anchors.right: parent.right
            Layout.preferredWidth: 200
            Layout.fillHeight: true
            padding:0
        }
        //页脚
        Footer{
            id:footer
        }

    }
}

