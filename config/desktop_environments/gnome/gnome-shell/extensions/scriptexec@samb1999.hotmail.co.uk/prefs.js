const Extension = imports.misc.extensionUtils.getCurrentExtension();
const Gtk = imports.gi.Gtk;
const Lang = imports.lang;
const Ext = imports.misc.extensionUtils.getCurrentExtension();
const Buttons = Ext.imports.buttons;

let ui;

const PrefsUI = new Lang.Class({
    Name: "TopBarScriptExecutor",

    _objects: {
        boxMain:        null,
        boxBtns:        null,
        btnAdd:         null,
        btnRem:         null,
        btnEdit:        null,
        btnUp:          null,
        btnDown:        null,
        lbScripts:      null,

        addDiag:        null,
        boxAddDiag:     null,
        btnbxAddDiag:   null,
        btnCnfrm:       null,
        btnCncl:        null,
        boxAddDiagCntr: null,
        boxName:        null,
        lblName:        null,
        ntrName:        null,
        boxScript:      null,
        lblScript:      null,
        ntrScript:      null,
        boxIcon:        null,
        lblIcon:        null,
        ntrIcon:        null,
        msgExists:      null,
        btnMsgExistsOk: null,
        lblChanges:     null,
    },

    build: function() {
        this.builder = new Gtk.Builder();
        this.builder.add_from_file(
            Extension.dir.get_child("prefs.ui").get_path());

        for (let o in this._objects) {
            this._objects[o] = this.builder.get_object(o);
        }

        this._initConnections();

        this._objects.addDiag.hide();

        Buttons.reloadButtons();
        for (let button of Buttons.buttons) {
            this._createScriptEntry(button.name, -1);
        }

        return this._objects.boxMain;
    },

    _initConnections: function() {
        this._connectBtn("btnAdd", function() {
            this._objects.addDiag.show();
        });
        this._connectBtn("btnRem", function() {
            this._rmSelected();
        });
        this._connectBtn("btnEdit", function() {
            let selected = this._objects.lbScripts.get_selected_row();
            if (selected == null) return;
            let index = selected.get_index();
            let btn = Buttons.buttons[index];
            this._editing = true;
            this._objects.addDiag.show();
            this._objects.ntrName.set_text(btn["name"]);
            this._objects.ntrScript.set_text(btn["command"]);
            this._objects.ntrIcon.set_text(btn["icon"]);
        });
        this._connectBtn("btnUp", function() {
            let selected = this._objects.lbScripts.get_selected_row();
            if (selected == null) return;
            let index = selected.get_index();

            if (Buttons.moveButton(index, -1)) {
                selected.destroy();
                this._createScriptEntry(Buttons.buttons[index-1].name, index-1);

                this._objects.lbScripts.select_row(
                    this._objects.lbScripts.get_row_at_index(index-1)
                );
                this._objects.lblChanges.show();
            }
        });
        this._connectBtn("btnDown", function() {
            let selected = this._objects.lbScripts.get_selected_row();
            if (selected == null) return;
            let index = selected.get_index();

            if (Buttons.moveButton(index, +1)) {
                selected.destroy();
                this._createScriptEntry(Buttons.buttons[index+1].name, index+1);

                this._objects.lbScripts.select_row(
                    this._objects.lbScripts.get_row_at_index(index+1)
                );
                this._objects.lblChanges.show();
            }
        });
        this._connectBtn("btnCnfrm", function() {
            let text = this._objects.ntrName.get_text();
            let icon = this._objects.ntrIcon.get_text();
            let script = this._objects.ntrScript.get_text();
            let index = -1;
            if (text == "") return;
            if (icon == "") return;
            if (script == "") return;
            if (this._editing) {
               index = this._rmSelected();
            }
            for (let row of this._objects.lbScripts.get_children()) {
                if (row.get_children()[0].get_text() == text) {
                    this._objects.msgExists.show_all();
                    return;
                }
            }
            this._createScriptEntry(text, index);
            if (index != -1)
                Buttons.addButton(text, icon, script, index);
            else
                Buttons.addButton(text, icon, script);

            this._objects.lblChanges.show();
            this._closeAddDiag();
        });
        this._connectBtn("btnCncl", function() {
            this._closeAddDiag();
        });
        this._connectBtn("btnMsgExistsOk", function() {
            this._objects.msgExists.hide();
        });
    },

    _createScriptEntry: function(text, index) {
        let entry = new Gtk.ListBoxRow();
        entry.add(new Gtk.Label({ label:text }));

        this._objects.lbScripts.insert(entry, index);
        this._objects.lbScripts.show_all();
    },

    _connectBtn: function(button, func) {
        this._objects[button].connect("clicked",
            Lang.bind(this, func)
        );
    },

    _closeAddDiag: function() {
        this._objects.ntrName.set_text("");
        this._objects.ntrScript.set_text("");
        this._objects.ntrIcon.set_text("");
        this._objects.addDiag.hide();
        this._editing = false;
    },

    _rmSelected: function() {
        let selected = this._objects.lbScripts.get_selected_row();
        if (selected != null) {
            Buttons.removeButton(selected.get_index());
            selected.destroy();
            return selected.get_index();
        }
        return -1;
    },
});

function init() {
    ui = new PrefsUI();
}

function buildPrefsWidget() {
    return ui.build();
}
