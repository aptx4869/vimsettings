" Vim syntax file
" Language:         AutoHotkey script file
" Maintainer:       Nikolai Weibull <now@bitwi.se>
" Latest Revision:  2008-06-22

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

syn keyword autohotkeyTodo
      \ contained
      \ TODO FIXME XXX NOTE

syn cluster autohotkeyCommentGroup
      \ contains=
      \   autohotkeyTodo,
      \   @Spell

syn match   autohotkeyComment
      \ display
      \ contains=@autohotkeyCommentGroup
      \ '`\@<!;.*$'

syn region  autohotkeyComment
      \ contains=@autohotkeyCommentGroup
      \ matchgroup=autohotkeyCommentStart
      \ start='/\*'
      \ end='\*/'

syn match   autohotkeyEscape
      \ display
      \ '`.'

syn match   autohotkeyHotkey
      \ contains=autohotkeyKey,
      \   autohotkeyHotkeyDelimiter
      \ display
      \ '^.\{-}::'

syn match   autohotkeyKey
      \ contained
      \ display
      \ '^.\{-}'

syn match   autohotkeyDelimiter
      \ contained
      \ display
      \ '::'

syn match   autohotkeyHotstringDefinition
      \ contains=autohotkeyHotstring,
      \   autohotkeyHotstringDelimiter
      \ display
      \ '^:\%(B0\|C1\|K\d\+\|P\d\+\|S[IPE]\|Z\d\=\|[*?COR]\)*:.\{-}::'

syn match   autohotkeyHotstring
      \ contained
      \ display
      \ '.\{-}'

syn match   autohotkeyHotstringDelimiter
      \ contained
      \ display
      \ '::'

syn match   autohotkeyHotstringDelimiter
      \ contains=autohotkeyHotstringOptions
      \ contained
      \ display
      \ ':\%(B0\|C1\|K\d\+\|P\d\+\|S[IPE]\|Z\d\=\|[*?COR]\):'

syn match   autohotkeyHotstringOptions
      \ contained
      \ display
      \ '\%(B0\|C1\|K\d\+\|P\d\+\|S[IPE]\|Z\d\=\|[*?COR]\)'

syn region autohotkeyString
      \ display
      \ oneline
      \ matchgroup=autohotkeyStringDelimiter
      \ start=+"+
      \ end=+"+
      \ contains=autohotkeyEscape

syn region autohotkeyVariable
      \ display
      \ oneline
      \ contains=autohotkeyBuiltinVariable
      \ matchgroup=autohotkeyVariableDelimiter
      \ start="%"
      \ end="%"
      \ keepend

syn keyword autohotkeyKeyList
    \ Ctrl CtrlBreak CtrlDown CtrlUp 
    \ Alt AltDown AltSubmit AltTab AltTabAndMenu AltTabMenu AltTabMenuDismiss AltUp
    \ F1 F10 F11 F12 F13 F14 F15 F16 F17 F18 F19 F2 
    \ F20 F21 F22 F23 F24 F3 F4 F5 F6 F7 F8 F9 
    \ Joy1 Joy10 Joy11 Joy12 Joy13 Joy14 Joy15 Joy16 
    \ Joy17 Joy18 Joy19 Joy2 Joy20 Joy21 Joy22 Joy23 
    \ Joy24 Joy25 Joy26 Joy27 Joy28 Joy29 Joy3 Joy30 
    \ Joy31 Joy32 Joy4 Joy5 Joy6 Joy7 Joy8 Joy9 
    \ JoyAxes JoyButtons JoyInfo JoyName JoyPov Joyr Joyu Joyv Joyx Joyy Joyz 
    \ Launch_App1 Launch_aPp2 Launch_Mail Launch_Media LButton LControl LCtrl 
    \ NumLock Numpad0 Numpad1 Numpad2 Numpad3 Numpad4 Numpad5 Numpad6 
    \ Numpad7 Numpad8 Numpad9 NumpadAdd NumpadClear NumpadDel NumpadDiv NumpadDot 
    \ NumpadDown NumpadEnd NumpadEnter NumpadHome NumpadIns NumpadLeft 
    \ NumpadMult NumpadPgDn NumpadPgUp NumpadRight NumpadSub NumpadUp 
    \ Shift ShiftAltTab ShiftDown ShiftUp
    \ XButton1 XButton2 RAlt RButton RControl RCtrl LAlt LShift LWin LWinDown LWinUp
    \ MButton RShift RWin RWinDown RWinUp ScrollLock PgDn PgUp 
    \ Volume_Down Volume_Mute Volume_Up Space Right Up Down Left TAB BS
    \ Esc Enter End Home Del AppsKey WheelDown 
    \ WheelLeft WheelRight WheelUp  Browser_Back Browser_Favorites
    \ Browser_Forward Browser_Home Browser_Refresh Browser_Search
    \ Browser_Stop Delete Escape Ins Insert Media_Next
    \ Media_Play_Pause Media_Prev Media_Stop 

