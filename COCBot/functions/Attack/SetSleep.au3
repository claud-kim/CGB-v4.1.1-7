; #FUNCTION# ====================================================================================================================
; Name ..........: SetSleep
; Description ...:
; Syntax ........: SetSleep($type)
; Parameters ....: $type                - Flag for type return desired.
; Return values .: None
; Author ........:
; Modified ......: KnowJack (June2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func SetSleep($type)
	Switch $type
		Case 0
			If $iChkRandomspeedatk[$iMatchMode] = 1 Then
				Return Round(Random(1, 10)) * 10
			ElseIf $iCmbUnitDelay[$iMatchMode] = 0 Then
				Return 1
			Else
				Return ($iCmbUnitDelay[$iMatchMode] ) * 10
			EndIf
		Case 1
			If $iChkRandomspeedatk[$iMatchMode] = 1 Then
				Return Round(Random(1, 10)) * 100
			ElseIf $iCmbWaveDelay[$iMatchMode] = 0 Then
				Return 1
			Else
				Return ($iCmbWaveDelay[$iMatchMode] ) * 100
			EndIf
	EndSwitch
EndFunc   ;==>SetSleep
