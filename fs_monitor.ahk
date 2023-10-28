#Include, tm_fieldset.ahk
#Include, stdio.ahk

tm_fs := new tm_fieldset("Match Field Set #1")

fs_state := {match_num: "", saved_match: "", time_remaining: "", field_state: "", field_name: ""}

; main loop of program
Loop {
    ; TODO: Read commands from stdin and take actions accordingly (e.g. start match)


    ; Get current state of field set and compare to last known state, output any changes
    old_state := fs_state
    fs_state := tm_fs.get_state()
    if (fs_state.match_num != old_state.match_num){
        Stdout(Format("Match queued: {}", fs_state.match_num))
    }
    if (fs_state.saved_match != old_state.saved_match){
        Stdout(Format("Score on display: {}", fs_state.saved_match))
    }
    if (fs_state.time_remaining != old_state.time_remaining){
        Stdout(Format("Time remaining: {}", fs_state.time_remaining))
    }
    if (fs_state.field_state != old_state.field_state){
        Stdout(Format("Field state: {}", fs_state.field_state))
    }
    if (fs_state.field_name != old_state.field_name){
        Stdout(Format("Current field: {}", fs_state.field_name))
    }

    ; Sleep for 50 ms (polling rate ~20Hz)
    Sleep, 50
}