" TODO : Add these keywords in the right place:
" \ Abort  Add  All Alnum 
" \ Alpha AlwaysOnTop And Appskey 
" \ Array Background BackgroundTrans BackSpace 
" \ Between Blind Border Bottom 
" \ Button Buttons Cancel Capacity CapsLock Caption 
" \ Center Char CharP Check 
" \ Check3 Checkbox Checked CheckedGray 
" \ Choose ChooseString  Close Color 
" \ ComboBox Contains ControlList Count 
" \ Date DateTime Days DDL 
" \ Default DeleteAll 
" \ Delimiter Deref Destroy Digit 
" \ Disable Disabled Double DoubleP 
" \ DropDownList Eject Enable 
" \ Enabled EndRepeat
" \ Error ExStyle 
" \ FileEncoding FileOpen FileSystem Flash 
" \ Float FloatFast FloatP Focus 
" \ Font Group GroupBox Hdr 
" \ Hex Hidden Hide HideAutoitwin 
" \ HKCC HKCR HKCU HKEY_CLASSES_ROOT 
" \ HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS 
" \ HKLM HKU Home Hours 
" \ hp HScroll Icon ID 
" \ IDLast Ignore In  Interrupt IntP Is 
" \ Join Label LastFound Left 
" \ Limit List ListBox ListView 
" \ Lock Logoff Lower LowerCase 
" \ LTrim MainWindow Margin Maximize 
" \ MaximizeBox Minimize MinimizeBox MinMax 
" \ MinSize Minutes MonthCal Mouse 
" \ Move Multi NA No 
" \ NoActivate NoDefault NoHide NoIcon 
" \ NoMainWindow NoStandard Not NoTab 
" \ NoTimers Number NumGet NumPut 
" \ Off Ok On Or 
" \ OwnDialogs Owner Parse Password 
" \ Pic Picture Pixel Pos 
" \ Pow PrintScreen Priority ProcessName 
" \ Radio Raw read ReadOnly 
" \ Redraw REG_BINARY REG_DWORD REG_DWORD_BIG_ENDIAN 
" \ REG_EXPAND_SZ REG_FULL_RESOURCE_DESCRIPTOR REG_LINK REG_MULTI_SZ 
" \ REG_QWORD REG_RESOURCE_LIST REG_RESOURCE_REQUIREMENTS_LIST REG_SZ  
" \ Region RegisterCallback  Relative Rename 
" \ Repeat Resize Restore Retry 
" \ RGB RTrim Screen 
" \ Seconds Section SerialSetCapsLockState SetLabel 
" \ SetNumLockState SetScrollLockState Short ShortP 
" \ Show Single Slider Space 
" \ Standard Static Status StatusBar 
" \ StatusCD Str StrGet StringLen 
" \ StrP StrPut Style Submit 
" \ SysMenu Tab Tab2 TabStop 
" \ text Theme Time Tip 
" \ ToggleCheck ToggleEnable ToolWindow Top 
" \ TopMost TransColor Transparent Tray 
" \ TreeView Trim Type UnCheck 
" \ Unicode UnLock Up UpDown 
" \ Upper UpperCase UseErrorLevel UShort 
" \ UShortP UStr UStrP Visible 
" \ VScroll WaitClose WantReturn wp 
" \ Wrap Xdigit xm xp xs Yes ym yp ys
" syn region autohotkeyWrongKeys
syn match autohotkeyKeyList
      \ contained
      \ contains=autohotkeyKeyList
      \ display
      \ "{\@<=\w*.\@=\w" 

syn match autohotkeyWrongKeys
      \ display
      \ "{\@<=\w*.\@=\w" 

