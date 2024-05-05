/*
 * * * Compile_AHK SETTINGS BEGIN * * *

[AHK2EXE]
Exe_File=%In_Dir%\Dumbtalk Script.exe
Compression=0
Created_Date=1
[VERSION]
Set_Version_Info=1
Company_Name=LexiOfTheEvening (Triskel#0001)
File_Description=Script automatically replacing what you type in discord desktop app with more bimbo-like stuff.
File_Version=2.0
Inc_File_Version=0
Internal_Name=Dumbtalk Script.ahk
Legal_Copyright=(c) 2017-2021 Triskelia (Triskel#0001) 2023 LexiOfTheEvening
Original_Filename=Dumbtalk Script.ahk
Product_Name=Dumbtalk Script
[ICONS]
Icon_1=%In_Dir%\Resources\img\Dumbtalk-Script-Icon-Running.ico
Icon_2=%In_Dir%\Resources\img\Dumbtalk-Script-Icon-Running.ico
Icon_3=%In_Dir%\Resources\img\Dumbtalk-Script-Icon-Paused.ico
Icon_4=%In_Dir%\Resources\img\Dumbtalk-Script-Icon-Running.ico
Icon_5=%In_Dir%\Resources\img\Dumbtalk-Script-Icon-Paused.ico

* * * Compile_AHK SETTINGS END * * *
*/

/*
Native Compile SETTINGS BEGIN
; @Ahk2Exe-SetMainIcon %A_ScriptDir%\Resources\img\Dumbtalk-Script-Icon-Running.ico
; @Ahk2Exe-ExeName %A_ScriptDir%\Dumbtalk Script.ahk
Native Compile SETTINGS END
*/

;------------------------------------------------------------------------------
; DUMBTALK SCRIPT
;------------------------------------------------------------------------------
; a fun script made by Bambi Trisky for her fellow Bambi friends <3
; Conversion to AHK v2 and modifications done by LexiOfTheEvening
; The conversion added a few settings, but has also changed it into a general
; bimbo dumbtalk script. Current changes only de-Bambi the script, allowing
; any name; the underlying Bambi concepts remain.

version := 2.0
#Include %A_ScriptDir%\SubScripts\Utils\Settings.ahk

SetTitleMatchMode 2
handledApps := applicationHandled
Loop(handledApps.Length) {
    handledApp := handledApps[A_Index]
    GroupAdd "handledApps", handledApp
}
#HotIf WinActive("ahk_class Notepad")

InstallKeybdHook
#SingleInstance force

Hotstring("EndChars", "-()[]{}:;`"/\,.?!`n`s`t")

;------------------------------------------------------------------------------
; SubScripts Imports
;------------------------------------------------------------------------------
; Order matters: Hotstrings in Includes at the bottom have a higher priority

; Helper Files
FileInstall "verbList.csv", "verbList.csv", 1
FileInstall "settings.ini", "settings.ini", 1

; Utils
#Include %A_ScriptDir%\SubScripts\Utils\Initializer.ahk
#Include %A_ScriptDir%\SubScripts\Utils\Functions.ahk

; Speech Modules
#Include %A_ScriptDir%\SubScripts\SpeechModules\ContractionsFormal.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\ContractionsInformal.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\Pronouns.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\Giggles.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\WordsReplacer.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\ThirdPersonVerbs.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\WordsRandomizer.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\Phonetic.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\VerbsSynonyms.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\Punctuation.ahk
#Include %A_ScriptDir%\SubScripts\SpeechModules\SentencesInsertions.ahk


