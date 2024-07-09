import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "video.js" as Controller

Rectangle{
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width:200
    height:300
    color:"#C0D9D9"
    clip: true
    property var videoPath
    property var allPath: ["path"]

    signal playerList(string path,int listIndex)

    onVideoPathChanged: {
        listModel.append(videoPath)
        allPath.push(videoPath)
    }
    ListView{
        id:listView
        anchors.fill: parent
        model: ListModel{
            id:listModel
        }

        //重写
        delegate: listDelegate

        ScrollBar.vertical: ScrollBar{
            anchors.right: parent.right
        }
        //头部
        header: listHeader
    }

    Component{
        id:listDelegate
        Rectangle{
            color:"#C0D9D9"
            id:listDelegateRect
            height: 45;width: listView.width
            MouseArea{
                id:mouse
                anchors.fill: parent
                Text {
                    text: allPath[index+1]
                    width: listDelegateRect.width-10   //设置宽度
                    anchors.centerIn: mouse
                    font.pointSize: 9
                    color: "black"
                }
                onClicked: {
                    listDelegateRect.ListView.view.currentIndex = index
                    playerList(allPath[index+1],index)    //告诉主界面改变了索引
                    console.log("onclick currentIndex: "+index)
                }
            }
        }
    }

    Component{
        id:listHeader
        Rectangle{
            id:listRect
            color:"#C0D9D9"
            height: 45;width: listView.width
            Text {
                text: "播放列表"
                anchors.centerIn: listRect
                font.pointSize: 13
            }
        }
    }

    function setListIndex(listCurIndex){
        if(listCurIndex<0)
            listCurIndex=listView.count-1
        else
            listCurIndex%=listModel.count
        listView.currentIndex = listCurIndex
        playerList(allPath[listCurIndex+1],listCurIndex)    //告诉主界面改变了索引
        console.log("function currentIndex: "+listCurIndex)
    }
}
