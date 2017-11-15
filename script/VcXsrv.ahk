;; 在 VcXsrv 中取消 Windows 自身的輸入法切換快捷鍵, 该脚本不能使用, 因为没有解决 Shift 作为前缀快捷键的问题

#InstallKeybdHook

;; 取消 Ctrl+SPACE 和 Shift
;; #IfWinActive ahk_class vcxsrv/x X rl
#IfWinActive emacs@SOREN-MIBOOK 
{
;; 这个脚本不能处理 shift 作为前缀快捷键的问题...
;; $<+9::
;; ControlSend, , (, emacs@SOREN-MIBOOK
;; ControlSend, , 9, emacs@SOREN-MIBOOK

;; Left Shift
;; LShift up::
LShift::
KeyWait LShift
;; if previously-pressed-key-action = LShift-down
if A_PriorKey = LShift
{
MsgBox %A_PriorKey%
ControlSend, , {LShift}, emacs@SOREN-MIBOOK
}
else
{
MsgBox else
Send, , {LShift up}
}
return

;; Ctrl+SPACE
^Space::
;; MsgBox InVcXsrv
;; Send ^{Space}
ControlSend, , ^{Space}, emacs@SOREN-MIBOOK 
return

}
