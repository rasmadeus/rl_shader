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
        }

        ShaderEffect {
            property variant source: sourceImage
            property real frequency: 8
            property real amplitude: 0.2
            property real time: 0.0

            NumberAnimation on time {
                from: 0.0
                to: 2 * Math.PI
                loops: Animation.Infinite
            }

            width: root.side
            height: root.side
            
            fragmentShader: "
                uniform lowp float qt_Opacity;
                varying highp vec2 qt_TexCoord0;
                uniform sampler2D source;
                uniform highp float frequency;
                uniform highp float amplitude;
                uniform highp float time;

                void main() {
                    highp float y = amplitude * sin(time + frequency * qt_TexCoord0.x);
                    highp vec2 coord = vec2(qt_TexCoord0.x, qt_TexCoord0.y + y);
                    gl_FragColor = texture2D(source, coord) * qt_Opacity;
                }"
        }
    }
}
