#!/usr/bin/env zsh

function wake_pc() {
    wakeonlan -i 192.168.10.16 a8:a1:59:a4:63:d4
}