syn keyword autohotkeyBuiltinVariable
      \ A_Space A_Tab
      \ A_WorkingDir A_ScriptDir A_ScriptName A_ScriptFullPath A_LineNumber
      \ A_LineFile A_AhkVersion A_AhkPAth A_IsCompiled A_ExitReason
      \ A_YYYY A_MM A_DD A_MMMM A_MMM A_DDDD A_DDD A_WDay A_YWeek A_Hour A_Min
      \ A_Sec A_MSec A_Now A_NowUTC A_TickCount
      \ A_IsSuspended A_BatchLines A_TitleMatchMode A_TitleMatchModeSpeed
      \ A_DetectHiddenWindows A_DetectHiddenText A_AutoTrim A_STringCaseSense
      \ A_FormatInteger A_FormatFloat A_KeyDelay A_WinDelay A_ControlDelay
      \ A_MouseDelay A_DefaultMouseSpeed A_IconHidden A_IconTip A_IconFile
      \ A_IconNumber
      \ A_TimeIdle A_TimeIdlePhysical
      \ A_Gui A_GuiControl A_GuiWidth A_GuiHeight A_GuiX A_GuiY A_GuiEvent
      \ A_GuiControlEvent A_EventInfo
      \ A_ThisMenuItem A_ThisMenu A_ThisMenuItemPos A_ThisHotkey A_PriorHotkey
      \ A_TimeSinceThisHotkey A_TimeSincePriorHotkey A_EndChar
      \ ComSpec A_Temp A_OSType A_OSVersion A_Language A_ComputerName A_UserName
      \ A_WinDir A_ProgramFiles ProgramFiles A_AppData A_AppDataCommon A_Desktop
      \ A_DesktopCommon A_StartMenu A_StartMenuCommon A_Programs
      \ A_ProgramsCommon A_Startup A_StartupCommon A_MyDocuments A_IsAdmin
      \ A_ScreenWidth A_ScreenHeight A_IPAddress1 A_IPAddress2 A_IPAddress3
      \ A_IPAddress4
      \ A_Cursor A_CaretX A_CaretY Clipboard ClipboardAll ErrorLevel A_LastError
      \ A_Index A_LoopFileName A_LoopRegName A_LoopReadLine A_LoopField
      \ A_LoopFileAttrib A_LoopFileDir A_LoopFileExt A_LoopFileFullPath
      \ A_LoopFileLongPath A_LoopFileShortName A_LoopFileSize
      \ A_LoopFileSizeKB A_LoopFileTimeAccessed A_LoopFileTimeModified A_LoopFileSizeMB
      \ A_IsCritical A_IsPaused A_LoopFileAttrib A_LoopFileDir A_LoopFileExt 
      \ A_LoopFileFullPath A_LoopFileLongPath A_LoopFileShortName A_LoopFileShortPath 
      \ A_LoopFileSize A_LoopFileSizeKB A_LoopFileSizeMB A_LoopFileTimeAccessed 
      \ A_LoopFileTimeCreated A_LoopFileTimeModified A_LoopRegKey A_LoopRegSubkey 
      \ A_LoopRegTimeModified A_LoopRegType A_MDAY A_Mon 
      \ A_NumBatchLines A_ThisFunc A_ThisLabel A_YDay A_Year 
      

syn match   autohotkeyBuiltinVariable
      \ contained
      \ display
      \ '%\d\+%'

