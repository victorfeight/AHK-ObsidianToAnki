; Zim Inbox txt file
FileEncoding, UTF-8
;File := "C:\Users\Vic\Notebooks\GTD Tasks\Inbox.txt"
File := "C:\Users\Vic\Documents\OBSIDIAN\COMPSCI\compsci\Inbox.md"

; sleep is necessary
clipboard=
sleep, 500
Send ^c
ClipWait
content := clipboard

SetTitleMatchMode, 2
IfWinActive, Mozilla Firefox 
{
    Send ^l
    Send ^c
    ClipWait
    url := clipboard
    Fileappend, `r`n%A_MM%-%A_DD%-%A_YYYY%`r`n,%File%
    Fileappend,%url%`r`n,%File%
    Fileappend,`r`n%content%`r`n,%File%
    Fileappend,`r`n-----`r`n,%File%
} else {
    Fileappend, `r`n%A_MM%-%A_DD%-%A_YYYY%`r`n,%File%
    Fileappend,`r`n%content%`r`n,%File%
    Fileappend,`r`n-----`r`n,%File%
}
