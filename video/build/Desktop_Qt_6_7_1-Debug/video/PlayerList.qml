import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import PlayedVideo 1.0
Frame{
    id:frame
    anchors.right: parent.right
    Layout.preferredWidth: 200
    Layout.fillHeight: true
    padding:0



    // Text{
    //     text: "播放列表"
    //     width:parent.width
    //     font.pointSize: 20
    //     horizontalAlignment: Text.AlignHCenter

    // }

    ListView {
        id: playedVideosList
        model: playedVideosModel // 从C++中设置的模型

        delegate: ItemDelegate {
            text: model.name // 显示视频的名字
            // 可以添加其他UI元素，如图片等
        }
    }
}


