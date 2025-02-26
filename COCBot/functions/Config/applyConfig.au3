; #FUNCTION# ====================================================================================================================
; Name ..........: applyConfig.au3
; Description ...: Applies all of the  variable to the GUI
; Syntax ........: applyConfig()
; Parameters ....: NA
; Return values .: NA
; Author ........:
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================


Func applyConfig() ;Applies the data from config to the controls in GUI
	;General Settings--------------------------------------------------------------------------
	If $frmBotPosX <> -32000 Then WinMove($sBotTitle, "", $frmBotPosX, $frmBotPosY)

	If $iVillageName = "" Then
		GUICtrlSetData($txtVillageName, "MyVillage")
	Else
		GUICtrlSetData($txtVillageName, $iVillageName)
	EndIf
	txtVillageName()

	_GUICtrlComboBox_SetCurSel($cmbLog, $iCmbLog)
	cmbLogImpl(True)

	If $ichkAutoStart = 1 Then
		GUICtrlSetState($chkAutoStart, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAutoStart, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtAutoStartDelay, $ichkAutoStartDelay)
	chkAutoStart()
	If $ichkBackground = 1 Then
		GUICtrlSetState($chkBackground, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkBackground, $GUI_UNCHECKED)
	EndIf
	chkBackground() ;Applies it to hidden button

	If $ichkBotStop = 1 Then
		GUICtrlSetState($chkBotStop, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkBotStop, $GUI_UNCHECKED)
	EndIf

	If $ichkIceBreaker = 1 Then
		GUICtrlSetState($chkIceBreaker, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkIceBreaker, $GUI_UNCHECKED)
	EndIf

	If $ichkKeepAlive = 1 Then
		GUICtrlSetState($chkKeepAlive, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkKeepAlive, $GUI_UNCHECKED)
	EndIf

	If $ichkClanAd = 1 Then
		GUICtrlSetState($chkClanAd, $GUI_CHECKED)
		GUICtrlSetState($txtClanAd, $GUI_CHECKED)
		GUICtrlSetData($txtClanAd, $itxtClanAd)
	Else
		GUICtrlSetState($chkClanAd, $GUI_UNCHECKED)
		GUICtrlSetState($txtClanAd, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbBotCommand, $icmbBotCommand)
	_GUICtrlComboBox_SetCurSel($cmbBotCond, $icmbBotCond)
	_GUICtrlComboBox_SetCurSel($cmbHoursStop, $icmbHoursStop)
	cmbBotCond()

	If $iDisposeWindows = 1 Then
		GUICtrlSetState($chkDisposeWindows, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDisposeWindows, $GUI_UNCHECKED)
	EndIf
	chkDisposeWindows()
	_GUICtrlComboBox_SetCurSel($cmbDisposeWindowsCond, $icmbDisposeWindowsPos)



	;Search Settings------------------------------------------------------------------------
	_GUICtrlComboBox_SetCurSel($cmbSearchMode, $iCmbSearchMode)
	cmbSearchMode()

	If $AlertSearch = 1 Then
		GUICtrlSetState($chkAlertSearch, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAlertSearch, $GUI_UNCHECKED)
	EndIf

	If $AlertSearchError = 1 Then
		GUICtrlSetState($chkAlertSearchError, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAlertSearchError, $GUI_UNCHECKED)
	EndIf

	If $iChkEnableAfter[$DB] = 1 Then
		GUICtrlSetState($chkDBEnableAfter, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
	EndIf
	chkDBEnableAfter()

	_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, $iCmbMeetGE[$DB])
	cmbDBGoldElixir()

	If $iChkMeetDE[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetDE, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetDE, $GUI_UNCHECKED)
	EndIf
	chkDBMeetDE()

	If $iChkMeetTrophy[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetTrophy, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetTrophy, $GUI_UNCHECKED)
	EndIf
	chkDBMeetTrophy()

	If $iChkMeetTH[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetTH, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetTH, $GUI_UNCHECKED)
	EndIf
	chkDBMeetTH()

	If $iChkMeetTHO[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetTHO, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
	EndIf

	If $iChkWeakBase[$DB] = 1 Then
		GUICtrlSetState($chkDBWeakBase, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBWeakBase, $GUI_UNCHECKED)
	EndIf
	chkDBWeakBase()

	If $iChkMeetOne[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetOne, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtDBEnableAfter, $iEnableAfterCount[$DB])
	GUICtrlSetData($txtDBMinGold, $iMinGold[$DB])
	GUICtrlSetData($txtDBMinElixir, $iMinElixir[$DB])
	GUICtrlSetData($txtDBMinGoldPlusElixir, $iMinGoldPlusElixir[$DB])
	GUICtrlSetData($txtDBMinDarkElixir, $iMinDark[$DB])
	GUICtrlSetData($txtDBMinTrophy, $iMinTrophy[$DB])

	_GUICtrlComboBox_SetCurSel($cmbDBTH, $iCmbTH[$DB])
	$iMaxTH[$DB] = $THText[$iCmbTH[$DB]]
	_GUICtrlComboBox_SetCurSel($cmbDBWeakMortar, $iCmbWeakMortar[$DB])
	_GUICtrlComboBox_SetCurSel($cmbDBWeakWizTower, $iCmbWeakWizTower[$DB])

	If $iChkEnableAfter[$LB] = 1 Then
		GUICtrlSetState($chkABEnableAfter, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABEnableAfter, $GUI_UNCHECKED)
	EndIf
	chkABEnableAfter()

	_GUICtrlComboBox_SetCurSel($cmbABMeetGE, $iCmbMeetGE[$LB])
	cmbABGoldElixir()

	If $iChkMeetDE[$LB] = 1 Then
		GUICtrlSetState($chkABMeetDE, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetDE, $GUI_UNCHECKED)
	EndIf
	chkABMeetDE()

	If $iChkMeetTrophy[$LB] = 1 Then
		GUICtrlSetState($chkABMeetTrophy, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetTrophy, $GUI_UNCHECKED)
	EndIf
	chkABMeetTrophy()

	If $iChkMeetTH[$LB] = 1 Then
		GUICtrlSetState($chkABMeetTH, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetTH, $GUI_UNCHECKED)
	EndIf
	chkABMeetTH()

	If $iChkMeetTHO[$LB] = 1 Then
		GUICtrlSetState($chkABMeetTHO, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
	EndIf

	If $iChkWeakBase[$LB] = 1 Then
		GUICtrlSetState($chkABWeakBase, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABWeakBase, $GUI_UNCHECKED)
	EndIf
	chkABWeakBase()

	If $iChkMeetOne[$LB] = 1 Then
		GUICtrlSetState($chkABMeetOne, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtABMinGold, $iMinGold[$LB])
	GUICtrlSetData($txtABMinElixir, $iMinElixir[$LB])
	GUICtrlSetData($txtABMinGoldPlusElixir, $iMinGoldPlusElixir[$LB])
	GUICtrlSetData($txtABMinDarkElixir, $iMinDark[$LB])
	GUICtrlSetData($txtABMinTrophy, $iMinTrophy[$LB])
	GUICtrlSetData($txtABEnableAfter, $iEnableAfterCount[$LB])

	_GUICtrlComboBox_SetCurSel($cmbABTH, $iCmbTH[$LB])
	$iMaxTH[$LB] = $THText[$iCmbTH[$LB]]
	_GUICtrlComboBox_SetCurSel($cmbABWeakMortar, $iCmbWeakMortar[$LB])
	_GUICtrlComboBox_SetCurSel($cmbABWeakWizTower, $iCmbWeakWizTower[$LB])

	;Hero Filters
	_GUICtrlComboBox_SetCurSel($cmbSkipCentreDE, $iSkipCentreDE)
	_GUICtrlComboBox_SetCurSel($cmbSkipUndetectedDE, $iSkipUndetectedDE)

	_GUICtrlComboBox_SetCurSel($cmbABMeetGEHero, $iCmbMeetGEHero)

	If $iChkMeetDEHero = 1 Then
		GUICtrlSetState($chkABMeetDEHero, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetDEHero, $GUI_UNCHECKED)
	EndIf
	chkABMeetDEHero()

	If $iChkMeetTrophyHero = 1 Then
		GUICtrlSetState($chkABMeetTrophyHero, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetTrophyHero, $GUI_UNCHECKED)
	EndIf
	chkABMeetTrophyHero()

	If $iChkMeetTHHero = 1 Then
		GUICtrlSetState($chkABMeetTHHero, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetTHHero, $GUI_UNCHECKED)
	EndIf
	chkABMeetTHHero()

	If $iChkMeetTHO[$LB] = 1 Then
		GUICtrlSetState($chkABMeetTHOHero, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetTHOHero, $GUI_UNCHECKED)
	EndIf

	If $iChkWeakBaseHero = 1 Then
		GUICtrlSetState($chkABWeakBaseHero, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABWeakBaseHero, $GUI_UNCHECKED)
	EndIf
	chkABWeakBaseHero()

	If $iChkMeetOneHero = 1 Then
		GUICtrlSetState($chkABMeetOneHero, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetOneHero, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtABMinGoldHero, $iMinGoldHero)
	GUICtrlSetData($txtABMinElixirHero, $iMinElixirHero)
	GUICtrlSetData($txtABMinGoldPlusElixirHero, $iMinGoldPlusElixirHero)
	GUICtrlSetData($txtABMinDarkElixirHero, $iMinDarkHero)
	GUICtrlSetData($txtABMinTrophyHero, $iMinTrophyHero)

	_GUICtrlComboBox_SetCurSel($cmbABTHHero, $iCmbTHHero)
	$iMaxTHHero = $THText[$iCmbTHHero]
	_GUICtrlComboBox_SetCurSel($cmbABWeakMortarHero, $iCmbWeakMortarHero)
	_GUICtrlComboBox_SetCurSel($cmbABWeakWizTowerHero, $iCmbWeakWizTowerHero)

	If $LBBKFilter = 1 Then
		GUICtrlSetState($chkLBBKFilter, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
	EndIf
	If $LBAQFilter = 1 Then
		GUICtrlSetState($chkLBAQFilter, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
	EndIf


	If $iChkSearchReduction = 1 Then
		GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSearchReduction, $GUI_UNCHECKED)
	EndIf
	chkSearchReduction()

	GUICtrlSetData($txtSearchReduceCount, $ReduceCount)
	GUICtrlSetData($txtSearchReduceGold, $ReduceGold)
	GUICtrlSetData($txtSearchReduceElixir, $ReduceElixir)
	GUICtrlSetData($txtSearchReduceGoldPlusElixir, $ReduceGoldPlusElixir)
	GUICtrlSetData($txtSearchReduceDark, $ReduceDark)
	GUICtrlSetData($txtSearchReduceTrophy, $ReduceTrophy)

	;Attack Settings-------------------------------------------------------------------------
	_GUICtrlComboBox_SetCurSel($cmbDBDeploy, $iChkDeploySettings[$DB])
	_GUICtrlComboBox_SetCurSel($cmbDBUnitDelay, $iCmbUnitDelay[$DB])
	_GUICtrlComboBox_SetCurSel($cmbDBWaveDelay, $iCmbWaveDelay[$DB])
	If $iChkRandomspeedatk[$DB] = 1 Then
		GUICtrlSetState($chkDBRandomSpeedAtk, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBRandomSpeedAtk, $GUI_UNCHECKED)
	EndIf
	chkDBRandomSpeedAtk()

	_GUICtrlComboBox_SetCurSel($cmbABDeploy, $iChkDeploySettings[$LB])
	_GUICtrlComboBox_SetCurSel($cmbABUnitDelay, $iCmbUnitDelay[$LB])
	_GUICtrlComboBox_SetCurSel($cmbABWaveDelay, $iCmbWaveDelay[$LB])
	If $iChkRandomspeedatk[$LB] = 1 Then
		GUICtrlSetState($chkABRandomSpeedAtk, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABRandomSpeedAtk, $GUI_UNCHECKED)
	EndIf
	chkABRandomSpeedAtk()

	_GUICtrlComboBox_SetCurSel($cmbDBSelectTroop, $iCmbSelectTroop[$DB])
	_GUICtrlComboBox_SetCurSel($cmbABSelectTroop, $iCmbSelectTroop[$LB])

	If $iChkRedArea[$DB] = 1 Then
		GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_UNCHECKED)
	EndIf
	chkDBSmartAttackRedArea()

	_GUICtrlComboBox_SetCurSel($cmbDBSmartDeploy, $iCmbSmartDeploy[$DB])

	If $iChkSmartAttack[$DB][0] = 1 Then
		GUICtrlSetState($chkDBAttackNearGoldMine, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBAttackNearGoldMine, $GUI_UNCHECKED)
	EndIf

	If $iChkSmartAttack[$DB][1] = 1 Then
		GUICtrlSetState($chkDBAttackNearElixirCollector, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBAttackNearElixirCollector, $GUI_UNCHECKED)
	EndIf

	If $iChkSmartAttack[$DB][2] = 1 Then
		GUICtrlSetState($chkDBAttackNearDarkElixirDrill, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBAttackNearDarkElixirDrill, $GUI_UNCHECKED)
	EndIf

	If $iChkRedArea[$LB] = 1 Then
		GUICtrlSetState($chkABSmartAttackRedArea, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
	EndIf
	chkABSmartAttackRedArea()

	_GUICtrlComboBox_SetCurSel($cmbABSmartDeploy, $iCmbSmartDeploy[$LB])

	If $iChkSmartAttack[$LB][0] = 1 Then
		GUICtrlSetState($chkABAttackNearGoldMine, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABAttackNearGoldMine, $GUI_UNCHECKED)
	EndIf

	If $iChkSmartAttack[$LB][1] = 1 Then
		GUICtrlSetState($chkABAttackNearElixirCollector, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABAttackNearElixirCollector, $GUI_UNCHECKED)
	EndIf

	If $iChkSmartAttack[$LB][2] = 1 Then
		GUICtrlSetState($chkABAttackNearDarkElixirDrill, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABAttackNearDarkElixirDrill, $GUI_UNCHECKED)
	EndIf

	If $iChkDEUseSpell = 1 Then
		GUICtrlSetState($chkABDEUseSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABDEUseSpell, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbABDEUseSpellType, $iChkDEUseSpellType)

	If $KingAttack[$DB] = 1 Then
		GUICtrlSetState($chkDBKingAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBKingAttack, $GUI_UNCHECKED)
	EndIf
	If $KingAttack[$LB] = 1 Then
		GUICtrlSetState($chkABKingAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABKingAttack, $GUI_UNCHECKED)
	EndIf

	If $QueenAttack[$DB] = 1 Then
		GUICtrlSetState($chkDBQueenAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBQueenAttack, $GUI_UNCHECKED)
	EndIf
	If $QueenAttack[$LB] = 1 Then
		GUICtrlSetState($chkABQueenAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABQueenAttack, $GUI_UNCHECKED)
	EndIf

	If $iDropCC[$DB] = 1 Then
		GUICtrlSetState($chkDBDropCC, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBDropCC, $GUI_UNCHECKED)
	EndIf

	If $iDropCC[$LB] = 1 Then
		GUICtrlSetState($chkABDropCC, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABDropCC, $GUI_UNCHECKED)
	EndIf

	If $iChkUseCCBalanced = 1 Then
		GUICtrlSetState($chkUseCCBalanced, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUseCCBalanced, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbCCDonated, $iCmbCCDonated - 1)
	_GUICtrlComboBox_SetCurSel($cmbCCReceived, $iCmbCCReceived - 1)

	;chkDropInBattle()
	chkBalanceDR()
	Switch $iActivateKQCondition
		Case "Manual"
			GUICtrlSetState($radManAbilities, $GUI_CHECKED)
		Case "Auto"
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)
	EndSwitch

	GUICtrlSetData($txtManAbilities, ($delayActivateKQ / 1000))

	If $TakeLootSnapShot = 1 Then
		GUICtrlSetState($chkTakeLootSS, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTakeLootSS, $GUI_UNCHECKED)
	EndIf

	If $ScreenshotLootInfo = 1 Then
		GUICtrlSetState($chkScreenshotLootInfo, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkScreenshotLootInfo, $GUI_UNCHECKED)
	EndIf

	;Attack Adv. Settings--------------------------------------------------------------------------
	If $ichkAttackNow = 1 Then
		GUICtrlSetState($chkAttackNow, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackNow, $GUI_UNCHECKED)
	EndIf
	chkAttackNow()

	_GUICtrlComboBox_SetCurSel($cmbAttackNowDelay, $iAttackNowDelay - 1)

	If $chkATH = 1 Then
		GUICtrlSetState($chkAttackTH, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
	EndIf

	;Train Spells
	If $ichkTrainLSpell = 1 Then
	    GUICtrlSetState($chkTrainLSpell, $GUI_CHECKED)
	Else
	    GUICtrlSetState($chkTrainLSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkTrainHSpell = 1 Then
	    GUICtrlSetState($chkTrainHSpell, $GUI_CHECKED)
	Else
	    GUICtrlSetState($chkTrainHSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkTrainRSpell = 1 Then
	    GUICtrlSetState($chkTrainRSpell, $GUI_CHECKED)
	Else
	    GUICtrlSetState($chkTrainRSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkTrainJSpell = 1 Then
	    GUICtrlSetState($chkTrainJSpell, $GUI_CHECKED)
	Else
	    GUICtrlSetState($chkTrainJSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkTrainFSpell = 1 Then
	    GUICtrlSetState($chkTrainFSpell, $GUI_CHECKED)
	Else
	    GUICtrlSetState($chkTrainFSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkTrainPSpell = 1 Then
	    GUICtrlSetState($chkTrainPSpell, $GUI_CHECKED)
	Else
	    GUICtrlSetState($chkTrainPSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkTrainESpell = 1 Then
	    GUICtrlSetState($chkTrainESpell, $GUI_CHECKED)
	Else
	    GUICtrlSetState($chkTrainESpell, $GUI_UNCHECKED)
	EndIf
	If $ichkTrainHaSpell = 1 Then
	    GUICtrlSetState($chkTrainHaSpell, $GUI_CHECKED)
	Else
	    GUICtrlSetState($chkTrainHaSpell, $GUI_UNCHECKED)
	EndIf


	;_GUICtrlComboBox_SetCurSel($cmbTrainNormalSpellType, $NormalSpellTrain)
	;cmbTrainNormalSpellType()
	;_GUICtrlComboBox_SetCurSel($cmbTrainDarkSpellType, $DarkSpellTrain)
	;cmbTrainDarkSpellType()

	If $OptBullyMode = 1 Then
		GUICtrlSetState($chkBullyMode, $GUI_CHECKED)
	ElseIf $OptBullyMode = 0 Then
		GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtATBullyMode, $ATBullyMode)
	_GUICtrlComboBox_SetCurSel($cmbYourTH, $YourTH)
	If $iTHBullyAttackMode = 0 Then
		GUICtrlSetState($radUseDBAttack, $GUI_CHECKED)
	ElseIf $iTHBullyAttackMode = 1 Then
		GUICtrlSetState($radUseLBAttack, $GUI_CHECKED)
	EndIf
	chkBullyMode()

	If $OptTrophyMode = 1 Then
		GUICtrlSetState($chkTrophyMode, $GUI_CHECKED)
	ElseIf $OptTrophyMode = 0 Then
		GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
	EndIf

	If $OptIgnoreTraps = 1 Then
		GUICtrlSetState($chkIgnoreTraps, $GUI_CHECKED)
	ElseIf $OptIgnoreTraps = 0 Then
		GUICtrlSetState($chkIgnoreTraps, $GUI_UNCHECKED)
	EndIf

	If $OptIgnoreAirTraps = 1 Then
		GUICtrlSetState($chkIgnoreAirTraps, $GUI_CHECKED)
	ElseIf $OptIgnoreAirTraps = 0 Then
		GUICtrlSetState($chkIgnoreAirTraps, $GUI_UNCHECKED)
	EndIf

	If $OptParanoid = 1 Then
		GUICtrlSetState($chkParanoid, $GUI_CHECKED)
	ElseIf $OptParanoid = 0 Then
		GUICtrlSetState($chkParanoid, $GUI_UNCHECKED)
	EndIf

	If $OptGreedy = 1 Then
		GUICtrlSetState($chkGreedy, $GUI_CHECKED)
	ElseIf $OptGreedy = 0 Then
		GUICtrlSetState($chkGreedy, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtTHaddTiles, $THaddTiles)
	_GUICtrlComboBox_SetCurSel($cmbAttackTHType, $AttackTHType)
	chkSnipeMode()

	;_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, $BottomTHType)

	If $iAlertPBVillage = 1 Then
		GUICtrlSetState($chkAlertPBVillage, $GUI_CHECKED)
	ElseIf $iAlertPBVillage = 0 Then
		GUICtrlSetState($chkAlertPBVillage, $GUI_UNCHECKED)
	EndIf

	If $iLastAttack = 1 Then
		GUICtrlSetState($chkAlertPBLastAttack, $GUI_CHECKED)
	ElseIf $iLastAttack = 0 Then
		GUICtrlSetState($chkAlertPBLastAttack, $GUI_UNCHECKED)
	EndIf

	If $iAlertPBLastRaidTxt = 1 Then
		GUICtrlSetState($chkAlertPBLastRaidTxt, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAlertPBLastRaidTxt, $GUI_UNCHECKED)
	EndIf

	If $ichkAlertPBCampFull = 1 Then
		GUICtrlSetState($chkAlertPBCampFull, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAlertPBCampFull, $GUI_UNCHECKED)
	EndIf

	;	If $iUnbreakableMode = 1 Then
	;		GUICtrlSetState($chkUnbreakable, $GUI_CHECKED)
	;	Else
	;		GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
	;	EndIf
	GUICtrlSetData($txtUnbreakable, $iUnbreakableWait)
	GUICtrlSetData($txtUnBrkMinGold, $iUnBrkMinGold)
	GUICtrlSetData($txtUnBrkMinElixir, $iUnBrkMinElixir)
	GUICtrlSetData($txtUnBrkMinDark, $iUnBrkMinDark)
	GUICtrlSetData($txtUnBrkMaxGold, $iUnBrkMaxGold)
	GUICtrlSetData($txtUnBrkMaxElixir, $iUnBrkMaxElixir)
	GUICtrlSetData($txtUnBrkMaxDark, $iUnBrkMaxDark)
	chkUnbreakable()

	;attk their king
	;attk their queen


	;End Battle Settings------------------------------------------------------------------------
	GUICtrlSetData($txtTimeStopAtk, $sTimeStopAtk)
	If $iChkTimeStopAtk = 1 Then
		GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTimeStopAtk, $GUI_UNCHECKED)
	EndIf
	chkTimeStopAtk()

	GUICtrlSetData($txtTimeStopAtk2, $sTimeStopAtk2)
	If $iChkTimeStopAtk2 = 1 Then
		GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTimeStopAtk2, $GUI_UNCHECKED)
	EndIf
	chkTimeStopAtk2()
	GUICtrlSetData($txtMinGoldStopAtk2, $stxtMinGoldStopAtk2)
	GUICtrlSetData($txtMinElixirStopAtk2, $stxtMinElixirStopAtk2)
	GUICtrlSetData($txtMinDarkElixirStopAtk2, $stxtMinDarkElixirStopAtk2)

	If $ichkEndOneStar = 1 Then
		GUICtrlSetState($chkEndOneStar, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkEndOneStar, $GUI_UNCHECKED)
	EndIf

	If $ichkEndTwoStars = 1 Then
		GUICtrlSetState($chkEndTwoStars, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkEndTwoStars, $GUI_UNCHECKED)
	EndIf



	If $ichkEndNoResources = 1 Then
		GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkEndNoResources, $GUI_UNCHECKED)
	EndIf



	If $DESideEB = 1 Then
		GUICtrlSetState($chkDESideEB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDESideEB, $GUI_UNCHECKED)
	EndIf
	chkDESideEB()
	GUICtrlSetData($txtDELowEndMin, $DELowEndMin)

	If $DisableOtherEBO = 1 Then
		GUICtrlSetState($chkDisableOtherEBO, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDisableOtherEBO, $GUI_UNCHECKED)
	EndIf

	If $DEEndOneStar = 1 Then
		GUICtrlSetState($chkDEEndOneStar, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDEEndOneStar, $GUI_UNCHECKED)
	EndIf

	If $DEEndBk = 1 Then
		GUICtrlSetState($chkDEEndBk, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDEEndBk, $GUI_UNCHECKED)
	EndIf

	If $DEEndAq = 1 Then
		GUICtrlSetState($chkDEEndAq, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDEEndAq, $GUI_UNCHECKED)
	EndIf

	;Donate Settings-------------------------------------------------------------------------
	If $ichkRequest = 1 Then
		GUICtrlSetState($chkRequest, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkRequest, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtRequest, $sTxtRequest)
	chkRequest()

	If $ichkDonate = 1 Then
		GUICtrlSetState($chkDonate, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonate, $GUI_UNCHECKED)
	EndIf
	chkDonate()

	If $ichkDonateBarbarians = 1 Then
		GUICtrlSetState($chkDonateBarbarians, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateBarbarians, $GUI_UNCHECKED)
	EndIf
	chkDonateBarbarians()
	GUICtrlSetData($txtDonateBarbarians, $sTxtDonateBarbarians)
	GUICtrlSetData($txtBlacklistBarbarians, $sTxtBlacklistBarbarians)

	If $ichkDonateArchers = 1 Then
		GUICtrlSetState($chkDonateArchers, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateArchers, $GUI_UNCHECKED)
	EndIf
	chkDonateArchers()
	GUICtrlSetData($txtDonateArchers, $sTxtDonateArchers)
	GUICtrlSetData($txtBlacklistArchers, $sTxtBlacklistArchers)

	If $ichkDonateGiants = 1 Then
		GUICtrlSetState($chkDonateGiants, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateGiants, $GUI_UNCHECKED)
	EndIf
	chkDonateGiants()
	GUICtrlSetData($txtDonateGiants, $sTxtDonateGiants)
	GUICtrlSetData($txtBlacklistGiants, $sTxtBlacklistGiants)

	If $ichkDonateGoblins = 1 Then
		GUICtrlSetState($chkDonateGoblins, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateGoblins, $GUI_UNCHECKED)
	EndIf
	chkDonateGoblins()
	GUICtrlSetData($txtDonateGoblins, $sTxtDonateGoblins)
	GUICtrlSetData($txtBlacklistGoblins, $sTxtBlacklistGoblins)

	If $ichkDonateWallBreakers = 1 Then
		GUICtrlSetState($chkDonateWallBreakers, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateWallBreakers, $GUI_UNCHECKED)
	EndIf
	chkDonateWallBreakers()
	GUICtrlSetData($txtDonateWallBreakers, $sTxtDonateWallBreakers)
	GUICtrlSetData($txtBlacklistWallBreakers, $sTxtBlacklistWallBreakers)

	If $ichkDonateBalloons = 1 Then
		GUICtrlSetState($chkDonateBalloons, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateBalloons, $GUI_UNCHECKED)
	EndIf
	chkDonateBalloons()
	GUICtrlSetData($txtDonateBalloons, $sTxtDonateBalloons)
	GUICtrlSetData($txtBlacklistBalloons, $sTxtBlacklistBalloons)

	If $ichkDonateWizards = 1 Then
		GUICtrlSetState($chkDonateWizards, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateWizards, $GUI_UNCHECKED)
	EndIf
	chkDonateWizards()
	GUICtrlSetData($txtDonateWizards, $sTxtDonateWizards)
	GUICtrlSetData($txtBlacklistWizards, $sTxtBlacklistWizards)

	If $ichkDonateHealers = 1 Then
		GUICtrlSetState($chkDonateHealers, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateHealers, $GUI_UNCHECKED)
	EndIf
	chkDonateHealers()
	GUICtrlSetData($txtDonateHealers, $sTxtDonateHealers)
	GUICtrlSetData($txtBlacklistHealers, $sTxtBlacklistHealers)

	If $ichkDonateDragons = 1 Then
		GUICtrlSetState($chkDonateDragons, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateDragons, $GUI_UNCHECKED)
	EndIf
	chkDonateDragons()
	GUICtrlSetData($txtDonateDragons, $sTxtDonateDragons)
	GUICtrlSetData($txtBlacklistDragons, $sTxtBlacklistDragons)

	If $ichkDonatePekkas = 1 Then
		GUICtrlSetState($chkDonatePekkas, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonatePekkas, $GUI_UNCHECKED)
	EndIf
	chkDonatePekkas()
	GUICtrlSetData($txtDonatePekkas, $sTxtDonatePekkas)
	GUICtrlSetData($txtBlacklistPekkas, $sTxtBlacklistPekkas)

	If $ichkDonateMinions = 1 Then
		GUICtrlSetState($chkDonateMinions, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateMinions, $GUI_UNCHECKED)
	EndIf
	chkDonateMinions()
	GUICtrlSetData($txtDonateMinions, $sTxtDonateMinions)
	GUICtrlSetData($txtBlacklistMinions, $sTxtBlacklistMinions)

	If $ichkDonateHogRiders = 1 Then
		GUICtrlSetState($chkDonateHogRiders, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateHogRiders, $GUI_UNCHECKED)
	EndIf
	chkDonateHogRiders()
	GUICtrlSetData($txtDonateHogRiders, $sTxtDonateHogRiders)
	GUICtrlSetData($txtBlacklistHogRiders, $sTxtBlacklistHogRiders)

	If $ichkDonateValkyries = 1 Then
		GUICtrlSetState($chkDonateValkyries, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateValkyries, $GUI_UNCHECKED)
	EndIf
	chkDonateValkyries()
	GUICtrlSetData($txtDonateValkyries, $sTxtDonateValkyries)
	GUICtrlSetData($txtBlacklistValkyries, $sTxtBlacklistValkyries)

	If $ichkDonateGolems = 1 Then
		GUICtrlSetState($chkDonateGolems, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateGolems, $GUI_UNCHECKED)
	EndIf
	chkDonateGolems()
	GUICtrlSetData($txtDonateGolems, $sTxtDonateGolems)
	GUICtrlSetData($txtBlacklistGolems, $sTxtBlacklistGolems)

	If $ichkDonateWitches = 1 Then
		GUICtrlSetState($chkDonateWitches, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateWitches, $GUI_UNCHECKED)
	EndIf
	chkDonateWitches()
	GUICtrlSetData($txtDonateWitches, $sTxtDonateWitches)
	GUICtrlSetData($txtBlacklistWitches, $sTxtBlacklistWitches)

	If $ichkDonateLavaHounds = 1 Then
		GUICtrlSetState($chkDonateLavaHounds, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateLavaHounds, $GUI_UNCHECKED)
	EndIf
	chkDonateLavaHounds()
	GUICtrlSetData($txtDonateLavaHounds, $sTxtDonateLavaHounds)
	GUICtrlSetData($txtBlacklistLavaHounds, $sTxtBlacklistLavaHounds)

	;;; Custom Combination Donate by ChiefM3
	If $ichkDonateCustom = 1 Then
		GUICtrlSetState($chkDonateCustom, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateCustom, $GUI_UNCHECKED)
	EndIf
	chkDonateCustom()
	GUICtrlSetData($txtDonateCustom, $sTxtDonateCustom)
	GUICtrlSetData($txtBlacklistCustom, $sTxtBlacklistCustom)

	_GUICtrlComboBox_SetCurSel($cmbDonateCustom1, $varDonateCustom[0][0])
	GUICtrlSetData($txtDonateCustom1, $varDonateCustom[0][1])
	_GUICtrlComboBox_SetCurSel($cmbDonateCustom2, $varDonateCustom[1][0])
	GUICtrlSetData($txtDonateCustom2, $varDonateCustom[1][1])
	_GUICtrlComboBox_SetCurSel($cmbDonateCustom3, $varDonateCustom[2][0])
	GUICtrlSetData($txtDonateCustom3, $varDonateCustom[2][1])
	cmbDonateCustom()

	GUICtrlSetData($txtBlacklist, $sTxtBlacklist)

	If $ichkDonateAllBarbarians = 1 Then
		GUICtrlSetState($chkDonateAllBarbarians, $GUI_CHECKED)
		_DonateAllControls($eBarb, True)
	Else
		GUICtrlSetState($chkDonateAllBarbarians, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllArchers = 1 Then
		GUICtrlSetState($chkDonateAllArchers, $GUI_CHECKED)
		_DonateAllControls($eArch, True)
	Else
		GUICtrlSetState($chkDonateAllArchers, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllGiants = 1 Then
		GUICtrlSetState($chkDonateAllGiants, $GUI_CHECKED)
		_DonateAllControls($eGiant, True)
	Else
		GUICtrlSetState($chkDonateAllGiants, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllGoblins = 1 Then
		GUICtrlSetState($chkDonateAllGoblins, $GUI_CHECKED)
		_DonateAllControls($eGobl, True)
	Else
		GUICtrlSetState($chkDonateAllGoblins, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllWallBreakers = 1 Then
		GUICtrlSetState($chkDonateAllWallBreakers, $GUI_CHECKED)
		_DonateAllControls($eWall, True)
	Else
		GUICtrlSetState($chkDonateAllWallBreakers, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllBalloons = 1 Then
		GUICtrlSetState($chkDonateAllBalloons, $GUI_CHECKED)
		_DonateAllControls($eBall, True)
	Else
		GUICtrlSetState($chkDonateAllBalloons, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllWizards = 1 Then
		GUICtrlSetState($chkDonateAllWizards, $GUI_CHECKED)
		_DonateAllControls($eWiza, True)
	Else
		GUICtrlSetState($chkDonateAllWizards, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllHealers = 1 Then
		GUICtrlSetState($chkDonateAllHealers, $GUI_CHECKED)
		_DonateAllControls($eHeal, True)
	Else
		GUICtrlSetState($chkDonateAllHealers, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllDragons = 1 Then
		GUICtrlSetState($chkDonateAllDragons, $GUI_CHECKED)
		_DonateAllControls($eDrag, True)
	Else
		GUICtrlSetState($chkDonateAllDragons, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllPekkas = 1 Then
		GUICtrlSetState($chkDonateAllPekkas, $GUI_CHECKED)
		_DonateAllControls($ePekk, True)
	Else
		GUICtrlSetState($chkDonateAllPekkas, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllMinions = 1 Then
		GUICtrlSetState($chkDonateAllMinions, $GUI_CHECKED)
		_DonateAllControls($eMini, True)
	Else
		GUICtrlSetState($chkDonateAllMinions, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllHogRiders = 1 Then
		GUICtrlSetState($chkDonateAllHogRiders, $GUI_CHECKED)
		_DonateAllControls($eHogs, True)
	Else
		GUICtrlSetState($chkDonateAllHogRiders, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllValkyries = 1 Then
		GUICtrlSetState($chkDonateAllValkyries, $GUI_CHECKED)
		_DonateAllControls($eValk, True)
	Else
		GUICtrlSetState($chkDonateAllValkyries, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllGolems = 1 Then
		GUICtrlSetState($chkDonateAllGolems, $GUI_CHECKED)
		_DonateAllControls($eGole, True)
	Else
		GUICtrlSetState($chkDonateAllGolems, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllWitches = 1 Then
		GUICtrlSetState($chkDonateAllWitches, $GUI_CHECKED)
		_DonateAllControls($eWitc, True)
	Else
		GUICtrlSetState($chkDonateAllWitches, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllLavaHounds = 1 Then
		GUICtrlSetState($chkDonateAllLavaHounds, $GUI_CHECKED)
		_DonateAllControls($eLava, True)
	Else
		GUICtrlSetState($chkDonateAllLavaHounds, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllCustom = 1 Then
		GUICtrlSetState($chkDonateAllCustom, $GUI_CHECKED)
		_DonateAllControls(16, True)
	Else
		GUICtrlSetState($chkDonateAllCustom, $GUI_UNCHECKED)
	EndIf

	If IniRead($config, "donate", "donateAllSub", "0") = 1 Then
       GUICtrlSetState($donateAllSub, $GUI_CHECKED)
    Else
       GUICtrlSetState($donateAllSub, $GUI_UNCHECKED)
    EndIf
       _GUICtrlComboBox_SetCurSel($cmbDonateAllSub,$SubAllDonate)
	;Troop Settings--------------------------------------------------------------------------
	_GUICtrlComboBox_SetCurSel($cmbTroopComp, $iCmbTroopComp)

	If $ichkUsePercent = 1 Then
		GUICtrlSetState($chkUsePercent, $GUI_CHECKED)
	ElseIf $ichkUsePercent = 0 Then
		GUICtrlSetState($chkUsePercent, $GUI_UNCHECKED)
	EndIf

	For $i = 0 To UBound($TroopName) - 1
		GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), Eval($TroopName[$i] & "Comp"))
	Next
	For $i = 0 To UBound($TroopDarkName) - 1
		GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), Eval($TroopDarkName[$i] & "Comp"))
	Next
	SetComboTroopComp()
	lblTotalCount()

	_GUICtrlComboBox_SetCurSel($cmbBarrack1, $barrackTroop[0])
	_GUICtrlComboBox_SetCurSel($cmbBarrack2, $barrackTroop[1])
	_GUICtrlComboBox_SetCurSel($cmbBarrack3, $barrackTroop[2])
	_GUICtrlComboBox_SetCurSel($cmbBarrack4, $barrackTroop[3])

	_GUICtrlComboBox_SetCurSel($cmbDarkBarrack1, $darkbarrackTroop[0])
	_GUICtrlComboBox_SetCurSel($cmbDarkBarrack2, $darkbarrackTroop[1])

	GUICtrlSetData($txtFullTroop, $fulltroop)
	GUICtrlSetData($sldTrainITDelay, $isldTrainITDelay)
	GUICtrlSetData($lbltxtTrainITDelay, "delay " & $isldTrainITDelay & " ms.")
	;barracks boost not saved (no use)
	If $iSpeed = 0 Then
		GUICtrlSetState($radAccuracy, $GUI_CHECKED)
	ElseIf $iSpeed = 1 Then
		GUICtrlSetState($radSpeed, $GUI_CHECKED)
	EndIf

	;PushBullet-----------------------------------------------------------------------------

	GUICtrlSetData($PushBTokenValue, $PushToken)
	GUICtrlSetData($OrigPushB, $iOrigPushB)

;~ 	If $iOrigPushB = "" Then
;~ 		GUICtrlSetData($OrigPushB, $txtVillageName)
;~ 	Else
;~ 		GUICtrlSetData($OrigPushB, $iOrigPushB)
;~ 	EndIf

	If $iAlertPBVillage = 1 Then
		GUICtrlSetState($chkAlertPBVillage, $GUI_CHECKED)
	ElseIf $iAlertPBVillage = 0 Then
		GUICtrlSetState($chkAlertPBVillage, $GUI_UNCHECKED)
	EndIf

	If $iLastAttack = 1 Then
		GUICtrlSetState($chkAlertPBLastAttack, $GUI_CHECKED)
	ElseIf $iLastAttack = 0 Then
		GUICtrlSetState($chkAlertPBLastAttack, $GUI_UNCHECKED)
	EndIf

	If $pEnabled = 1 Then
		GUICtrlSetState($chkPBenabled, $GUI_CHECKED)
		chkPBenabled()
	ElseIf $pEnabled = 0 Then
		GUICtrlSetState($chkPBenabled, $GUI_UNCHECKED)
		chkPBenabled()
	EndIf

	If $pRemote = 1 Then
		GUICtrlSetState($chkPBRemote, $GUI_CHECKED)
	ElseIf $pRemote = 0 Then
		GUICtrlSetState($chkPBRemote, $GUI_UNCHECKED)
	EndIf

	If $iDeleteAllPushes = 1 Then
		GUICtrlSetState($chkDeleteAllPushes, $GUI_CHECKED)
	ElseIf $iDeleteAllPushes = 0 Then
		GUICtrlSetState($chkDeleteAllPushes, $GUI_UNCHECKED)
	EndIf

	If $ichkDeleteOldPushes = 1 Then
		GUICtrlSetState($chkDeleteOldPushes, $GUI_CHECKED)
	ElseIf $ichkDeleteOldPushes = 0 Then
		GUICtrlSetState($chkDeleteOldPushes, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbHoursPushBullet, $icmbHoursPushBullet - 1)

	If $pMatchFound = 1 Then
		GUICtrlSetState($chkAlertPBVMFound, $GUI_CHECKED)
	ElseIf $pMatchFound = 0 Then
		GUICtrlSetState($chkAlertPBVMFound, $GUI_UNCHECKED)
	EndIf

	If $pLastRaidImg = 1 Then
		GUICtrlSetState($chkAlertPBLastRaid, $GUI_CHECKED)
	ElseIf $pLastRaidImg = 0 Then
		GUICtrlSetState($chkAlertPBLastRaid, $GUI_UNCHECKED)
	EndIf

	If $pWallUpgrade = 1 Then
		GUICtrlSetState($chkAlertPBWallUpgrade, $GUI_CHECKED)
	ElseIf $pWallUpgrade = 0 Then
		GUICtrlSetState($chkAlertPBWallUpgrade, $GUI_UNCHECKED)
	EndIf

	If $pOOS = 1 Then
		GUICtrlSetState($chkAlertPBOOS, $GUI_CHECKED)
	ElseIf $pOOS = 0 Then
		GUICtrlSetState($chkAlertPBOOS, $GUI_UNCHECKED)
	EndIf

	If $pTakeAbreak = 1 Then
		GUICtrlSetState($chkAlertPBVBreak, $GUI_CHECKED)
	ElseIf $pTakeAbreak = 0 Then
		GUICtrlSetState($chkAlertPBVBreak, $GUI_UNCHECKED)
	EndIf

	If $pAnotherDevice = 1 Then
		GUICtrlSetState($chkAlertPBOtherDevice, $GUI_CHECKED)
	ElseIf $pAnotherDevice = 0 Then
		GUICtrlSetState($chkAlertPBOtherDevice, $GUI_UNCHECKED)
	EndIf

	If $ichkDeleteOldPushes = 1 Then
		GUICtrlSetState($chkDeleteOldPushes, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeleteOldPushes, $GUI_UNCHECKED)
	EndIf
	chkDeleteOldPushes()


	;Other Settings--------------------------------------------------------------------------

	;Lab
	If $ichkLab = 1 Then
		GUICtrlSetState($chkLab, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkLab, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbLaboratory, $iCmbLaboratory)
	GUICtrlSetImage($icnLabUpgrade, $pIconLib, $aLabTroops[$iCmbLaboratory][4])
	chkLab()

	_GUICtrlComboBox_SetCurSel($cmbWalls, $icmbWalls)
	Switch $iUseStorage
		Case 0
			GUICtrlSetState($UseGold, $GUI_CHECKED)
		Case 1
			GUICtrlSetState($UseElixir, $GUI_CHECKED)
		Case 2
			GUICtrlSetState($UseElixirGold, $GUI_CHECKED)
	EndSwitch

	GUICtrlSetData($txtWallMinGold, $itxtWallMinGold)
	GUICtrlSetData($txtWallMinElixir, $itxtWallMinElixir)
	cmbwalls()

	GUICtrlSetData($txtRestartGold, $itxtRestartGold)
	GUICtrlSetData($txtRestartElixir , $itxtRestartElixir)
	GUICtrlSetData($txtRestartDark, $itxtRestartDark)

	If $ichkWalls = 1 Then
		GUICtrlSetState($chkWalls, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkWalls, $GUI_UNCHECKED)
	EndIf
	chkWalls()

	If $iSaveWallBldr = 1 Then
		GUICtrlSetState($chkSaveWallBldr, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSaveWallBldr, $GUI_UNCHECKED)
	EndIf

	For $iz = 0 To 11 ; Apply the buildings upgrade varaible to GUI
		GUICtrlSetImage($picUpgradeStatus[$iz], $pIconLib, $ipicUpgradeStatus[$iz]) ; Set GUI status pic
		If $aUpgrades[$iz][2] > 0 Then
			GUICtrlSetData($txtUpgradeValue[$iz], _NumberFormat($aUpgrades[$iz][2])) ; Set GUI loot value to match $aUpgrades variable
			GUICtrlSetData($txtUpgradeX[$iz], $aUpgrades[$iz][0]) ; Set GUI X Position to match $aUpgrades variable
			GUICtrlSetData($txtUpgradeY[$iz], $aUpgrades[$iz][1]) ; Set GUI Y Position to match $aUpgrades variable
		Else
			GUICtrlSetData($txtUpgradeValue[$iz], "") ; Set GUI loot value to blank
			GUICtrlSetData($txtUpgradeX[$iz], "") ; Set GUI X Position to match $aUpgrades variable
			GUICtrlSetData($txtUpgradeY[$iz], "") ; Set GUI Y Position to match $aUpgrades variable
		EndIf
		Switch $aUpgrades[$iz][3] ;Set GUI Upgrade Type to match $aUpgrades variable
			Case "Gold"
				GUICtrlSetImage($picUpgradeType[$iz], $pIconLib, $eIcnGold)
			Case "Elixir"
				GUICtrlSetImage($picUpgradeType[$iz], $pIconLib, $eIcnElixir)
			Case "Dark"
				GUICtrlSetImage($picUpgradeType[$iz], $pIconLib, $eIcnDark)
			Case Else
				GUICtrlSetImage($picUpgradeType[$iz], $pIconLib, $eIcnBlank)
		EndSwitch
		If $ichkbxUpgrade[$iz] = 1 Then
			GUICtrlSetState($chkbxUpgrade[$iz], $GUI_CHECKED)
		Else
			GUICtrlSetState($chkbxUpgrade[$iz], $GUI_UNCHECKED)
		EndIf
	Next
	GUICtrlSetData($txtUpgrMinGold, $itxtUpgrMinGold)
	GUICtrlSetData($txtUpgrMinElixir, $itxtUpgrMinElixir)
	GUICtrlSetData($txtUpgrMinDark, $itxtUpgrMinDark)


	If $ichkTrap = 1 Then
		GUICtrlSetState($chkTrap, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrap, $GUI_UNCHECKED)
	EndIf
	chkTrap()

	If $iChkCollect = 1 Then
		GUICtrlSetState($chkCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkCollect, $GUI_UNCHECKED)
	EndIf

	If $ichkTombstones = 1 Then
		GUICtrlSetState($chkTombstones, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTombstones, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtTimeWakeUp, $sTimeWakeUp)

	GUICtrlSetData($sldVSDelay, $iVSDelay)
	GUICtrlSetData($lblVSDelay, $iVSDelay)

	GUICtrlSetData($txtMaxTrophy, $itxtMaxTrophy)
	GUICtrlSetData($txtdropTrophy, $itxtdropTrophy)

	If $iChkTrophyHeroes = 1 Then
		GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrophyHeroes, $GUI_UNCHECKED)
	EndIf

	If $iChkTrophyAtkDead = 1 Then
		GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrophyAtkDead, $GUI_UNCHECKED)
	EndIf

	;location of TH, CC, Army Camp, Barrack and Spell Fact. not Applied, only read


	GUICtrlSetData($txtWAOffsetX, $iWAOffsetX)
	GUICtrlSetData($txtWAOffsetY, $iWAOffsetY)


	; delete Files
	If $ichkDeleteLogs = 1 Then
		GUICtrlSetState($chkDeleteLogs, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeleteLogs, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtDeleteLogsDays, $iDeleteLogsDays)
	chkDeleteLogs()

	If $ichkDeleteTemp = 1 Then
		GUICtrlSetState($chkDeleteTemp, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeleteTemp, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtDeleteTempDays, $iDeleteTempDays)
	chkDeleteTemp()

	If $ichkDeleteLoots = 1 Then
		GUICtrlSetState($chkDeleteLoots, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeleteLoots, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtDeleteLootsDays, $iDeleteLootsDays)
	chkDeleteLoots()

	;planned
	If $iPlannedRequestCCHoursEnable = 1 Then
		GUICtrlSetState($chkRequestCCHours, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkRequestCCHours, $GUI_UNCHECKED)
	EndIf
	chkRequestCCHours()
	If $iPlannedDonateHoursEnable = 1 Then
		GUICtrlSetState($chkDonateHours, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateHours, $GUI_UNCHECKED)
	EndIf
	chkDonateHours()
	If $iPlannedDropCCHoursEnable = 1 Then
		GUICtrlSetState($chkDropCCHours, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDropCCHours, $GUI_UNCHECKED)
	EndIf
	chkDropCCHours()

	For $i = 0 To 23
		If $iPlannedDonateHours[$i] = 1 Then
			GUICtrlSetState(Eval("chkDonateHours" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkDonateHours" & $i), $GUI_UNCHECKED)
		EndIf
	Next

	For $i = 0 To 23
		If $iPlannedRequestCCHours[$i] = 1 Then
			GUICtrlSetState(Eval("chkRequestCCHours" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkRequestCCHours" & $i), $GUI_UNCHECKED)
		EndIf
	Next

	For $i = 0 To 23
		If $iPlannedDropCCHours[$i] = 1 Then
			GUICtrlSetState(Eval("chkDropCCHours" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkDropCCHours" & $i), $GUI_UNCHECKED)
		EndIf
	Next

	;Share Attack Settings----------------------------------------

	GUICtrlSetData($txtShareMinGold, $iShareminGold)
	GUICtrlSetData($txtShareMinElixir, $iShareminElixir)
	GUICtrlSetData($txtShareMinDark, $iShareminDark)
	GUICtrlSetData($txtShareMessage, $sShareMessage)
	If $iShareAttack = 1 Then
		GUICtrlSetState($chkShareAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkShareAttack, $GUI_UNCHECKED)
	EndIf
	chkShareAttack()

	;screenshot
	If $iScreenshotType = 1 Then
		GUICtrlSetState($chkScreenshotType, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkScreenshotType, $GUI_UNCHECKED)
	EndIf

	If $ichkScreenshotHideName = 1 Then
		GUICtrlSetState($chkScreenshotHideName, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkScreenshotHideName, $GUI_UNCHECKED)
	EndIf


	;debug
	If $debugClick = 1 Then
		GUICtrlSetState($chkDebugClick, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugClick, $GUI_UNCHECKED)
	EndIf

	If $DevMode = 1 Then
		GUICtrlSetState($chkDebugSetlog, $GUI_ENABLE)
		GUICtrlSetState($chkDebugOcr, $GUI_ENABLE)
	EndIf

	If $DebugSetlog = 1 Then
		GUICtrlSetState($chkDebugSetlog, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugSetlog, $GUI_UNCHECKED)
	EndIf

	If $debugOcr = 1 Then
		GUICtrlSetState($chkDebugOcr, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugOcr, $GUI_UNCHECKED)
	EndIf


	;forced Total Camp values
	If $ichkTotalCampForced = 1 Then
		GUICtrlSetState($chkTotalCampForced, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTotalCampForced, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtTotalCampForced, $iValueTotalCampForced)
	chkTotalCampForced()



	If $ichkLanguage = 1 Then
		GUICtrlSetState($chkLanguage, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkLanguage, $GUI_UNCHECKED)
	EndIf

	If $ichkVersion = 1 Then
		GUICtrlSetState($chkVersion, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkVersion, $GUI_UNCHECKED)
	EndIf

	;Heroes
	If $ichkUpgradeKing = 1 Then ;==>upgradeking
        GUICtrlSetState($chkUpgradeKing, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUpgradeKing, $GUI_UNCHECKED)
	EndIf

	If $ichkUpgradeQueen = 1 Then ;==>upgradequeen
        GUICtrlSetState($chkUpgradeQueen, $GUI_CHECKED)
	Else
        GUICtrlSetState($chkUpgradeQueen, $GUI_UNCHECKED)
	EndIf
    ;;; Toolbox
    If $ichkToolboxModeBot = 1 Then
        GUICtrlSetState($chkToolboxModeBot, $GUI_CHECKED)
        $ToolboxModeBot = True
    Else
        GUICtrlSetState($chkToolboxModeBot, $GUI_UNCHECKED)
        $ToolboxModeBot = False
    EndIf

    If $ichkToolboxModeSearch = 1 Then
        GUICtrlSetState($chkToolboxModeSearch, $GUI_CHECKED)
        $ToolboxModeSearch = True
    Else
        GUICtrlSetState($chkToolboxModeSearch, $GUI_UNCHECKED)
        $ToolboxModeSearch = False
    EndIf

    If $ichkToolboxDetach = 1 Then
        GUICtrlSetState($chkToolboxDetach, $GUI_CHECKED)
        $ToolboxDetached = True
    Else
        GUICtrlSetState($chkToolboxDetach, $GUI_UNCHECKED)
        $ToolboxDetached = False
    EndIf

    If $ichkToolboxSavePos = 1 Then
        GUICtrlSetState($chkToolboxSavePos, $GUI_CHECKED)
        $ToolboxSavePos = True
        $Toolbox_x = $iToolbox_x
        $Toolbox_y = $iToolbox_y
    Else
        GUICtrlSetState($chkToolboxSavePos, $GUI_UNCHECKED)
        $ToolboxSavePos = False
    EndIf

	If $iChkSnipeWhileTrain = 1 Then ; Snipe While Train MOD by ChiefM3
   GUICtrlSetState($chkSnipeWhileTrain, $GUI_CHECKED)
   Else
   GUICtrlSetState($chkSnipeWhileTrain, $GUI_UNCHECKED)
   EndIf

	;Heroes
	If $ichkUpgradeKing = 1 Then ;==>upgradeking
        GUICtrlSetState($chkUpgradeKing, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUpgradeKing, $GUI_UNCHECKED)
	EndIf

	If $ichkUpgradeQueen = 1 Then ;==>upgradequeen
        GUICtrlSetState($chkUpgradeQueen, $GUI_CHECKED)
	EndIf
	;Profile Switch
	If $ichkGoldSwitchMax = 1 Then
		GUICtrlSetState($chkGoldSwitchMax, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkGoldSwitchMax, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbGoldMaxProfile, $icmbGoldMaxProfile)
	GUICtrlSetData($txtMaxGoldAmount, $itxtMaxGoldAmount)
	If $ichkGoldSwitchMin = 1 Then
		GUICtrlSetState($chkGoldSwitchMin, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkGoldSwitchMin, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbGoldMinProfile, $icmbGoldMinProfile)
	GUICtrlSetData($txtMinGoldAmount, $itxtMinGoldAmount)

	If $ichkElixirSwitchMax = 1 Then
		GUICtrlSetState($chkElixirSwitchMax, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkElixirSwitchMax, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbElixirMaxProfile, $icmbElixirMaxProfile)
	GUICtrlSetData($txtMaxElixirAmount, $itxtMaxElixirAmount)
	If $ichkElixirSwitchMin = 1 Then
		GUICtrlSetState($chkElixirSwitchMin, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkElixirSwitchMin, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbElixirMinProfile, $icmbElixirMinProfile)
	GUICtrlSetData($txtMinElixirAmount, $itxtMinElixirAmount)

	If $ichkDESwitchMax = 1 Then
		GUICtrlSetState($chkDESwitchMax, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDESwitchMax, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbDEMaxProfile, $icmbDEMaxProfile)
	GUICtrlSetData($txtMaxDEAmount, $itxtMaxDEAmount)
	If $ichkDESwitchMin = 1 Then
		GUICtrlSetState($chkDESwitchMin, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDESwitchMin, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbDEMinProfile, $icmbDEMinProfile)
	GUICtrlSetData($txtMinDEAmount, $itxtMinDEAmount)

	If $ichkTrophySwitchMax = 1 Then
		GUICtrlSetState($chkTrophySwitchMax, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrophySwitchMax, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbTrophyMaxProfile, $icmbTrophyMaxProfile)
	GUICtrlSetData($txtMaxTrophyAmount, $itxtMaxTrophyAmount)
	If $ichkTrophySwitchMin = 1 Then
		GUICtrlSetState($chkTrophySwitchMin, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrophySwitchMin, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbTrophyMinProfile, $icmbTrophyMinProfile)
	GUICtrlSetData($txtMinTrophyAmount, $itxtMinTrophyAmount)


EndFunc   ;==>applyConfig

Func chkSpeed()

EndFunc