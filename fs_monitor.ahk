#Include, tm_fieldset.ahk
#Include, stdio.ahk

; Read name of field set from command-line arguments, or pick default value if not specified
argument_count := %0%
; MsgBox, %argument_count%
fs_name := (argument_count > 0) ? argument_count : "Match Field Set #1"

; initialize TM fieldset object
tm_fs := new tm_fieldset(fs_name)

; global variable to keep track of fieldset state
fs_state := {match_num: "", saved_match: "", time_remaining: "", field_state: "", field_name: ""}

; main loop of program
Loop {
    ; Get current state of field set and compare to last known state, output any changes
    ; old_state := fs_state
    ; fs_state := tm_fs.get_state()

    new_state := tm_fs.get_state()
    if (new_state == -1){
        Stdout("TM doesn't appear to be running. Trying again in 10 seconds...")
        Sleep, 10000
    }
    else{
        old_state := fs_state
        fs_state := new_state

        if (fs_state.match_num != old_state.match_num){
            Stdout(Format("active_match :: {}", fs_state.match_num))
        }
        if (fs_state.saved_match != old_state.saved_match){
            Stdout(Format("displayed_score :: {}", fs_state.saved_match))
        }
        if (fs_state.time_remaining != old_state.time_remaining){
            Stdout(Format("time_remaining :: {}", fs_state.time_remaining))
        }
        if (fs_state.field_state != old_state.field_state){
            Stdout(Format("field_state :: {}", fs_state.field_state))
        }
        if (fs_state.field_name != old_state.field_name){
            Stdout(Format("field_name :: {}", fs_state.field_name))
        }

        ; Sleep for 50 ms (polling rate ~20Hz)
        Sleep, 50
    }
}