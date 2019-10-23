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
            width: root.side
            height: root.side
            
            fragmentShader: "
                uniform lowp float qt_Opacity;
                void main() {
                    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0) * qt_Opacity;
                }"
        }

        ShaderEffect {
            width: root.side
            height: root.side
            
            property variant source: sourceImage
            property real redChannel: 0.3

            fragmentShader: "
                varying highp vec2 qt_TexCoord0;
                uniform sampler2D source;
                uniform lowp float qt_Opacity;
                uniform lowp float redChannel;
                void main() {
                    gl_FragColor = texture2D(source, qt_TexCoord0) * vec4(redChannel, 1.0, 1.0, 1.0) * qt_Opacity;
                }"
        }

        ShaderEffect {
            width: root.side
            height: root.side

            property variant source: sourceImage
            property real redChannel: 0.0

            NumberAnimation on redChannel {
                from: 0.0
                to: 1.0
                duration: 1000
                loops: Animation.Infinite
            }

            fragmentShader: "
                varying highp vec2 qt_TexCoord0;
                uniform sampler2D source;
                uniform lowp float qt_Opacity;
                uniform lowp float redChannel;
                void main() {
                    gl_FragColor = texture2D(source, qt_TexCoord0) * vec4(redChannel, 1.0, 1.0, 1.0) * qt_Opacity;
                }"
        }
    }
}
