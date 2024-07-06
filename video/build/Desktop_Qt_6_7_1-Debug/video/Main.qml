import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Window
import BarrageModels 1.0
ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Video Player")
    id:rootWindow

    BarrageModel{
        id:barrageModel
    }
    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action:actions.open }
            MenuItem { action:actions.exit }
        }

     }

    header: ToolBar {
        RowLayout{
            ToolButton{ action: actions.open }
        }
    }

    Actions{
        id:actions
        open.onTriggered: content.dialogs.openfile.open()
    }



    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        Content{
            id:content
            anchors.fill:parent
            //弹幕显示区域
            ListView {
                id: barrageView
                anchors.fill: parent
                model: barrageModel
                delegate: BarrageDelegate {} // 自定义的代理用于显示弹幕
            }

            PlayerList{
                id:playerlist
                visible:false
                anchors.bottom: parent.bottom
                anchors.right: parent.right
            }

        }
        Footer{
            id:footer
        }
    }
}

