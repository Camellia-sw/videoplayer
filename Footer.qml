//页脚
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "video.js" as Controller


Rectangle{
    Layout.fillWidth: true;
    height:60
    //控制进度条
    Slider{
        id:slider
        width:parent.width
        Layout.fillWidth: true
        height:4
        value:content.mediaPlayer.position/content.mediaPlayer.duration

        onMoved:{//监听句柄移动,句柄发生移动时触发
            content.mediaPlayer.setPosition(Math.floor(value*content.mediaPlayer.duration))
            //拖动或点击改变进度条位置时，更新播放进度
        }
    }

    RowLayout{
        anchors.fill:parent
        ToolButton{action: actions.voice}
        //控制音量条
        Slider{
            id:slider_voice
            width:parent.width
            Layout.fillWidth: true
            height:25

            onMoved:{
                content.audio.volume = slider_voice.value
            }
        }


        ToolButton{ action:actions.pre}//上一个
        ToolButton{ action:actions.back}//快退
        ToolButton{ action:actions.pause}//暂停
        ToolButton{ action:actions.forward}//快进
        ToolButton{ action:actions.next}//下一个
        Button{
            text:"截屏"
            onClicked: {
                // 在这里调用 Video.js 的截屏函数
                   video.takeSnapshot(function(dataUrl) {
                     // 在这里处理截屏图像，例如显示在屏幕上或保存到文件
                     console.log(dataUrl);
                   }
                   )
            }
        }


        Actions{
            id:actions
            pause.onTriggered:Controller.pause()
            forward.onTriggered: Controller.forward()
        }

    }


}
