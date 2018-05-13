const Ext = imports.misc.extensionUtils.getCurrentExtension();
const Settings = Ext.imports.settings;

let settings = Settings.getSettings();
let buttons = [];

/*
 * name\01icon\01command arg1 arg2\03
 * ↓ ↓ ↓
 * {"name":name,"icon":icon,"command":"command arg1 arg2"}
 */

function reloadButtons() {
    buttons = [];
    let btnsSerialized = settings.get_string("buttons");

    //Transition code for V2->V3
    btnsSerialized = btnsSerialized.replace(/\x02/g, " ");

    let btnDataArray = btnsSerialized.split("\x03");
    for (let btnData of btnDataArray) {
        if (btnData == "") continue;
        let button = {};
        let elements = btnData.split("\x01");
        button["name"] = elements[0];
        button["icon"] = elements[1];
        button["command"] = elements[2];
        buttons.push(button);
    }
}

function serializeButtons() {
    let serStr = "";
    for (let button of buttons) {
        serStr += button.name + "\x01"
                + button.icon + "\x01"
                + button.command + "\x03";
    }
    settings.set_string("buttons", serStr);
}

function addButton(name, icon, cmd, index = buttons.length) {
    for (let i in buttons.length) {
        if (buttons[i].name == name) return false;
    }

    reloadButtons();
    let button = {"name": name, "icon": icon, "command": cmd};
    buttons.splice(index, 0, button);
    serializeButtons();

    return true;
}

function removeButton(index) {
    reloadButtons();
    buttons.splice(index, 1);
    serializeButtons();
}

function moveButton(index, change) {
    reloadButtons();
    if (index + change >= buttons.length) return false;
    if (index + change <  0) return false;
    buttons.splice(index + change, 0, buttons.splice(index, 1)[0]);
    serializeButtons();
    return true;
}
