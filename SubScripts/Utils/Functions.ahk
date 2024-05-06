;------------------------------------------------------------------------------
; Functions
;------------------------------------------------------------------------------
; Some functions used throughout the script

/*
 * Randomly picks one of the elements of a list
 * RandomStuff: List of values
 * delim: Delimiter to use for values
 */
randomString(name?, RandomStuff := "", delim := "|") {
	; Randomly picked result
	CHOSEN := ""
	Loop Parse RandomStuff, delim {
		if (Random(0.0, 1.0) <= (1.0 / A_Index)) {
			CHOSEN := A_LoopField
		}
	}
	SendInput(CHOSEN)
	SendInput(A_EndChar)
}

/*
 * Custom SentInput command with more parameters for more control
 * string: String to add
 * numBackspace: Number of Backspace to perform before inserting the new string
 */
BsSendInput(string := "", numBackspace := "0") {
	SendInput "{BS " . numBackspace . "}" . string . "{" A_EndChar "}{Space}"
}

toBool(v) {
	return v = "true"
}