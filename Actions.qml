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
    property alias stop: _stop
    property alias play: _play
    property alias pausetop: _pausetop

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
        id: _play
        text: qsTr("&play")
        icon.name: "media-playback-playing"
    }
    Action {
        id: _stop
        text: qsTr("&Stop")
        icon.name: "media-playback-stopped"
    }
    Action {
        id: _pausetop
        text: qsTr("&Pause")
        icon.name: "media-playback-paused"
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

}

