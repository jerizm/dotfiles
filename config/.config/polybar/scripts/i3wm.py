#!/usr/bin/env python
import subprocess
import re
from i3ipc import Connection
from alias import alias

i3 = Connection()


def main():
    # build dict with workspaces and focused workspace
    built_ws = build_ws_dict()
    # add wm_classes to built dict
    name_dict = get_ws_names(built_ws)
    # change wm_class to aliases and icons if available
    alias_dict = check_alias(name_dict)
    # iterates through dict and builds output string with separators and polybar tags
    output = build_output(alias_dict)

    print(output)


def build_ws_dict():
    # dict structure
    # {int: [str, str]}
    # {workspace number: [icon or None, WM_CLASS or alias]

    ws_dict = {} 
    for ws in i3.get_workspaces():
        ws_dict[int(ws.name)] = [None,'']
        if ws.focused == True:
            ws_dict[99] = ['focused', str(ws.name)]
    return ws_dict


def get_ws_names(name_dict):
    ws_list = []
    for con in i3.get_tree():
        if con.window and con.parent.type != 'dockarea' and con.workspace().num != int(name_dict[99][1]):
            if con.workspace().num not in ws_list:
                name_dict[con.workspace().num][1] = con.window_class
                ws_list.append(con.workspace().num)
            else:
                name_dict[con.workspace().num][0] = '+'
        elif con.window and con.parent.type != 'dockarea':
            window_id = get_active_window_id()
            name_dict[con.workspace().num][1] = get_focused_wm_class(window_id)
    return name_dict


def get_active_window_id():
    window_check = subprocess.Popen(['xdotool','getactivewindow'],stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    window_check.wait()
    (stdout, stderr) = window_check.communicate()

    if window_check.returncode != 0:
        return 0
    else:
        format_id = re.search(r'\d+',str(stdout))
        return format_id.group(0)


def get_focused_wm_class(window_id):
    xprop_wm_class = subprocess.check_output(['xprop','-id', window_id, 'WM_CLASS']).decode()
    wm_class_unformatted = re.search(r'"(.*?)"', xprop_wm_class)
    wm_class = wm_class_unformatted.group(0).strip('"')
    return wm_class    


def check_alias(alias_dict):
    for ws, names in alias_dict.items():
        if names[1].lower() in alias and names[0] != '+':
            alias_dict[ws] = [alias[names[1].lower()][0], alias[names[1].lower()][1]]
        elif names[1].lower() in alias and names[0] == '+':
            alias_dict[ws] = [alias[names[1].lower()][0] + ' +', alias[names[1].lower()][1]] 
    return alias_dict


def build_output(output_dict):
    output_str = ''
    for ws, value in output_dict.items():
        if ws != int(output_dict[99][1]) and ws != 99:
            if value[0] != None:
                output_str += ' ' + str(ws) + ': ' + '%{T2}' + value[0] + ' %{T-}'
            else:
                output_str += ' ' + str(ws) + ' '
        elif ws != 99:
            if value[0] != None:
                output_str += '%{R}' + ' ' + str(ws) + ': ' + '%{T2}' + value[0] + '%{T-}' + ' ' + value[1] + ' ' + '%{R-}'
            elif value[1] != '':
                output_str += '%{R}' + ' ' + str(ws) + ': ' + value[1] + ' ' + '%{R-}'
            else:
                output_str += '%{R}' + ' ' + str(ws) +  ': %{T2} %{T-}' + '%{R-}'
        else:
            if ws != 99:
                print('err')
        
        if ws != 99:
            output_str += '|'
    
    return output_str[:-1]


main()
