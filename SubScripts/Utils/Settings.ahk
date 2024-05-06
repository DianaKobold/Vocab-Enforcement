;------------------------------------------------------------------------------
; Settings Handler
;------------------------------------------------------------------------------
; Assign setting values from the ini file to global variables

; Rename Mode: Forces you to refer to yourself as the provided name (ie. "I" => "Bambi", "My" => "Bambi's"...)
renameMode_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "renameMode", true)
global renameMode := renameMode_Setting


; Name: Defaults to Bambi, but can be in settings.ini.
nameReplace_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "nameReplace", "Bambi")
global nameReplace := nameReplace_Setting

; Personal Pronoun: Defaults to she (ex. she/he/they), but can be in settings.ini
personalPronoun_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "personalPronoun", "she")
global personalPronoun := personalPronoun_Setting

; Possessive Pronoun: Defaults to her (ex. her/him/them), but can be in settings.ini
possessivePronoun_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "possessivePronoun", "her")
global possessivePronoun := possessivePronoun_Setting

; Formal contractions: aren't, could've, how're, etc...
formalContractions_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "formalContractions", true)
global formalContractions := formalContractions_Setting

; Informal contractions: aint, gonna, wanna, etc... (will override some formal contractions)
informalContractions_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "informalContractions", true)
global informalContractions := informalContractions_Setting

; Giggles: Replaces common laugh sounds (haha, lol, etc...) with *giggles*
giggles_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "giggles", true)
global giggles := giggles_Setting

; Word Replacer: Replaces common words with simpler or more bimbo-like versions. (ie. "best" => "bestest", "confused" => "ditzy"...)
wordReplacer_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "wordReplacer", true)
global wordReplacer := wordReplacer_Setting

; Words randomizers: Replace some words from a pool of more fitting synonyms. (like world replacer, but with several possible outcome)
wordsRandomizer_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "wordsRandomizer", true)
global wordsRandomizer := wordsRandomizer_Setting

; Phonetic: Replaces some common word sounds with phonetically similar ones (ie. "-ome" => "-um", "-ing" => "-in'")
phonetic_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "phonetic", true)
global phonetic := phonetic_Setting

; Verbs synonyms: Replaces some specifics verbs with more fitting synonyms. ("Bambi laughs" => "Bambi giggles")
verbsSynonyms_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "verbsSynonyms", true)
global verbsSynonyms := verbsSynonyms_Setting

; Punctuation: Randomly turns periods into questions, exclamations or tilde
punctuation_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "punctuation", true)
global punctuation := punctuation_Setting

; Hesitation Marks: Inserts some hesitation marks (ie. "ummm..." or "like...") from time to time
hesitationMarks_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "hesitationMarks", true)
global hesitationMarks := hesitationMarks_Setting

; Hesitation Chance: Chance (out of 1.0) of a hesitation mark being added
hesitationChance_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "hesitationChance", 0.2)
global hesitationChance := hesitationChance_Setting

; Horny Thoughts: Inserts some horny thoughts (ie. "... *god bambi is horny*...") from time to time (less common than hesitation marks)
hornyThoughts_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "hornyThoughts", true)
global hornyThoughts := hornyThoughts_Setting

; Horny Chance: Chance (out of 1.0) of your true, unfiltered, slutty thoughts coming out of your pretty little mouth~
hornyChance_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "hornyChance", 0.06)
global hornyChance := hornyChance_Setting

;------------------------------------------------------------------------------
; DEBUG
;------------------------------------------------------------------------------

; Set which application will be handled by the script
applicationHandled_Setting := IniRead(A_ScriptDir "\settings.ini", "SETTINGS", "applicationHandled", "Discord")
global applicationHandled := StrSplit(applicationHandled_Setting, ",")
if (applicationHandled == "ERROR") {
	applicationHandled := ["Discord"]
}
if (applicationHandled == "ALL") {
	applicationHandled := []
}

; Display settings summary at startup
settingSummary_Setting := IniRead(A_ScriptDir "\settings.ini", "DEBUG", "settingSummary")
if (toBool(settingSummary_Setting)) {
	MsgBox((LTrim(
		"Version: " version "`n"
		
		"[SETTINGS]"
		"Application Handled = " applicationHandled_Setting "`n"
		"Rename Mode = " renameMode_Setting "`n"
		"Name Replacement = " nameReplace_Setting "`n"
		"Personal Pronoun = " personalPronoun_Setting "`n"
		"Possessive Pronoun = " possessivePronoun_Setting "`n"
		"Informal Contractions = " informalContractions_Setting "`n"
		"Formal Contractions = " formalContractions_Setting "`n"
		"Giggles = " giggles_Setting "`n"
		"Word Replacer = " wordReplacer_Setting "`n"
		"Words Randomizer = " wordsRandomizer_Setting "`n"
		"Verbs Synonyms = " verbsSynonyms_Setting "`n"
		"Punctuation = " punctuation_Setting "`n"
		"Hesitation Marks = " hesitationMarks_Setting "`n"
		"Hesitation Chance = " hesitationChance_Setting "`n"
		"Horny Thoughts = " hornyThoughts_Setting "`n"
		"Horny Chance = " hornyChance_Setting "`n"
		
		"(You can prevent this window from showing up by setting the key 'settingSummary' to false in the 'settings.ini' file)"
	)))
	
}