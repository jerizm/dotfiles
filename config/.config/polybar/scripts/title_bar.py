#!/usr/bin/env python
import subprocess
import re
from alias import alias


def main():
    window_id = get_active_window_id()
    if window_id == 0:
        update_check = read_updates()
        if update_check > 0:
            print('%{F#FF6AC1}%{T2} %{T- F-}%{F#686868}bspwm%{F-}')
        else:
            print('%{F#686868}%{T2} %{T-}bspwm%{F-}')
    else:
        wm_class = get_focused_wm_class(window_id).lower()
        if wm_class in alias:
            print('%{F#FF6AC1}' + alias[wm_class][0] + '%{F-} ' + alias[wm_class][1])
        else:
            print(wm_class)


def get_active_window_id():
    window_check = subprocess.Popen(['xdotool', 'getactivewindow'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    window_check.wait()
    (stdout, stderr) = window_check.communicate()

    if window_check.returncode != 0:
        return 0
    else:
        format_id = re.search(r'\d+', str(stdout))
        return format_id.group(0)


def get_focused_wm_class(window_id):
    xprop_wm_class = subprocess.check_output(['xprop', '-id', window_id, 'WM_CLASS']).decode()
    wm_class_unformatted = re.search(r'"(.*?)"', xprop_wm_class)
    wm_class = wm_class_unformatted.group(0).strip('"')
    return wm_class


def read_updates():
    with open('/home/benjamin/.cache/yay_updates.txt', 'r') as yay_updates:
        for line in yay_updates:
            amount_of_updates = line.rstrip('\n')
    try:
        amount_of_updates = int(amount_of_updates)
    except ValueError:
        amount_of_updates = 0
    return amount_of_updates


main()
