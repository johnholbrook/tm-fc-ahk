# tm-fc-ahk
This repository contains my code for interacting with VEX Tournament Manager field control using AutoHotkey.

Files overview:
* `tm_fieldset.ahk` contains a class for monitoring and interacting with a particular field set.
* `fs_monitor.ahk` is a program which uses the above class to monitor the status of a field set (match number, field status, time remaining, etc.) and print changes to stdout in real time. It could easily be compiled with `ahk2exe` and embedded in other applications to enable higher-level automation.
* `keyboard_shortcuts.ahk` is an example script which defines some global keyboard shortcuts for starting and stopping matches.
