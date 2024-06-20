import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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

        ToolButton{ action:actions.pre}
        ToolButton{ action:actions.back}
        ToolButton{ action:actions.pause}
        ToolButton{ action:actions.forward}
        ToolButton{ action:actions.next}

        Actions{
            id:actions
            pause.onTriggered: content.setImageFillMode(Image.Pause)
            back.onTriggered: content.setImageFillMode(Image.Back)
            forward.onTriggered: content.setImageFillMode(Image.Forward)
            pre.onTriggered: content.setImageFillMode(Image.Pre)
            next.onTriggered: content.setImageFillMode(Image.Next)
        }
    }


}
