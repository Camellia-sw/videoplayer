import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame{
    id:frame
    anchors.right: parent.right
    Layout.preferredWidth: 200
    Layout.fillHeight: true
    padding:0

    Text{
        text: "播放列表"
        width:parent.width
        font.pointSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    ListView{
        anchors.fill:parent
        clip:true

    }


}
