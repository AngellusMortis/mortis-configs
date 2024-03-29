import QtQuick 2.0

Rectangle {
  id: button
  radius: 5
  color: focus ? '#80008000' : 'transparent'
  width: 30
  height: 30
  property url normalImg: ''
  property url hoverImg: normalImg
  property url pressImg: normalImg

  signal clicked()
  signal enterPressed()

  onNormalImgChanged: img.source = normalImg

  Image {
    id: img
    anchors.centerIn: parent
    width: parent.width
    height: parent.height
    fillMode: Image.PreserveAspectFit
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    onEntered: img.source = hoverImg
    onPressed: img.source = pressImg
    onExited: img.source = normalImg
    onReleased: img.source = normalImg
    onClicked: button.clicked()
  }
  Component.onCompleted: {
    img.source = normalImg
  }
  Keys.onPressed: {
    if (event.key == Qt.Key_Return || event.key == Qt.Key_Enter) {
      button.clicked()
      button.enterPressed()
    }
  }
}
