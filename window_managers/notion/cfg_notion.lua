--
-- Notion main configuration file

dopath("cfg_debian")
 META="Mod4+"
 ALTMETA="Mod1+"

-- Terminal emulator
--XTERM="extraterm"

-- Some basic settings
ioncore.set{
    -- Maximum delay between clicks in milliseconds to be considered a
    -- double click.
    --dblclick_delay=250,

    -- For keyboard resize, time (in milliseconds) to wait after latest
    -- key press before automatically leaving resize mode (and doing
    -- the resize in case of non-opaque move).
    --kbresize_delay=1500,

    --opaque_resize=false,


    --warp=true,
    
    -- Switch frames to display newly mapped windows
    --switchto=true,
    
    -- Default index for windows in frames: one of 'last', 'next' (for
    -- after current), or 'next-act' (for after current and anything with
    -- activity right after it).
    --frame_default_index='next',
    
    -- Auto-unsqueeze transients/menus/queries.
    --unsqueeze=true,
    
    -- Display notification tooltips for activity on hidden workspace.
    --screen_notify=true,
    
    --autosave_layout=true,
    
    -- Mouse focus mode; set to "sloppy" if you want the focus to follow the 
    -- mouse, and to "disabled" otherwise.
    --mousefocus="sloppy",

    -- Controls Notion's reaction to stacking requests sent by clients. Set to
    -- "ignore" to ignore these requests, and to "activate" to set the activity
    -- flag on a window that requests to be stacked "Above".
    --window_stacking_request="ignore",
}

dopath("cfg_defaults")

-- Load configuration of the Notion 'core'. Most bindings are here.
--dopath("cfg_notioncore")

-- Load some kludges to make apps behave better.
--dopath("cfg_kludges")

-- Define some layouts. 
--dopath("cfg_layouts")

--dopath("mod_query")
--dopath("mod_menu")
--dopath("mod_tiling")
--dopath("mod_statusbar")
--dopath("mod_dock")
--dopath("mod_sp")
--dopath("mod_notionflux")
--dopath("mod_xrandr")


--defbindings("WScreen", {
--    kpress(ALTMETA.."F12", "mod_menu.menu(_, _sub, 'mainmenu', {big=true})"),
--})
--
--defbindings("WMPlex.toplevel", {
--    kpress(META.."M", "mod_menu.menu(_, _sub, 'ctxmenu')"),
--})

