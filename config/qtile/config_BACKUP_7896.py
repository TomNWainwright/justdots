

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, hook, bar, widget

mod = 'mod4'
color_alert = '#ee9900'
color_frame = '#808080'

# kick a window to another screen (handy during presentations)
def kick_to_next_screen(qtile, direction=1):
	other_scr_index = (qtile.screens.index(qtile.currentScreen) + direction) % len(qtile.screens)
	othergroup = None
	for group in qtile.cmd_groups().values():
		if group['screen'] == other_scr_index:
			othergroup = group['name']
			break
	if othergroup:
		qtile.moveToGroup(othergroup)

# future use: udev code
def __x():
	import pyudev
	context = pyudev.Context()
	monitor = pyudev.Monitor.from_netlink(context)
	monitor.filter_by('drm')
	monitor.enable_receiving()
	observer = pyudev.MonitorObserver(monitor, setup_monitors)
	observer.start()

# see http://docs.qtile.org/en/latest/manual/config/keys.html
keys = [
<<<<<<< HEAD

    # Layout hotkeys
    Key([mod], "h", lazy.layout.shrink_main()),
    Key([mod], "l", lazy.layout.grow_main()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),

    # Window hotkeys
    Key([mod], "space", lazy.window.toggle_fullscreen()),
    Key([mod], "c", lazy.window.kill()),

    # Spec hotkeys
    Key([mod], "Return", lazy.spawncmd()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

    # Apps hotkeys
    Key([mod], "x", lazy.spawn("jumpapp extraterm")),
    Key([mod], "g", lazy.spawn("jumpapp medit")),
    Key([mod], "z", lazy.spawn("jumpapp nemo")),
    Key([mod], "c", lazy.spawn("jumpapp google-chrome")),
    Key([mod], "Home", lazy.spawn("firefox -P music")),
    Key([mod], "Prior", lazy.spawn("firefox --private-window")),

    # System hotkeys
    Key([mod, "shift", "control"], "F11", lazy.spawn("sudo hibernate-reboot")),
    Key([mod, "shift", "control"], "F12", lazy.spawn("systemctl hibernate")),
    Key([], "Print", lazy.spawn("scrot -e 'mv $f /home/user/screenshots/'")),

    # Media hotkeys
    Key([], 'XF86AudioRaiseVolume', lazy.spawn('pulseaudio-ctl up 5')),
    Key([], 'XF86AudioLowerVolume', lazy.spawn('pulseaudio-ctl down 5')),
    Key([], 'XF86AudioMute', lazy.spawn('pulseaudio-ctl set 1')),
]


# ----------------------------
# --- Workspaces and Rooms ---
# ----------------------------

# The basic idea behind Workspaces and Rooms is to control
# DIFFERENT subsets of groups with the SAME hotkeys.
# So we can have multiple 'qwerasdf' rooms in a different workspaces.
#
# Qtile Groups are used behind the scenes, but their visibility
# is set dynamically.

def get_group_name(workspace, room):
    """ Calculate Group name based on (workspace,room) combination.
    """
    return "%s%s" % (room, workspace)

# List of available workspaces.
# Each workspace has its own prefix and hotkey.
workspaces = [
    ('1', 'F1'),
    ('2', 'F2'),
    ('3', '1'),
    ('4', '2'),
    ('o', 'o'),
    ('p', 'p'),
]

# List of available rooms.
# Rooms are identical between workspaces, but they can
# be changed to different ones as well. Minor changes required.
rooms = "qwerasdf"

# Oops, time for a little hack there.
# This is a global object with information about current workspace.
# (viable as config code, not sure about client-server though)
wsp = {
    'current': workspaces[0][0], # first workspace is active by default
}
# ... and information about active group in the each workspace.
for w, _ in workspaces:
    wsp[w] = {
        'active_group': get_group_name(w, rooms[0]) # first room is active by default
    }

def get_workspace_groups(workspace):
    """ Get list of Groups that belongs to workspace.
    """
    return [ get_group_name(workspace, room) for room in rooms]

def to_workspace(workspace):
    """ Change current workspace to another one.
    """
    def f(qtile):
        global wsp

        # we need to save current active room(group) somewhere
        # to return to it later
        wsp[wsp['current']]['active_group'] = qtile.currentGroup.name

        # now we can change current workspace to the new one
        # (no actual switch there)
        wsp['current'] = workspace
        # and navigate to the active group from the workspace
        # (actual switch)
        qtile.groupMap[
            wsp[workspace]['active_group']
        ].cmd_toscreen()

        # we also need to change subset of visible groups in the GroupBox widget
        qtile.widgetMap['groupbox'].visible_groups=get_workspace_groups(workspace)
        qtile.widgetMap['groupbox'].draw()
        # You can do some other cosmetic stuff here.
        # For example, change Bar background depending on the current workspace.
        # # qtile.widgetMap['groupbox'].bar.background="ff0000"
    return f

def to_room(room):
    """ Change active room to another within the current workspace.
    """
    def f(qtile):
        global wsp
        qtile.groupMap[get_group_name(wsp['current'], room)].cmd_toscreen()
    return f

def window_to_workspace(workspace, room=rooms[0]):
    """ Move active window to another workspace.
    """
    def f(qtile):
        global wsp
        qtile.currentWindow.togroup(wsp[workspace]['active_group'])
    return f

def window_to_room(room):
    """ Move active window to another room within the current workspace.
    """
    def f(qtile):
        global wsp
        qtile.currentWindow.togroup(get_group_name(wsp['current'], room))
    return f

# Create individual Group for each (workspace,room) combination we have
groups = []
for workspace, hotkey in workspaces:
    for room in rooms:
        groups.append(Group(get_group_name(workspace, room)))

# Assign individual hotkeys for each workspace we have
for workspace, hotkey in workspaces:
    keys.append(Key([mod], hotkey, lazy.function(
        to_workspace(workspace))))
    keys.append(Key([mod, "shift"], hotkey, lazy.function(
        window_to_workspace(workspace))))

# Assign shared hotkeys for each room we have.
# Decision about actual group to open is made dynamically.
for room in rooms:
    keys.append(Key([mod], room, lazy.function(
        to_room(room))))
    keys.append(Key([mod, "shift"], room, lazy.function(
        window_to_room(room))))


# ---------------------------
# ---- Layouts & Widgets ----
# ---------------------------

=======
	# Switch between windows in current stack pane
	Key([mod], 'Tab', lazy.layout.down()),
	Key([mod, 'shift'], 'Tab', lazy.layout.up()),
	# Move windows up or down in current stack
	Key([mod, 'mod1'], 'Tab', lazy.layout.shuffle_down()),
	Key([mod, 'mod1', 'shift'], 'Tab', lazy.layout.shuffle_up()),
	# Switch window focus to other pane(s) of stack
	Key([mod, 'control'], 'Tab', lazy.layout.next()),
	Key([mod, 'control', 'shift'], 'Tab', lazy.layout.prev()),
	# Swap panes of split stack
	#Key([mod, 'shift'], 'space', lazy.layout.rotate()),
	# Change ratios
	Key([mod], 'k', lazy.layout.increase_ratio()),
	Key([mod], 'j', lazy.layout.decrease_ratio()),
	# kick to next/prev screen
	Key([mod], "o", lazy.function(kick_to_next_screen)),
	Key([mod, "shift"], "o", lazy.function(kick_to_next_screen, -1)),
	# Toggle between split and unsplit sides of stack.
	# Split = all windows displayed
	# Unsplit = 1 window displayed, like Max layout, but still with
	# multiple stack panes
	#Key([mod, 'shift'], 'Return', lazy.layout.toggle_split()),
	Key([mod], 'Return', lazy.spawn('jumpapp extraterm')),
    	Key([mod], 'v', lazy.spawn('jumpapp google-chrome')),

	Key([mod], 'v', lazy.spawn('jumpapp medit')),
	Key([mod], 'l', lazy.spawn('jumpapp nemo')),

	# Switch groups

	Key([mod], 'Left', lazy.screen.prev_group(skip_managed=True, )),
	Key([mod], 'Right', lazy.screen.next_group(skip_managed=True, )),
	Key([mod], 'Escape', lazy.screen.togglegroup()),
	# Toggle between different layouts as defined below
	Key([mod], 'space', lazy.next_layout()),
	Key([mod, 'shift'], 'space', lazy.prev_layout()),
	# lazy.group.setlayout('...
	Key([mod, 'shift'], 'c', lazy.window.kill()),
	# qtile maintenence
	Key([mod, 'shift'], 'e', lazy.spawn('gvim {}'.format(__file__))),
	Key([mod, 'shift'], 'r', lazy.restart()), # default is control! ;)
	Key([mod, 'shift'], 'q', lazy.shutdown()),
	Key([mod], 'r', lazy.spawncmd()),
	Key([mod], 'f', lazy.window.toggle_floating()),
	Key([mod], 'm', lazy.window.toggle_fullscreen()),
	Key([mod], 'n', lazy.window.toggle_minimize()),
	#Key( [mod, 'shift'], '2', lazy.to_screen(1), lazy.group.toscreen(1)),
	]

