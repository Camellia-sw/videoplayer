import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

Rectangle{
    Layout.fillWidth: true;
    height:60

    color:"#f0f0f0"
    RowLayout{
        anchors.fill:parent

        ToolButton{
            action:actions.pre

                onClicked: {
                    rootWindow.curIndex--
                    //mainItem.curIndex%=mainItem.allCount
                    console.log("上一曲：",rootWindow.curIndex)
                    PlayerList.setListIndex(rootWindow.curIndex)
                }
        }
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



        ToolButton{
            action: actions.voice
            onClicked: {
                screenShotCom.source = "Screenshot.qml";
            }
        }

        Loader{
            id: screenShotCom
            onLoaded: {
                item.closing.connect(function (){
                    screenShotCom.source = "";
                });
            }
        }

        Slider{
            id:slider_voice
            Layout.preferredWidth: parent.width/10
            Layout.fillWidth: true
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
