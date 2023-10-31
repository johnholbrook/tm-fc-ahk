#Include, tm_fieldset.ahk

fc := new tm_fieldset("Match Field Set #1")

F13::fc.start_match()

F5::fc.end_early()

F6::fc.abort_or_reset()