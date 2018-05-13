const St = imports.gi.St;
const Main = imports.ui.main;
const Util = imports.misc.util;
const Ext = imports.misc.extensionUtils.getCurrentExtension();
const Buttons = Ext.imports.buttons;
const Lang = imports.lang;

let uiButtons = [];

function init() {
}

function enable() {
    Buttons.reloadButtons();
    for (let i = Buttons.buttons.length-1; i >= 0; i--) {
        let bData = Buttons.buttons[i];
        let button = new St.Bin({ style_class: 'panel-button',
                                    reactive: true,
                                    can_focus: true,
                                    x_fill: true,
                                    y_fill: false,
                                    track_hover: true });
        let icon = new St.Icon({ icon_name: bData.icon,
                                 style_class: 'system-status-icon' });

        button.set_child(icon);
        button.connect("button-press-event", Lang.bind(bData,
            function() {
                Util.spawn(["/bin/bash", "-c", this.command]);
            }
        ));

        Main.panel._rightBox.insert_child_at_index(button, 0);
        uiButtons.push(button);
    }
}

function disable() {
    for (let button of uiButtons) {
        Main.panel._rightBox.remove_child(button);
    }
}
