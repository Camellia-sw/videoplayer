import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Component {
    Item {
        id: barrageItem
        width: ListView.view.width // 弹幕宽度与ListView宽度一致
        height: 30 // 弹幕高度可以根据需要调整

        TextArea {
            id: barrageText
            text: model.barrage // 假设模型中有一个名为'barrage'的角色
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.leftMargin: 10 // 左边距
            font.pixelSize: 18 // 字体大小
            color: "black" // 字体颜色
            // 可以添加更多自定义样式，如背景、边框等
        }

        // 可以添加动画效果，如淡入淡出、移动等
        // 示例：使用NumberAnimation实现弹幕从右至左的移动效果
        NumberAnimation {
            id: moveAnimation
            target: barrageItem
            property: "x"
            //from: parent.width
            to: -parent.width
            duration: 10000 // 弹幕移动的时间
            easing.type: Easing.Linear // 匀速移动
            onStarted: {
                // 当动画开始时，可以设置弹幕的不透明度等属性
            }
            onFinished: {
                // 当动画结束时，可以选择销毁该弹幕元素或者进行其他操作
                barrageItem.destroy()
            }
        }

        Component.onCompleted: {
            // 当弹幕元素完成时，开始移动动画
            moveAnimation.start()
        }
    }
}
