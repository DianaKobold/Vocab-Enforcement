;------------------------------------------------------------------------------
; Words randomizers
;------------------------------------------------------------------------------
; Replaces some words from a pool of more fitting synonyms. (like world replacer, but with several possible outcome)

loadWordsRandomizerFromCSV() {
    replaceArr := []

    file := FileOpen("wordsRandomizerList.csv", "r") ; Load CSV file
    if (file) { ; file exists
        while (!file.AtEOF) { ; there are more lines
            line := file.ReadLine()
            if (line != "") { ; line is not blank
                parts := StrSplit(line, A_Tab)
                if (parts.Length >= 2) {
                    replacements := Trim(parts[1])
                    for i, curr in parts {
                        if (i == 1) ; The first string is the replacements, skip it
                            continue

                        replaceArr.Push(Map("trigger", Trim(parts[i]), "replacements", replacements))
                    }
                }
            }
        }
        file.Close() ; always clean up
    }

    return replaceArr
}

loadWordsRandomizer(state) {
    if (toBool(state) == true) {
        replaceList := loadWordsRandomizerFromCSV()
        Loop (replaceList.Length) {
            pair := replaceList[A_Index]
            triggerWord := pair["trigger"]
            replacements := pair["replacements"]
            Hotstring(":z:" . triggerWord, randomString.Bind(, replacements))
        }


        Hotstring("reset")
    }
}