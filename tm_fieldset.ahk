#Include, helpers.ahk

class tm_fieldset {
    __New(name){
        this.name := name
    }

    ; Open the field set control window if it isn't already (necessary for all the functionality of this class to work)
    _force_window_open(){
        if (!WinExist(this.name)){
            name := this.Name
            WinMenuSelectItem, VEX Tournament Manager, , Field Set Control, %name%
            Sleep, 350
        }
    }

    ; Start (or resume) the match
    start_match(){
        this._force_window_open()
        name := this.name
        _vextm_tmp := A_TitleMatchMode
        SetTitleMatchMode, RegEx
        ControlClick, Start Match|Resume Match, %name%
        SetTitleMatchMode, %_vextm_tmp%
    }

    ; End the current period early
    end_early(){
        this._force_window_open()
        name := this.name
        ControlClick, End Early, %name%
    }

    ; Abort the match
    abort_match(){
        this._force_window_open()
        name := this.name
        ControlClick, Abort Match, %name%
    }

    ; Reset match timer
    reset_timer(){
        this._force_window_open()
        name := this.name
        ControlClick, Reset Timer, %name%
    }

    ; Either abort or reset, as appropriate
    abort_or_reset(){
        this._force_window_open()
        name := this.name
        _vextm_tmp := A_TitleMatchMode
        SetTitleMatchMode, RegEx
        ControlClick, Abort Match|Reset Timer, %name%
        SetTitleMatchMode, %_vextm_tmp%
    }

    ; Get the current state of the field set (current match, field, time remaining, etc.)
    get_state(){
        this._force_window_open()
        fs_name := this.name

        ControlGetText, match_num, Static1, %fs_name%
        ControlGetText, saved_match, Static2, %fs_name%
        ControlGetText, time_remaining, Static3, %fs_name%
        ControlGetText, field_state, Static4, %fs_name%
        ControlGetText, field_name, ComboBox1, %fs_name%

        result := {match_num: match_num, saved_match: saved_match, time_remaining: time_remaining, field_state: field_state, field_name: field_name}

        return result
    }
}