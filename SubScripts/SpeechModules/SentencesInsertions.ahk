;------------------------------------------------------------------------------
; Random sentences insertion (Hesitation Marks & Horny Thoughts)
;------------------------------------------------------------------------------
; Hesitation Marks: Inserts some hesitation marks (ie. "ummm..." or "like...") from time to time
; Horny Thoughts: Inserts some horny thoughts (ie. "... *god bambi is horny*...") from time to time (less common than hesitation marks)

; Script had some issues and weirdness with random insertion, so it had to only be allowed after some specific words

loadInsertionList(filename) {
    insertions := ""

    file := FileOpen(filename, "r") ; Load TXT file
    if (file) { ; file exists
        while (!file.AtEOF) { ; there are more lines
            line := file.ReadLine()
            if (line != "") { ; line is not blank
				; Don't delimit first line
				if (A_Index > 1)
					insertions := insertions . A_Tab
				; Append next hesitation
                insertions := insertions . line
            }
        }
        file.Close() ; always clean up
    }

    return insertions
}

loadHesitationsAndHornyThoughts() {
	if (toBool(hesitationMarks) or toBool(hornyThoughts)) {
		; load the proper lists
		if (toBool(hesitationMarks)) {
			loadInsertionList("hesitationList.txt")
		}
		if (toBool(hornyThoughts)) {
			loadInsertionList("hornyThoughtList.txt")
		}

		Hotstring(":b0z*:and ", insertHesitationsAndHornyThoughts)
		Hotstring(":b0z*:to ", insertHesitationsAndHornyThoughts)
		Hotstring(":b0z?*:, ", insertHesitationsAndHornyThoughts)
		if (formalContractions == false) { ; Breaks formal contraction, only activate these hotstrings if it's off
			Hotstring(":b0z*:could ", insertHesitationsAndHornyThoughts)
			Hotstring(":b0z*:should ", insertHesitationsAndHornyThoughts)
			Hotstring(":b0z*:would ", insertHesitationsAndHornyThoughts)
		}
		Hotstring("reset")
	}

}

insertHesitationsAndHornyThoughts(name) {
	;TODO Rework the way probabilities are handled (Maybe add configuration from the .ini)
	thoughtRand := Random(0.0, 1.0) ; will trigger one of the next two outcomes

	if (thoughtRand < hornyChance) {
		if (toBool(hornyThoughts)) {
			sStrings := loadInsertionList("hornyThoughtList.txt")
			SendInput "{BS 1}"
			randomString(,sStrings, A_tab)
		}
	} else if (thoughtRand < hesitationChance) {
		if (toBool(hesitationMarks)) {
			sStrings := loadInsertionList("hesitationList.txt")
			randomString(,sStrings, A_tab)
		}
	}
}


;---------------------------------------------------------
; Randomly add the bimbo's thoughts between words ==> DOESN'T WORK
;---------------------------------------------------------
thoughtsBetweenWords(state) {
	Hotstring(":b0z?*: ", insertsThoughtsBetweenWords)
	Hotstring("reset")
}

insertsThoughtsBetweenWords() {
	Var := Random(1, 50)
	if (var = 1) {
		SendInput "{BS 1}"
		; SendInput {left 2}
		sStrings := ", like, | hmmm... | uhhh... | ummm... | um | er | uh |"
		randomString(,sStrings)
		; SendInput {right 2}
	}
}

; randomly add stuff at end of 10% of messages (only when pressing Enter)
; /!\ When enabled, the Enter key doesn't triggers other hotkeys anymore
/* #InputLevel 10
 * Enter::
 *   send, %A_Space%
 *   Random, Var, 1, 1
 *     AutoTrim, off
 *     if (var = 1) {
 *     RandomStuff =
 *     ( LTrim
 *     ` *giggles*| <3| ~|
 *     )
 *     randomString(RandomStuff)
 *     sendPlay, {enter}
 *     } else {
 *     sendPlay, {enter}
 *     }
 * return
 */