# create groups
groups = [Group(i) for i in '1234567890']
for i in groups:
	# mod1 + letter of group = switch to group
	keys.append(
		Key([mod], i.name, lazy.group[i.name].toscreen())
	)

	# mod1 + shift + letter of group = switch to & move focused window to group
	keys.append(
		Key([mod, 'shift'], i.name, lazy.window.togroup(i.name))
	)

# see http://docs.qtile.org/en/latest/manual/ref/layouts.html
>>>>>>> 38cc5cde07d8202ed0e8a909c92c1b6a1954fccd
layouts = [
	layout.Max(),
	layout.Floating(border_focus=color_alert, border_normal=color_frame, ),
	#layout.Matrix(),
	#layout.MonadTall(),
	#layout.RatioTile(),
	#layout.Slice(),
	#layout.Stack(num_stacks=2),
	layout.Tile(border_focus=color_alert, border_normal=color_frame, ),
	#layout.TreeTab(),
	#layout.VerticalTile(),
	#layout.Zoomy(),
	]

widget_defaults = dict(
	font='Sans',
	fontsize=16,
	)

class Backlight(widget.Backlight):
	def poll(self):
		info = self._get_info()
		if info is False:
			return '---'
		no = int(info['brightness'] / info['max'] * 9.999)
		char = '☼'
		#self.layout.colour = color_alert
		return '{}{}{}'.format(char, no, 'L')#chr(0x1F50B))

