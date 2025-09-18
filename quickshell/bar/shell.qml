import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Variants {
  model: Quickshell.screens

  delegate: Component {
    PanelWindow {
      required property var modelData  // será cada pantalla

      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }
      height: 40
      color: "transparent"

      RowLayout {
        anchors.fill: parent
        anchors.margins: 6
        spacing: 8

        // Por ejemplo, left container: workspaces
        Row {
          spacing: 6

          Repeater {
            model: Hyprland.workspaces

            Rectangle {
              id: wsItem
              property bool isActive: modelData.id === Hyprland.focusedWorkspace.id

              width: isActive ? 40 : 30
              height: isActive ? 34 : 30
              radius: 6
              color: isActive ? "#88C0D0" : "#4C566A"

              Behavior on width { NumberAnimation { duration: 200; easing.type: Easing.OutCubic } }
              Behavior on height { NumberAnimation { duration: 200; easing.type: Easing.OutCubic } }
              Behavior on color { ColorAnimation { duration: 200 } }

              Text {
                anchors.centerIn: parent
                text: modelData.name
                color: "white"
                font.pixelSize: 12
              }

              MouseArea {
                anchors.fill: parent
                onClicked: modelData.activate()
              }
            }
          }
        }

  // 🟨 Centro
    Rectangle {
      Layout.alignment: Qt.AlignHCenter
      Layout.fillWidth: true
      height: 30
      radius: 6
      color: "#88C0D0"
      Text {
        anchors.centerIn: parent
        text: "Center"
        color: "black"
      }
    }
        // center & right bloques ...
        //  // 🟥 Derecha
    Rectangle {
      Layout.alignment: Qt.AlignRight
      width: 100; height: 30
      radius: 6
      color: "#A3BE8C"
      Text {
        anchors.centerIn: parent
        text: "Right"
        color: "white"
      }
    }
      }
    }
  }

}

