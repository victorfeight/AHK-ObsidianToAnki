; Zim Inbox txt file
FileEncoding, UTF-8

InputBox, UserInput, Flash Card File, Please enter the name of the flashcard set for this card., , 640, 480
if ErrorLevel {
    MsgBox, CANCEL was pressed.
    ExitApp
} else {
    dir := "C:\Users\Vic\Documents\OBSIDIAN\COMPSCI\compsci\FlashCards"
    File := dir . "\" . UserInput . ".md"
    ;MsgBox, Full Path is "%File%"
}


;;Highlight line and copy
#IfWinActive ahk_exe Obsidian.exe
{

RxMatches(hayStack, Needle){
    Result := [] ;new MatchCollection()
    start = 1
    loop
    {
        if(!RegexMatch(haystack, needle, M, start)) 
            break

        Result.Insert(M)
        start := M.Pos + M.Len
    }

    return Result
}

clipboard=
; sleep is necessary
sleep, 500
Send yy
ClipWait
clipboardQuestion := clipboard
FoundQuestion := RegExMatch(clipboardQuestion, "O)\[(?:\s|x|>|<|\*)]\s*([^#]*[^#\s])",outputquestion)

braces := "[{}]"
if (RegExMatch(clipboardQuestion, braces)) {
  clozeQuestion := outputquestion[1]
  regexNeedle := "O)(?<=#)(\w+)"
  ;; First count how many object inside, then add tags correctly
  for i,m in RxMatches(clipboardQuestion, regexNeedle)   ; i is 1..n, m is a Match object
    count += 1
  ;     i, m.Value, m.Pos, m.Len, m[1], m["groupName"]

  for i,m in RxMatches(clipboardQuestion, regexNeedle)   ; i is 1..n, m is a Match object
    if(i = count) {
     tags .= m.Value
    } else {
      tags .= m.Value " "
    }
  sleep, 500

  Fileappend, `n%clozeQuestion%`nTags: %tags%`n`n, %File%
  ExitApp
} else {
  Send $j
  
  clipboard=
  sleep, 500
  Send yy
  ClipWait

  clipboardAnswer := clipboard
  FoundAnswer := RegExMatch(clipboardAnswer, "O)\[(?:\s|x|>|<|\*)]\s*([^#]*[^#\s])",outputanswer)
  newLine := "`r`n"
  ;ruledStyle := "----"
  questionAnswer := "START" newLine "Basic" newLine outputquestion[1] newLine "Back: " newLine outputanswer[1]
  }
  
  regexNeedle := "O)(?<=#)(\w+)"
  ;; First count how many object inside, then add tags correctly
  for i,m in RxMatches(clipboardQuestion, regexNeedle)   ; i is 1..n, m is a Match object
    count += 1
  ;     i, m.Value, m.Pos, m.Len, m[1], m["groupName"]
  
  for i,m in RxMatches(clipboardQuestion, regexNeedle)   ; i is 1..n, m is a Match object
    if(i = count) {
      questiontags .= m.Value
    } else {
      questiontags .= m.Value " "
    }

  for i,m in RxMatches(clipboardAnswer, regexNeedle)   ; i is 1..n, m is a Match object
    count += 1
  ;     i, m.Value, m.Pos, m.Len, m[1], m["groupName"]
  
  for i,m in RxMatches(clipboardAnswer, regexNeedle)   ; i is 1..n, m is a Match object
    if(i = count) {
      answertags .= m.Value
    } else {
      answertags .= m.Value " "
    }

  tags := questiontags " " answertags
  For i, value in StrSplit(tags , A_space), uniques := {}, tagsNoDups := ""
	  if !uniques.HasKey(value)
	  	tagsNoDups .= value . A_space , uniques[value] := true

  sleep, 500
  Fileappend, `n%questionAnswer%`nTags: %tagsNoDups%`nEND`n`n`n, %File%
  ExitApp
}