class Battery(widget.Battery):
	def _get_text(self):
		info = self._get_info()
		if info is False:
			return '---'
		if info['full']:
			no = int(info['now'] / info['full'] * 9.999)
		else:
			no = 0
		if info['stat'] == 'Discharging':
			char = self.discharge_char
			if no < 2:
				self.layout.colour = self.low_foreground
			else:
				self.layout.colour = self.foreground
		elif info['stat'] == 'Charging':
			char = self.charge_char
		#elif info['stat'] == 'Unknown':
		else:
			char = '■'
		return '{}{}{}'.format(char, no, 'B')#chr(0x1F506))

class ThermalSensor(widget.ThermalSensor):
	def poll(self):
		temp_values = self.get_temp_sensors()
		if temp_values is None:
			return '---'
		no = int(float(temp_values.get(self.tag_sensor, [0])[0]))
		return '{}{}'.format(no, '°')#chr(0x1F321))

class Volume(widget.Volume):
	def update(self):
		vol = self.get_volume()
		if vol != self.volume:
			self.volume = vol
			if vol < 0:
				no = '0'
			else:
				no = int(vol / 100 * 9.999)
			char = '♬'
			self.text = '{}{}{}'.format(char, no, 'V')#chr(0x1F508))

# see http://docs.qtile.org/en/latest/manual/ref/widgets.html
screens = [Screen(top=bar.Bar([
	widget.GroupBox(
		disable_drag=True,
		this_current_screen_border=color_frame,
		this_screen_border=color_frame,
		urgent_text=color_alert,
		),
	widget.CurrentLayout(),
	widget.Prompt(),
	widget.TaskList(
		font='Nimbus Sans L',
		border=color_frame,
		highlight_method='block',
		max_title_width=800,
		urgent_border=color_alert,
		),
	widget.Systray(),
	Backlight(),
	Battery(
		charge_char = u'▲',
		discharge_char = u'▼',
		low_foreground = color_alert,
		),
	ThermalSensor(),
	Volume(),
	widget.CPUGraph(
		graph_color=color_alert,
		fill_color='{}.5'.format(color_alert),
		border_color=color_frame,
		line_width=2,
		border_width=1,
		samples=60,
		),
	widget.MemoryGraph(
		graph_color=color_alert,
		fill_color='{}.5'.format(color_alert),
		border_color=color_frame,
		line_width=2,
		border_width=1,
		samples=60,
		),
	widget.NetGraph(
		graph_color=color_alert,
		fill_color='{}.5'.format(color_alert),
		border_color=color_frame,
		line_width=2,
		border_width=1,
		samples=60,
		),
	widget.Clock(
		format='%Y-%m-%d %H:%M %p',
		),
	], 32, ), ), ]

def detect_screens(qtile):
	while len(screens) < len(qtile.conn.pseudoscreens):
		screens.append(Screen(
		top=bar.Bar([
			widget.GroupBox(
				disable_drag=True,
				this_current_screen_border=color_frame,
				this_screen_border=color_frame,
				),
			widget.CurrentLayout(),
			widget.TaskList(
				font='Nimbus Sans L',
				border=color_frame,
				highlight_method='block',
				max_title_width=800,
				urgent_border=color_alert,
				),
			], 32, ), ))

# Drag floating layouts.
mouse = [
	Drag([mod], 'Button1', lazy.window.set_position_floating(), start=lazy.window.get_position()),
	Drag([mod], 'Button3', lazy.window.set_size_floating(), start=lazy.window.get_size()),
	Click([mod], 'Button2', lazy.window.bring_to_front())
	]

# subscribe for change of screen setup, just restart if called
@hook.subscribe.screen_change
def restart_on_randr(qtile, ev):
	# TODO only if numbers of screens changed
	qtile.cmd_restart()

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
	border_focus=color_alert,
	border_normal=color_frame,
	float_rules=[dict(role='buddy_list', ), ],
	)
auto_fullscreen = True
# java app don't work correctly if the wmname isn't set to a name that happens to
# be on java's whitelist (LG3D is a 3D non-reparenting WM written in java).
wmname = 'LG3D'

def main(qtile):
	detect_screens(qtile)
