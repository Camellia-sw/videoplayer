import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Window
import BarrageModels 1.0
import "video.js" as Controller

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Video Player")
    color:"black"
    BarrageModel{
        id:barrageModel
    }
    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action:actions.open }
            MenuItem { action:actions.exit }
        }
        Menu{
            title: qsTr("&Speed")
            MenuItem { action:actions.half }
            MenuItem { action:actions.one }
            MenuItem { action:actions.two }
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
        half.onTriggered: Controller.half()
        one.onTriggered: Controller.one()
        two.onTriggered: Controller.two()
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
            }
            Connections{   //连接信号
                target: playerlist   //目标id
                onPlayerList:{
                    if(content.audioSource == path)
                    {
                        console.log("重复文件")
                        return
                    }
                    content.audioSource=path
                    content.curIndex=listIndex
                    console.log("当前索引: ",content.curIndex)
                    content.mediaPlayer.play()
                }
            }
        }
        Footer{
            id:footer
        }
    }
}

