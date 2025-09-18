import Quickshell
import QtQuick

ListView {
  width: 300; height: 400

  model: [
    DesktopEntry { path: "/usr/share/applications/firefox.desktop" },
    DesktopEntry { path: "/usr/share/applications/org.gnome.Terminal.desktop" }
  ]

  delegate: Rectangle {
    width: parent.width
    height: 40
    color: "transparent"

    Text {
      anchors.centerIn: parent
      text: model.displayName
      color: "white"
    }

    MouseArea {
      anchors.fill: parent
      onClicked: model.launch()
    }
  }
}
