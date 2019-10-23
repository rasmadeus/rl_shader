import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 1000
    height: 600

    TabView {
        anchors.fill: parent
        Tab {
            title: "Fragment shader"

            FragmentShader{
            }
        }

        Tab {
            title: "Wave effect"
        }
    }
}