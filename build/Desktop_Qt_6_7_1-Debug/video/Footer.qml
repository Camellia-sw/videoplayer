import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
    Layout.fillWidth: true;
    height:60



    RowLayout{
        anchors.fill:parent

        ToolButton{ action:actions.pre}
        ToolButton{ action:actions.back}
        ToolButton{ action:actions.pause}
        ToolButton{ action:actions.forward}
        ToolButton{ action:actions.next}

        Slider{
            id:slider
            width:parent.width
            Layout.fillWidth: true
            height:25
        }



        ToolButton{action: actions.voice}
        Slider{
            id:slider_voice
            Layout.preferredWidth: parent.width/5
            //width:parent.width
            //Layout.fillWidth: true
            height:25
        }



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
