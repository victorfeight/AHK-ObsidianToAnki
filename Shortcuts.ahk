#f::Run %A_ProgramFiles%\Everything\Everything.exe

;^+v::
;Send, {Click right}
;Send, {Down}
;Send, {Enter}
;return
;
;^!v::
;Send, {Click right}
;Send, {Down}
;Send, {Down}
;Send, {Enter}
;return

#v::Run "C:/Users/Vic/Github/Windows/winbin/paste.ahk"
return

#c::Run "C:/Users/Vic/Github/Windows/winbin/paste_to_file.ahk"
return

!1::Send % chr(167)

myVar = 1;
#,::
bMyVar := !bMyVar
#if (bMyVar = 1) 
  ~!Tab::RunWait center_screen.ahk
#if
