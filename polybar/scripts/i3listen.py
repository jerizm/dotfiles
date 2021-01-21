#!/usr/bin/env python3
from i3ipc import Connection, Event
from subprocess import call

i3 = Connection()

def on_window_focus(self, e):
    call('polybar-msg hook i3wm 1'.split(' '))

# Subscribe to events
i3.on(Event.WINDOW_FOCUS, on_window_focus)
i3.on(Event.WORKSPACE, on_window_focus)
i3.on(Event.WINDOW_CLOSE, on_window_focus)

# Start the main loop and wait for events to come in.
i3.main()
