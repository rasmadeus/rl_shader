import QtQuick 2.3

Item {
    Row {
        id: root

        property int side: 200

        anchors.centerIn: parent
        spacing: 20

        Image {
            id: sourceImage
            width: root.side
            height: root.side
            source: 'tulip.png'
            visible: false
        }

        Rectangle {
            width: root.side
            height: root.side
            color: '#333333'
        }

        ShaderEffect {
            id: genieEffect

            property variant source: sourceImage
            property bool minimized: false
            property real minimize: 0.0

            width: root.side
            height: root.side

            SequentialAnimation on minimize {
                id: animMinimize
                running: genieEffect.minimized
                PauseAnimation { duration: 300 }
                NumberAnimation { to: 1; duration: 700; easing.type: Easing.InOutSine }
                PauseAnimation { duration: 1000 }
            }

            SequentialAnimation on minimize {
                id: animNormalize
                running: !genieEffect.minimized
                NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
                PauseAnimation { duration: 1300 }
            }

            vertexShader: "
                uniform highp mat4 qt_Matrix;
                attribute highp vec4 qt_Vertex;
                attribute highp vec2 qt_MultiTexCoord0;
                varying highp vec2 qt_TexCoord0;
                uniform highp float minimize;
                uniform highp float width;
                uniform highp float height;
                void main() {
                    qt_TexCoord0 = qt_MultiTexCoord0;
                    highp vec4 pos = qt_Vertex;
                    pos.y = mix(qt_Vertex.y, height, minimize);
                    pos.x = mix(qt_Vertex.x, width, minimize);
                    gl_Position = qt_Matrix * pos;
            }"

            MouseArea {
                anchors.fill: parent
                onClicked: genieEffect.minimized = !genieEffect.minimized
            }
        }
    }
}