syn keyword autohotkeyCommand
      \ ClipWait EnvGet EnvSet EnvUpdate
      \ Drive DriveGet DriveSpaceFree FileAppend FileCopy FileCopyDir
      \ FileCreateDir FileCreateShortcut FileDelete FileGetAttrib
      \ FileGetShortcut FileGetSize FileGetTime FileGetVersion FileInstall
      \ FileMove FileMoveDir FileReadLine FileRead FileRecycle FileRecycleEmpty
      \ FileRemoveDir FileSelectFolder FileSelectFile FileSetAttrib FileSetTime
      \ IniDelete IniRead IniWrite SetWorkingDir
      \ SplitPath
      \ Gui GuiControl GuiControlGet IfMsgBox InputBox MsgBox Progress
      \ SplashImage SplashTextOn SplashTextOff ToolTip TrayTip
      \ Hotkey ListHotkeys BlockInput ControlSend ControlSendRaw GetKeyState
      \ KeyHistory KeyWait Input Send SendRaw SendInput SendPlay SendEvent
      \ SendMode SetKeyDelay SetNumScrollCapsLockState SetStoreCapslockMode
      \ EnvAdd EnvDiv EnvMult EnvSub Random SetFormat Transform
      \ AutoTrim BlockInput CoordMode Critical Edit ImageSearch
      \ ListLines ListVars Menu OutputDebug PixelGetColor PixelSearch
      \ SetBatchLines SetEnv SetTimer SysGet Thread Transform URLDownloadToFile
      \ Click ControlClick MouseClick MouseClickDrag MouseGetPos MouseMove
      \ SetDefaultMouseSpeed SetMouseDelay
      \ Process Run RunWait RunAs Shutdown Sleep
      \ RegDelete RegRead RegWrite
      \ SoundBeep SoundGet SoundGetWaveVolume SoundPlay SoundSet
      \ SoundSetWaveVolume
      \ FormatTime IfInString IfNotInString Sort StringCaseSense StringGetPos
      \ StringLeft StringRight StringLower StringUpper StringMid StringReplace
      \ StringSplit StringTrimLeft StringTrimRight
      \ Control ControlClick ControlFocus ControlGet ControlGetFocus
      \ ControlGetPos ControlGetText ControlMove ControlSend ControlSendRaw
      \ ControlSetText Menu PostMessage SendMessage SetControlDelay
      \ WinMenuSelectItem GroupActivate GroupAdd GroupClose GroupDeactivate
      \ DetectHiddenText DetectHiddenWindows SetTitleMatchMode SetWinDelay
      \ StatusBarGetText StatusBarWait WinActivate WinActivateBottom WinClose
      \ WinGet WinGetActiveStats WinGetActiveTitle WinGetClass WinGetPos
      \ WinGetText WinGetTitle WinHide WinKill WinMaximize WinMinimize
      \ WinMinimizeAll WinMinimizeAllUndo WinMove WinRestore WinSet
      \ WinSetTitle WinShow WinWait WinWaitActive WinWaitNotActive WinWaitClose
      \ ByRef BitAnd BitNot BitOr BitShiftLeft BitShiftRight BitXOr 

      
syn keyword autohotkeyFunction
      \ InStr RegExMatch RegExReplace StrLen SubStr Asc Chr
      \ DllCall VarSetCapacity WinActive WinExist IsLabel OnMessage 
      \ Abs Ceil Exp Floor Log Ln Mod Round Sqrt Sin Cos Tan ASin ACos ATan
      \ FileExist GetKeyState
      \ Exception
      \ _Addref _Clone _Getaddress _Getcapacity 
      \ _Haskey _Insert _Maxindex _Minindex 
      \ _Newenum _Release _Remove _Setcapacity 
      \ IsFunc IsObject Lv_Add Lv_Delete Lv_DeleteCol Lv_GetCount
      \ Lv_GetNext Lv_GetText Lv_Insert Lv_InsertCol Lv_Modify Lv_ModifyCol
      \ Lv_SetImageList Tv_Add Tv_Delete Tv_Get Tv_GetChild Tv_GetCount
      \ Tv_GetNext Tv_GetParent Tv_GetPrev Tv_GetSelection Tv_GetText Tv_Modify 
      \ Il_Add Il_Create Il_Destroy Sb_SetIcon Sb_SetParts Sb_SetText 
    \ ObjGetCapacity ObjHasKey ObjInsert ObjMaxIndex ObjMinIndex ObjNewEnum
	\ ObjRelease ObjRemove ObjSetCapacity ComObjActive ComObjArray 
	\ ComObjConnect ComObjCreate ComObjEnwrap ComObjError ComObjFlags
	\ ComObjGet ComObjMissing ComObjParameter ComObjquery ComObjType 
	\ ComObjUnwrap ComObjValue ObjAddref ObjClone Object ObjGetAddress


syn keyword autohotkeyStatement
      \ Break Continue Exit ExitApp Gosub Goto OnExit Pause Return
      \ Suspend Reload

syn keyword autohotkeyRepeat
      \ Loop For While

