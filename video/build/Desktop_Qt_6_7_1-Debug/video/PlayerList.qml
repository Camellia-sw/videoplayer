import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
    id:list
    width:200
    height:300
    color:"#C0D9D9"
    property var videoPath
    property var allPath: ["path"]

    signal playerList(string path,int listIndex)

    onVideoPathChanged: {
        listModel.append(videoPath)
        allPath.push(videoPath)
    }

    clip: true

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
            id:listDelegateRect
            height: 45;width: listView.width
            color:"#C0D9D9"
            Text {
                text: allPath[index+1]
                width: listDelegateRect.width-10   //设置宽度
                font.pointSize: 9
                color: "white"
            }
        }
    }

    Component{
        id:listHeader
        Rectangle{
            id:listRect
            color: "#C0D9D9"
            height: 45;width: listView.width
            Text {
                text: "播放列表"
                anchors.centerIn: listRect
                font.pointSize: 13
                color: "white"
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
