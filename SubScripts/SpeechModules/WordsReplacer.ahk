;------------------------------------------------------------------------------
; Words Replacer
;------------------------------------------------------------------------------
; Replaces common words with simpler or more bimbo-like versions. (ie. "best" => "bestest", "confused" => "ditzy"...)

loadWordReplacementsFromCSV() {
    replaceArr := []

    file := FileOpen("wordReplacementList.csv", "r") ; Load CSV file
    if (file) { ; file exists
        while (!file.AtEOF) { ; there are more lines
            line := file.ReadLine()
            if (line != "") { ; line is not blank
                parts := StrSplit(line, ",")
                if (parts.Length >= 2) {
                    replacement := Trim(parts[1])
                    for i, curr in parts {
                        if (i == 1) ; The first string is the replacement, skip it
                            continue

                        replaceArr.Push(Map("trigger", Trim(parts[i]), "replacement", replacement))
                    }
                }
            }
        }
        file.Close() ; always clean up
    }

    return replaceArr
}

loadWordReplacer(state) {
    if (toBool(state) == true) {
        replaceList := loadWordReplacementsFromCSV()
        Loop (replaceList.Length) {
            pair := replaceList[A_Index]
            triggerWord := pair["trigger"]
            replacement := pair["replacement"]
            Hotstring(":z:" . triggerWord, replacement)
        }


        Hotstring("reset")
    }
}