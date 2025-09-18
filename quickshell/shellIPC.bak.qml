import Quickshell.Io
import Quickshell              // for PanelWindow
import QtQuick                 // for Text
import QtQuick.Layouts                 // for Text
import QtQuick.Controls                 // for Text
import Quickshell.Hyprland
import Quickshell.Services.Mpris   // <- correct import

FloatingWindow {

    visible: true
  Rectangle {
    id: rect
    anchors.centerIn: parent
    width: 100
    height: 100
    color: "red"
  }

  IpcHandler {
    target: "rect"

    function setColor(color: color): void { rect.color = color; }
    function getColor(): color { return rect.color; }
    function setAngle(angle: real): void { rect.rotation = angle; }
    function getAngle(): real { return rect.rotation; }
    function setRadius(radius: int): void { rect.radius = radius; }
    function getRadius(): int { return rect.radius; }
    function toggleLaungher() {}
  }
}
