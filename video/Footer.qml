import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import BarrageModels 1.0
import "video.js" as Controller

Rectangle{
    id:footer
    Layout.fillWidth: true;
    height:50
    anchors.bottom: parent.bottom
    color:"#C0D9D9"

    ColumnLayout{
        anchors.fill:parent
        RowLayout{


            ToolButton{
                action:actions.pre
                onClicked: {
                    content.curIndex---
                    console.log("上一个：",content.curIndex)
                    playerlist.setListIndex(content.curIndex)
                }
            }
            ToolButton{
                action:actions.pause
                onClicked:{
                    Controller.pause()
                }
                onDoubleClicked: {
                    content.mediaPlayer.play()
                }
            }
            ToolButton{
                action:actions.next
                onClicked: {
                    content.curIndex+++
                    console.log("下一个：",content.curIndex)
                    playerlist.setListIndex(content.curIndex)
                }
            }

            Slider{
                id:slider
                width:parent.width
                Layout.fillWidth: true
                height:25
                value:content.mediaPlayer.position/content.mediaPlayer.duration

                onMoved:{//监听句柄移动,句柄发生移动时触发
                    content.mediaPlayer.setPosition(Math.floor(value*content.mediaPlayer.duration))
                    //拖动或点击改变进度条位置时，更新播放进度
                }
            }

            ToolButton{action: actions.voice}


            Slider{
                id:slider_voice
                Layout.preferredWidth: parent.width/10
                height:25
                onMoved:{
                    content.audio.volume = slider_voice.value
                }
            }
            TextField {
                    id: inputField
                    Layout.fillWidth: true
                }
            Button{
                text:"Send"
                width:100
                height: 20
                anchors.left: inputField.right
                onClicked: {
                    var text = inputField.text;
                    barrageModel.addBarrage(text);
                    inputField.clear();
                }
            }
            ToolButton{
                icon.source: "qrc:/images/play-list"
                onClicked: {
                    playerlist.visible=true
                }
                onDoubleClicked: {
                    playerlist.visible=false
                }
            }

        }
    }
}
