import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import BarrageModels 1.0

Rectangle{
    id:footer
    Layout.fillWidth: true;
    height:50
    anchors.bottom: parent.bottom
    color:"#C0D9D9"

    ColumnLayout{
        anchors.fill:parent
        RowLayout{


            ToolButton{ action:actions.back}
            ToolButton{ action:actions.pause}
            ToolButton{ action:actions.forward}

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