syn keyword autohotkeyConditional
      \ IfExist IfNotExist If IfEqual IfLess IfGreater Else
      \ IfGreaterOrEqual IfLessOrEqual IfNotEqual IfWinActive IfWinExist IfWinNotActive IfWinNotExist

syn match   autohotkeyPreProcStart
      \ nextgroup=
      \   autohotkeyInclude,
      \   autohotkeyPreProc
      \ skipwhite
      \ display
      \ '^\s*\zs#'

syn keyword autohotkeyInclude
      \ contained
      \ Include
      \ IncludeAgain

syn keyword autohotkeyPreProc
      \ contained
      \ HotkeyInterval HotKeyModifierTimeout
      \ Hotstring
      \ IfWinActive IfWinNotActive IfWinExist IfWinNotExist
      \ MaxHotkeysPerInterval MaxThreads MaxThreadsBuffer MaxThreadsPerHotkey
      \ UseHook InstallKeybdHook InstallMouseHook
      \ KeyHistory
      \ NoTrayIcon SingleInstance
      \ WinActivateForce
      \ AllowSameLineComments
      \ ClipboardTimeout
      \ CommentFlag
      \ ErrorStdOut
      \ EscapeChar
      \ MaxMem
      \ NoEnv
      \ Persistent
      \ If

syn keyword autohotkeyMatchClass
      \ ahk_group ahk_class ahk_id ahk_pid

syn match   autohotkeyNumbers
      \ display
      \ transparent
      \ contains=
      \   autohotkeyInteger,
      \   autohotkeyFloat
      \ '\<\d\|\.\d'

syn match   autohotkeyInteger
      \ contained
      \ display
      \ '\d\+\>'

syn match   autohotkeyInteger
      \ contained
      \ display
      \ '0x\x\+\>'

syn match   autohotkeyFloat
      \ contained
      \ display
      \ '\d\+\.\d*\|\.\d\+\>'

syn keyword autohotkeyType
      \ local
      \ global
	\ Int Int64 Int64P Integer IntegerFast 
    \ UChar UCharP UInt UInt64 UInt64P UIntP

syn keyword autohotkeyBoolean
      \ true
      \ false

" TODO: Shouldn't we look for g:, b:,  variables before defaulting to
" something?
if exists("g:autohotkey_syntax_sync_minlines")
  let b:autohotkey_syntax_sync_minlines = g:autohotkey_syntax_sync_minlines
else
  let b:autohotkey_syntax_sync_minlines = 50
endif
exec "syn sync ccomment autohotkeyComment minlines=" . b:autohotkey_syntax_sync_minlines

hi def link autohotkeyTodo                Todo
hi def link autohotkeyComment             Comment
hi def link autohotkeyCommentStart        autohotkeyComment
hi def link autohotkeyEscape              Special
hi def link autohotkeyHotkey              Type
hi def link autohotkeyKey                 Type
hi def link autohotkeyDelimiter           Delimiter
hi def link autohotkeyHotstringDefinition Type
hi def link autohotkeyHotstring           Type
hi def link autohotkeyHotstringDelimiter  autohotkeyDelimiter
hi def link autohotkeyHotstringOptions    Special
hi def link autohotkeyString              String
hi def link autohotkeyStringDelimiter     autohotkeyString
hi def link autohotkeyVariable            Identifier
hi def link autohotkeyVariableDelimiter   autohotkeyVariable
hi def link autohotkeyBuiltinVariable     Macro
hi def link autohotkeyCommand             Keyword
hi def link autohotkeyFunction            Function
hi def link autohotkeyStatement           autohotkeyCommand
hi def link autohotkeyRepeat              Repeat
hi def link autohotkeyConditional         Conditional
hi def link autohotkeyPreProcStart        PreProc
hi def link autohotkeyInclude             Include
hi def link autohotkeyPreProc             PreProc
hi def link autohotkeyMatchClass          Typedef
hi def link autohotkeyNumber              Number
hi def link autohotkeyInteger             autohotkeyNumber
hi def link autohotkeyFloat               autohotkeyNumber
hi def link autohotkeyType                Type
hi def link autohotkeyBoolean             Boolean
hi def link autohotkeyKeyList 	 	  autohotkeyKey
hi def link autohotkeyWrongKeys 	  Error
let b:current_syntax = "autohotkey"

let &cpo = s:cpo_save
unlet s:cpo_save
