" Vim syntax file
" Language: Celestia Star Catalogs
" Maintainer: Kevin Lauder
" Latest Revision: 26 April 2008

if exists("b:current_syntax")
  finish
endif

" Tats is case insensitive
syn case ignore

syn keyword tsfConditional If Then ElseIf Else Select Case

syn keyword tsfOperator And Eqv Imp Is Like Mod Not Or Xor

syn keyword tsfTypes ByRef ByVal

syn match tsfOperator "[()+.,\-/*=&]"
syn match tsfOperator "[<>]=\="
syn match tsfOperator "<>"
syn match tsfOperator "\s\+_$"

syn keyword tsfRepeat Do For ForEach Loop Next Step To Until Wend While

syn keyword tsfKeyword AddMonitor Beep BeginDrive BeginGroup Call Class Const Delay Dim Each End EndDrive EndGroup Erase Err Error Execute ExecuteGlobal Exit Explicit Function Get Halt In InputBox Let Me MonitorSync MsgBox New On Option Output Pane Preserve Private Prompt PromptInput Property Public Randomize ReDim Read ReadMonitor Rem RemoveMonitor Resume Set Stop String Sub With Write

syn keyword tsfFunction Abs AddRangeWatch AddRead AddWatch AddWrite Array Asc AscB AscW Atn CBool CByte CCur CDate CDbl CInt CLng CSng CStr CheckItem Chr ChrB ChrW Cos CreateObject Date DateAdd DateDiff DatePart DateSerial DateValue Day Eval Exp Filter Fix FormatCurrency FormatDateTime FormatNumber FormatPercent GetAtsProperty GetEnumeration GetLocale GetObject GetRef Hex Hour InStr InStrB InStrRev InspectItem Int IsArray IsDate IsEmpty IsNull IsNumeric IsObject ItemBitCount ItemDataType ItemDescription ItemEnumerations ItemMaxValue ItemMinValue ItemMode ItemName ItemNodeLevel ItemNodeType ItemRate ItemResolution ItemSize ItemUnits Join LBound LCase LTrim Left LeftB Len LenB LoadPicture Log Mid MidB Minute Month MonthName Now Oct RGB RTrim ReadEnum Replace Right RightB Rnd Round Second SetLocale Sgn Sin Space Split Sqr StrComp StrReverse Tan Time TimeSerial TimeValue Timer TriggerGroup Trim TypeName UBound UCase VarType Weekday WeekdayName WriteEnum Year

syn keyword tsfConst Empty False Nothing Null ScriptEngine ScriptEngineBuildVersion ScriptEngineMajorVersion ScriptEngineMinorVersion True atsAll atsCancel atsClearMonitor atsClearOutput atsClearProject atsClearUserDebug atsEqual atsFail atsForever atsGreaterThan atsGreaterThanOrEqual atsGroup atsHalt atsHostComputer atsHostName atsHostVersion atsInRange atsInfo atsInput atsLessThan atsLessThanOrEqual atsNo atsNotEqual atsOk atsOutOfRange atsPass atsPassFail atsRamp atsReceive atsSawtooth atsServerComputer atsServerFramePeriod atsServerVersion atsShowMonitor atsShowOutput atsShowProject atsShowUserDebug atsSinusoid atsStep atsStepDoublet atsSyncError atsTransceive atsTransmit atsTriangle atsUsername atsYes atsYesNo vbAbortRetryIgnore vbApplicationModal vbArray vbBinaryCompare vbBlack vbBlue vbBoolean vbByte vbCr vbCrLf vbCritical vbCurrency vbCyan vbDataObject vbDatabaseCompare vbDate vbDecimal vbDefaultButton1 vbDefaultButton2 vbDefaultButton3 vbDefaultButton4 vbDouble vbEmpty vbError vbExclamation vbFirstFourDays vbFirstFullWeek vbFirstJan1 vbFormFeed vbFriday vbGeneralDate vbGreen vbInformation vbInteger vbLf vbLong vbLongDate vbLongTime vbMagenta vbMonday vbNewLine vbNo vbNull vbNullChar vbNullString vbOKCancel vbOKOnly vbObject vbObjectError vbQuestion vbRed vbRetryCancel vbSaturday vbShortDate vbShortTime vbSingle vbString vbSunday vbSystemModal vbTab vbTextCompare vbThursday vbTuesday vbUseSystem vbUseSystemDayOfWeek vbVariant vbVerticalTab vbWednesday vbWhite vbYellow vbYes vbYesNo vbYesNoCancel

"Numbers
"integer number, or floating point number without a dot.
syn match tsfNumber "\<\d\+\>"
"floating point number, with dot
syn match tsfNumber "\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match tsfNumber "\.\d\+\>"
syn match tsfFloat "[-+]\=\<\d\+[eE][\-+]\=\d\+"
syn match tsfFloat "[-+]\=\<\d\+\.\d*\([eE][\-+]\=\d\+\)\="
syn match tsfFloat "[-+]\=\<\.\d\+\([eE][\-+]\=\d\+\)\="

" String and Character constants
syn region tsfString  start=+"+     end=+"\|$+ contains=@Spell
syn region tsfComment start="\(^\s*\|\)'"   end="$"    contains=@Spell
syn match  tsfLineNumber     "^\d\+\(\s\|$\)"
syn match  tsfTypeSpecifier  "[a-zA-Z0-9][\$%&!#]"ms=s+1
syn match  tsfTypeSpecifier  "#[a-zA-Z0-9]"me=e-1

highlight link tsfConditional Keyword
highlight link tsfRepeat      Keyword
highlight link tsfOperator    Operator
highlight link tsfNumber      Number
highlight link tsfFloat       Float
highlight link tsfTypes       Type
highlight link tsfFunction    Function
highlight link tsfConst       Constant
highlight link tsfComment     Comment
highlight link tsfKeyword     Keyword
highlight link tsfString      String

let b:current_syntax = "tsf"

" vim: ts=8
