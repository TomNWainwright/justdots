const Gio = imports.gi.Gio;
const GioSSS = Gio.SettingsSchemaSource;
const Ext = imports.misc.extensionUtils.getCurrentExtension();

function getSettings() {
    let schema = "org.gnome.shell.extensions.topbarscriptexecutor";

    let schemaDir = Ext.dir.get_child("schemas");
    let schemaSource;
    if (schemaDir.query_exists(null)) {
        schemaSource = GioSSS.new_from_directory(schemaDir.get_path(),
            GioSSS.get_default(),
            false
        );
    } else {
        schemaSource = GioSSS.get_default();
    }

    let schemaObj = schemaSource.lookup(schema, true);
    if (!schemaObj) {
        throw new Error(
            schema + " could not be found for Top Bar Script Executor"
        );
    }
    return new Gio.Settings({settings_schema: schemaObj});
}
