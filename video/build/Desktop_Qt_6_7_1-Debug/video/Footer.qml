import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import BarrageModels 1.0
Rectangle{
    Layout.fillWidth: true;
    height:60

    color:"#f0f0f0"
    ColumnLayout{

        RowLayout{
            id:playerbutton
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
                Layout.preferredWidth: parent.width/10
                //Layout.fillWidth: true
                height:25
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
                    //if (!text.isEmpty()) {
                        barrageModel.addBarrage(text);
                        inputField.clear();
                    //}
                }
            }
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
