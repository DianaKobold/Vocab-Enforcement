;------------------------------------------------------------------------------
; Initializer
;------------------------------------------------------------------------------
; Initialize some parts of the scripts based on the settings

; Hotstring("EndChars", "-()[]`{}:;" "/\,.?!`n `t")

loadContractionsFormal(formalContractions)
loadContractionsInformal(informalContractions)
loadPronouns(renameMode, nameReplace, possessivePronoun)
loadGiggles(giggles)
loadWordReplacer(wordReplacer)
load3rdPersonVerbs(renameMode, nameReplace)
loadWordsRandomizer(wordsRandomizer)
loadPhonetic(phonetic)
loadVerbsSynonyms(verbsSynonyms, nameReplace)
loadPunctuation(punctuation)
if (hesitationMarks or hornyThoughts) {
	loadHesitationsAndHornyThoughts
}
; thoughtsBetweenWords(true) ; Doesn't work
