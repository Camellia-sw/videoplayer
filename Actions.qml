import QtQuick
import QtQuick.Controls

Item {
    property alias open: _open
    property alias folder: _folder
    property alias pause: _pause
    property alias back: _back
    property alias forward: _forward
    property alias pre: _pre
    property alias next: _next
    property alias about: _about
    property alias contents: _contents
    property alias exit: _exit
    property alias voice: _voice
    property alias one:_one
    property alias two:_two
    property alias half:_half

    Action {
        id: _open
        text: qsTr("&OpenFile...")
        icon.name: "document-open"
        shortcut: "StandardKey.Open"
    }

    Action {
        id: _folder
        text: qsTr("OpenFol&der...")
        icon.name: "document-open-recent"
        shortcut: "Ctrl + d"
    }

    Action {
        id: _voice
        icon.source:"qrc:/images/video"
    }

    Action {
        id: _pre
        icon.source: "qrc:/images/pre"
    }


    Action {
        id: _back
        icon.source: "qrc:/images/back"

    }

    Action {
        id: _pause
        icon.source: "qrc:/images/pause"
    }
    Action {
        id: _forward
        icon.source: "qrc:/images/forward"
    }



    Action {
        id: _next
        icon.source: "qrc:/images/next"
    }
    Action {
        id: _exit
        text: qsTr("E&xit")
        icon.name: "application-exit"
        shortcut: "Ctrl+q"
        onTriggered: Qt.quit();
    }

    Action{
        id: _contents
        text:qsTr("&contents")
        icon.name:"help-contents"
    }

    Action {
        id: _about
        text: qsTr("&About")
        icon.name: "help-about"
    }

    Action{
        id:_half
        text:qsTr("&0.5x")
        icon.name: "half"

    }

    Action{
        id:_one
        text:qsTr("&1x")
        icon.name: "one"
    }

    Action{
        id:_two
        text:qsTr("&2x")
        icon.name: "two"
    }
}

