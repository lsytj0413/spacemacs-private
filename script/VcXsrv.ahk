;; 在 VcXsrv 中取消 Windows 自身的輸入法切換快捷鍵

;; 取消 Ctrl+SPACE 和 Shift
;; #IfWinActive ahk_class vcxsrv/x X rl
#IfWinActive emacs@SOREN-MIBOOK 
{
;; Left Shift
LShift::
;; MsgBox OutVcXsrv
ControlSend, , {LShift}, emacs@SOREN-MIBOOK 
return

;; Ctrl+SPACE
^Space::
;; MsgBox InVcXsrv
;; Send ^{Space}
ControlSend, , ^{Space}, emacs@SOREN-MIBOOK 
return
}
