import QtQuick 2.12
import QtQuick.Controls 2.12
import TaoQuick 1.0
import "qrc:/TaoQuick"
Item {
    anchors.fill: parent
    Image {
        id: src
        source: imgPath + "Effect/Girls/girl5.jpeg"
        visible: false
    }
    Image {
        id: dissolveSrc1
        source: imgPath + "Effect/Dissolve_1.jpg"
        visible: false
    }
    Image {
        id: dissolveSrc2
        source: imgPath + "Effect/Dissolve_2.png"
        visible: false
    }
    Row {
        anchors.centerIn: parent
        spacing: 40
        ADissolve {
            id: a1
            width: 250
            height: 375
            duration: 1800
            effectSource.sourceItem: src
            dissolveSource.sourceItem: dissolveSrc1
        }
        ADissolve {
            id: a2
            width: 250
            height: 375
            duration: 1800
            effectSource.sourceItem: src
            dissolveSource.sourceItem: dissolveSrc2
        }
    }
    Component.onCompleted: {
        ani.start()
    }
    SequentialAnimation {
        id: ani
        ScriptAction {script: {a1.restart() } }
        PauseAnimation {duration: 2000}
        ScriptAction {script: {a2.restart() } }
    }
    Button {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        text: "replay"
        onClicked: {
            ani.restart()
        }
    }
}
