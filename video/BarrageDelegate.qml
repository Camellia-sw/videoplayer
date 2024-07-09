import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Component {
    Item {
        id: barrageItem
        width:parent.width
        height: 30 // 弹幕高度
        property int index: -1 // 用来存储当前弹幕在模型中的索引
        TextArea {
            id: barrageText
            text: model.barrage // 假设有一个名为'barrage'的角色
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.pixelSize: 18 // 字体大小
            color: "white" // 字体颜色
        }

        // 使用NumberAnimation实现弹幕从右至左的移动效果
        NumberAnimation {
            id: moveAnimation
            target: barrageItem
            property: "x"
            to: -parent.width
            duration: 10000 // 弹幕移动的时间
            easing.type: Easing.Linear // 匀速移动
        }
        Component.onCompleted: {
            // 当弹幕元素完成时，开始移动动画
            moveAnimation.start()
        }
    }
}
