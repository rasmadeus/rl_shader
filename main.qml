import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
	width: 512
	height: 512

	ShaderEffect {
		anchors.fill: parent
		property color animatedColor
		SequentialAnimation on animatedColor {
			loops: Animation.Infinite
			ColorAnimation { from: "#0000ff"; to: "#00ffff"; duration: 500 }
			ColorAnimation { from: "#00ffff"; to: "#00ff00"; duration: 500 }
			ColorAnimation { from: "#00ff00"; to: "#00ffff"; duration: 500 }
			ColorAnimation { from: "#00ffff"; to: "#0000ff"; duration: 500 }
		}
 
		blending: false
		fragmentShader: "
			varying mediump vec2 qt_TexCoord0;
			uniform lowp float qt_Opacity;
			uniform lowp vec4 animatedColor;
 
			void main() {
				gl_FragColor = animatedColor * qt_Opacity;
 
				if (qt_TexCoord0.x < 0.25) {
					gl_FragColor.g = 0.0;
				}
			}
		"
	}
}