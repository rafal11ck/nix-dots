import QtQuick
import Quickshell.Io
import qs.Common
import qs.Modules.Plugins
import qs.Widgets

PluginComponent {
    id: root

    property bool inhibited: false

    Process {
        id: inhibitor
        command: ["systemd-inhibit", "--what=handle-lid-switch", "--who=DankLidSleepToggle", "--why=User disabled lid sleep", "sleep", "infinity"]
        onExited: {
            root.inhibited = false;
        }
    }

    function toggle() {
        if (inhibited) {
            inhibitor.signal(15);
            inhibited = false;
        } else {
            inhibitor.running = true;
            inhibited = true;
        }
    }

    pillClickAction: () => {
        root.toggle();
    }

    horizontalBarPill: Component {
        Item {
            implicitWidth: icon.width
            implicitHeight: icon.height

            DankIcon {
                id: icon
                anchors.centerIn: parent
                name: root.inhibited ? "bedtime_off" : "bedtime"
                size: Theme.barIconSize(root.barThickness, -4, root.barConfig?.maximizeWidgetIcons, root.barConfig?.iconScale)
                color: root.inhibited ? Theme.primary : Theme.widgetIconColor
            }
        }
    }

    verticalBarPill: Component {
        Item {
            implicitWidth: icon.width
            implicitHeight: icon.height

            DankIcon {
                id: icon
                anchors.centerIn: parent
                name: root.inhibited ? "bedtime_off" : "bedtime"
                size: Theme.barIconSize(root.barThickness, 0, root.barConfig?.maximizeWidgetIcons, root.barConfig?.iconScale)
                color: root.inhibited ? Theme.primary : Theme.widgetIconColor
            }
        }
    }
}
