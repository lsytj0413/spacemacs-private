;; 在 VcXsrv 中取消 Windows 自身的輸入法切換快捷鍵

;; 取消 Ctrl+SPACE 和 Shift
;; #IfWinActive ahk_class vcxsrv/x X rl
#IfWinActive emacs@SOREN-MIBOOK 
{
;; 这个脚本不能处理 shift 作为前缀快捷键的问题...
$<+9::
ControlSend, , (, emacs@SOREN-MIBOOK
;; ControlSend, , 9, emacs@SOREN-MIBOOK

;; Left Shift
;; LShift up::
LShift::
;; MsgBox OutVcXsrv
;; if previously-pressed-key-action = LShift-down
;; {
ControlSend, , {LShift}, emacs@SOREN-MIBOOK
;; }
return

;; Ctrl+SPACE
^Space::
;; MsgBox InVcXsrv
;; Send ^{Space}
ControlSend, , ^{Space}, emacs@SOREN-MIBOOK 
return

}
