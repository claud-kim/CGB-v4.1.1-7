; #FUNCTION# ====================================================================================================================
; Name ..........: readConfig.au3
; Description ...: Reads config file and sets variables
; Syntax ........: readConfig()
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


Func readConfig() ;Reads config and sets it to the variables
	If FileExists($building) Then
		$TownHallPos[0] = IniRead($building, "other", "xTownHall", "-1")
		$TownHallPos[1] = IniRead($building, "other", "yTownHall", "-1")
		$iTownHallLevel = IniRead($building, "other", "LevelTownHall", "0")

		$aCCPos[0] = IniRead($building, "other", "xCCPos", "0")
		$aCCPos[1] = IniRead($building, "other", "yCCPos", "0")

		$KingPos[0] = IniRead($building, "other", "xKingPos", "0")
		$KingPos[1] = IniRead($building, "other", "yKingPos", "0")

		$QueenPos[0] = IniRead($building, "other", "xQueenPos", "0")
		$QueenPos[1] = IniRead($building, "other", "yQueenPos", "0")
		$barrackPos[0] = IniRead($building, "other", "xBarrack", "0")
		$barrackPos[1] = IniRead($building, "other", "yBarrack", "0")

		$ichkUpgradeQueen = IniRead($building, "other", "UpQueen", "0")
		$ichkUpgradeKing = IniRead($building, "other", "UpKing", "0")
		$ArmyPos[0] = IniRead($building, "other", "xArmy", "0")
		$ArmyPos[1] = IniRead($building, "other", "yArmy", "0")

		$SFPos[0] = IniRead($building, "other", "xspellfactory", "-1")
		$SFPos[1] = IniRead($building, "other", "yspellfactory", "-1")

		;$barrackNum = IniRead($building, "other", "barrackNum", "0")
		;$barrackDarkNum = IniRead($building, "other", "barrackDarkNum", "0")

		$listResourceLocation = IniRead($building, "other", "listResource", "")

		For $iz = 0 to 11 ; SReads Upgrade building data
			$aUpgrades[$iz][0] = IniRead($building, "upgrade", "xupgrade"&$iz, "-1")
			$aUpgrades[$iz][1] = IniRead($building, "upgrade", "yupgrade"&$iz, "-1")
			$aUpgrades[$iz][2] = IniRead($building, "upgrade", "upgradevalue"&$iz, "-1")
			$aUpgrades[$iz][3] = IniRead($building, "upgrade", "upgradetype"&$iz, "")
			$ichkbxUpgrade[$iz] = IniRead($building, "upgrade", "upgradechk"&$iz, "0")
			$ipicUpgradeStatus[$iz] = IniRead($building, "upgrade", "upgradestatusicon"&$iz, $eIcnRedLight)
		Next
		$itxtUpgrMinGold = Number(IniRead($building, "upgrade", "minupgrgold", "100000"))
		$itxtUpgrMinElixir = Number(IniRead($building, "upgrade", "minupgrelixir", "100000"))
		$itxtUpgrMinDark = Number(IniRead($building, "upgrade", "minupgrdark", "2000"))
	endif
	If FileExists($config) Then

		;General Settings--------------------------------------------------------------------------
		$icmbProfile = IniRead($config, "general", "cmbProfile", "01")
		$frmBotPosX = IniRead($config, "general", "frmBotPosX", "900")
		$frmBotPosY = IniRead($config, "general", "frmBotPosY", "20")
		$iVillageName = IniRead($config, "general", "villageName", "")

		$iCmbLog = IniRead($config, "general", "logstyle", "0")
		$iDividerY = Number(IniRead($config, "general", "LogDividerY", "385"))

		$ichkAutoStart = IniRead($config, "general", "AutoStart", "0")
		$ichkAutoStartDelay = IniRead($config, "general", "AutoStartDelay", "5")
		$restarted = IniRead($config, "general", "Restarted", "0")
		$ichkBackground = IniRead($config, "general", "Background", "0")
		$ichkBotStop = IniRead($config, "general", "BotStop", "0")
		$ichkIceBreaker = IniRead($config, "general", "IceBreaker", "0")
		$ichkKeepAlive = IniRead($config, "general", "KeepAlive", "0")
		$ichkClanAd = IniRead($config, "general", "ClanAd", "0")
		$itxtClanAd = IniRead($config, "general", "ClanAdText", "Welcome")
		$icmbBotCommand = IniRead($config, "general", "Command", "0")
		$icmbBotCond = IniRead($config, "general", "Cond", "0")
		$icmbHoursStop = IniRead($config, "general", "Hour", "0")

		$iDisposeWindows = IniRead($config, "general", "DisposeWindows", "0")
		$icmbDisposeWindowsPos = IniRead($config, "general", "DisposeWindowsPos", "SNAP-TR")
		$iUseOldOCR = IniRead($config, "general", "UseOldOCR", "0")


		;Search Settings------------------------------------------------------------------------
		$iCmbSearchMode = IniRead($config, "search", "SearchMode", "0")
		$AlertSearch = IniRead($config, "search", "AlertSearch", "0")
		$AlertSearchError = IniRead($config, "search", "AlertSearchError", "0")

		$iChkEnableAfter[$DB] = IniRead($config, "search", "DBEnableAfter", "0")
		$iCmbMeetGE[$DB] = IniRead($config, "search", "DBMeetGE", "1")
		$iChkMeetDE[$DB] = IniRead($config, "search", "DBMeetDE", "0")
		$iChkMeetTrophy[$DB] = IniRead($config, "search", "DBMeetTrophy", "0")
		$iChkMeetTH[$DB] = IniRead($config, "search", "DBMeetTH", "0")
		$iChkMeetTHO[$DB] = IniRead($config, "search", "DBMeetTHO", "0")
		$iChkWeakBase[$DB] = IniRead($config, "search", "DBWeakBase", "0")
		$iChkMeetOne[$DB] = IniRead($config, "search", "DBMeetOne", "0")

		$iEnableAfterCount[$DB] = IniRead($config, "search", "DBEnableAfterCount", "150")
		$iMinGold[$DB] = IniRead($config, "search", "DBsearchGold", "80000")
		$iMinElixir[$DB] = IniRead($config, "search", "DBsearchElixir", "80000")
		$iMinGoldPlusElixir[$DB] = IniRead($config, "search", "DBsearchGoldPlusElixir", "160000")
		$iMinDark[$DB] = IniRead($config, "search", "DBsearchDark", "0")
		$iMinTrophy[$DB] = IniRead($config, "search", "DBsearchTrophy", "0")
		$iCmbTH[$DB] = IniRead($config, "search", "DBTHLevel", "0")
		$iCmbWeakMortar[$DB] = IniRead($config, "search", "DBWeakMortar", "5")
		$iCmbWeakWizTower[$DB] = IniRead($config, "search", "DBWeakWizTower", "4")

		$iChkEnableAfter[$LB] = IniRead($config, "search", "ABEnableAfter", "0")
		$iCmbMeetGE[$LB] = IniRead($config, "search", "ABMeetGE", "2")
		$iChkMeetDE[$LB] = IniRead($config, "search", "ABMeetDE", "0")
		$iChkMeetTrophy[$LB] = IniRead($config, "search", "ABMeetTrophy", "0")
		$iChkMeetTH[$LB] = IniRead($config, "search", "ABMeetTH", "0")
		$iChkMeetTHO[$LB] = IniRead($config, "search", "ABMeetTHO", "0")
		$iChkWeakBase[$LB] = IniRead($config, "search", "ABWeakBase", "0")
		$iChkMeetOne[$LB] = IniRead($config, "search", "ABMeetOne", "0")

		$iEnableAfterCount[$LB] = IniRead($config, "search", "ABEnableAfterCount", "150")
		$iMinGold[$LB] = IniRead($config, "search", "ABsearchGold", "80000")
		$iMinElixir[$LB] = IniRead($config, "search", "ABsearchElixir", "80000")
		$iMinGoldPlusElixir[$LB] = IniRead($config, "search", "ABsearchGoldPlusElixir", "160000")
		$iMinDark[$LB] = IniRead($config, "search", "ABsearchDark", "0")
		$iMinTrophy[$LB] = IniRead($config, "search", "ABsearchTrophy", "0")
		$iCmbTH[$LB] = IniRead($config, "search", "ABTHLevel", "0")
		$iCmbWeakMortar[$LB] = IniRead($config, "search", "ABWeakMortar", "5")
		$iCmbWeakWizTower[$LB] = IniRead($config, "search", "ABWeakWizTower", "4")


	;Hero Filter Settings.
		$iSkipCentreDE = IniRead($config, "search", "SkipCentreDE", "0")
		$iSkipUndetectedDE = IniRead($config, "search", "SkipUndetectedDE", "0")
		$iCmbMeetGEHero = IniRead($config, "search", "ABMeetGEHero", "2")
		$iChkMeetDEHero = IniRead($config, "search", "ABMeetDEHero", "0")
		$iChkMeetTrophyHero = IniRead($config, "search", "ABMeetTrophyHero", "0")
		$iChkMeetTHHero = IniRead($config, "search", "ABMeetTHHero", "0")
		$iChkMeetTHOHero = IniRead($config, "search", "ABMeetTHOHero", "0")
		$iChkWeakBaseHero = IniRead($config, "search", "ABWeakBaseHero", "0")
		$iChkMeetOneHero = IniRead($config, "search", "ABMeetOneHero", "0")

		$iMinGoldHero = IniRead($config, "search", "ABsearchGoldHero", "80000")
		$iMinElixirHero = IniRead($config, "search", "ABsearchElixirHero", "80000")
		$iMinGoldPlusElixirHero = IniRead($config, "search", "ABsearchGoldPlusElixirHero", "160000")
		$iMinDarkHero = IniRead($config, "search", "ABsearchDarkHero", "0")
		$iMinTrophyHero = IniRead($config, "search", "ABsearchTrophyHero", "0")
		$iCmbTHHero = IniRead($config, "search", "ABTHLevelHero", "0")
		$iCmbWeakMortarHero = IniRead($config, "search", "ABWeakMortarHero", "5")
		$iCmbWeakWizTowerHero = IniRead($config, "search", "ABWeakWizTowerHero", "4")


		$iChkSearchReduction = IniRead($config, "search", "reduction", "1")
		$ReduceCount = IniRead($config, "search", "reduceCount", "20")
		$ReduceGold = IniRead($config, "search", "reduceGold", "2000")
		$ReduceElixir = IniRead($config, "search", "reduceElixir", "2000")
		$ReduceGoldPlusElixir = IniRead($config, "search", "reduceGoldPlusElixir", "4000")
		$ReduceDark = IniRead($config, "search", "reduceDark", "100")
		$ReduceTrophy = IniRead($config, "search", "reduceTrophy", "2")

		$LBBKFilter = IniRead($config, "search", "LBBKFilter", "1")
		$LBAQFilter = IniRead($config, "search", "LBAQFilter", "1")
		;Attack Basics Settings-------------------------------------------------------------------------
		$iChkDeploySettings[$DB] = IniRead($config, "attack", "DBDeploy", "3")
		$iCmbUnitDelay[$DB] = IniRead($config, "attack", "DBUnitD", "5")
		$iCmbWaveDelay[$DB] = IniRead($config, "attack", "DBWaveD", "5")
		$iChkRandomspeedatk[$DB] = IniRead($config, "attack", "DBRandomSpeedAtk", "0")

		$iChkDeploySettings[$LB] = IniRead($config, "attack", "ABDeploy", "0")
		$iCmbUnitDelay[$LB] = IniRead($config, "attack", "ABUnitD", "5")
		$iCmbWaveDelay[$LB] = IniRead($config, "attack", "ABWaveD", "5")
		$iChkRandomspeedatk[$LB] = IniRead($config, "attack", "ABRandomSpeedAtk", "0")

		$iCmbSelectTroop[$DB] = IniRead($config, "attack", "DBSelectTroop", "0")
		$iCmbSelectTroop[$LB] = IniRead($config, "attack", "ABSelectTroop", "0")

		$iChkRedArea[$DB] = IniRead($config, "attack", "DBSmartAttackRedArea", "1")
		$iCmbSmartDeploy[$DB] = IniRead($config, "attack", "DBSmartAttackDeploy", "0")

		$iChkSmartAttack[$DB][0] = IniRead($config, "attack", "DBSmartAttackGoldMine", "0")
		$iChkSmartAttack[$DB][1] = IniRead($config, "attack", "DBSmartAttackElixirCollector", "0")
		$iChkSmartAttack[$DB][2] = IniRead($config, "attack", "DBSmartAttackDarkElixirDrill", "0")

		$iChkRedArea[$LB] = IniRead($config, "attack", "ABSmartAttackRedArea", "1")
		$iCmbSmartDeploy[$LB] = IniRead($config, "attack", "ABSmartAttackDeploy", "0")

		$iChkSmartAttack[$LB][0] = IniRead($config, "attack", "ABSmartAttackGoldMine", "0")
		$iChkSmartAttack[$LB][1] = IniRead($config, "attack", "ABSmartAttackElixirCollector", "0")
		$iChkSmartAttack[$LB][2] = IniRead($config, "attack", "ABSmartAttackDarkElixirDrill", "0")

		$iChkDEUseSpell = IniRead($config, "attack", "ABDEUseSpell", "0")
		$iChkDEUseSpellType = IniRead($config, "attack", "ABDEUseSpellType", "0")

		$KingAttack[$DB] = IniRead($config, "attack", "DBKingAtk", "0")
		$KingAttack[$LB] = IniRead($config, "attack", "ABKingAtk", "0")

		$QueenAttack[$DB] = IniRead($config, "attack", "DBQueenAtk", "0")
		$QueenAttack[$LB] = IniRead($config, "attack", "ABQueenAtk", "0")

		$iDropCC[$DB] = IniRead($config, "attack", "DBDropCC", "0")
		$iDropCC[$LB] = IniRead($config, "attack", "ABDropCC", "0")
		$iChkUseCCBalanced = IniRead($config, "attack", "BalanceCC", "0")
		$iCmbCCDonated = IniRead($config, "attack", "BalanceCCDonated", "1")
		$iCmbCCReceived = IniRead($config, "attack", "BalanceCCReceived", "1")

		$iActivateKQCondition = IniRead($config, "attack", "ActivateKQ", "Manual")
		$delayActivateKQ = (1000 * IniRead($config, "attack", "delayActivateKQ", "9"))

		$TakeLootSnapShot = IniRead($config, "attack", "TakeLootSnapShot", "0")
		$ScreenshotLootInfo = IniRead($config, "attack", "ScreenshotLootInfo", "0")

		;Attack Adv. Settings--------------------------------------------------------------------------
		$ichkAttackNow =  IniRead($config, "advanced", "AttackNow", "0")
		$iAttackNowDelay = IniRead($config, "advanced", "attacknowdelay", "3")

		$chkATH = IniRead($config, "advanced", "townhall", "0")
;		$iChkLightSpell = IniRead($config, "advanced", "hitDElightning", "0")
;		$iLSpellQ = IniRead($config, "advanced", "QLSpell", "3")

		$OptBullyMode = IniRead($config, "advanced", "BullyMode", "0")
		$ATBullyMode = IniRead($config, "advanced", "ATBullyMode", "0")
		$YourTH = IniRead($config, "advanced", "YourTH", "0")
		$iTHBullyAttackMode = IniRead($config, "advanced", "THBullyAttackMode", "0")

		$OptTrophyMode = IniRead($config, "advanced", "TrophyMode", "0")
		$OptIgnoreTraps = IniRead($config, "advanced", "IgnoreTraps", "0")
		$OptIgnoreAirTraps = IniRead($config, "advanced", "IgnoreAirTraps", "0")
		$OptParanoid = IniRead($config, "advanced", "Paranoid", "0")
		$OptGreedy = IniRead($config, "advanced", "Greedy", "0")
		$THaddtiles = IniRead($config, "advanced", "THaddTiles", "0")
		$AttackTHType = IniRead($config, "advanced", "AttackTHType", "0")
        ;$BottomTHType = IniRead($config, "advanced", "BottomTHType", "0")

		$PushToken = IniRead($config, "advanced", "AccountToken", "")

		$iAlertPBVillage = IniRead($config, "advanced", "AlertPBVillage", "0")
		$iLastAttack = IniRead($config, "advanced", "AlertPBLastAttack", "0")

		;Train Spell
		$ichkTrainLSpell = IniRead($config, "advanced", "chkTrainLSpell", "0")
		$ichkTrainHSpell = IniRead($config, "advanced", "chkTrainHSpell", "0")
		$ichkTrainRSpell = IniRead($config, "advanced", "chkTrainRSpell", "0")
		$ichkTrainJSpell = IniRead($config, "advanced", "chkTrainJSpell", "0")
		$ichkTrainFSpell = IniRead($config, "advanced", "chkTrainFSpell", "0")
		$ichkTrainPSpell = IniRead($config, "advanced", "chkTrainPSpell", "0")
		$ichkTrainESpell = IniRead($config, "advanced", "chkTrainESpell", "0")
		$ichkTrainHaSpell = IniRead($config, "advanced", "chkTrainHaSpell", "0")
		;$NormalSpellTrain = IniRead($config, "advanced", "cmbTrainNormalSpellType", "0")
		;$DarkSpellTrain = IniRead($config, "advanced", "cmbTrainDarkSpellType", "0")
		;		$iUnbreakableMode = IniRead($config, "advanced", "chkUnbreakable", "0")
		$iUnbreakableWait = IniRead($config, "advanced", "UnbreakableWait", "5")
		$iUnBrkMinGold = IniRead($config, "advanced", "minUnBrkgold", "50000")
		$iUnBrkMinElixir = IniRead($config, "advanced", "minUnBrkelixir", "50000")
		$iUnBrkMinDark = IniRead($config, "advanced", "minUnBrkdark", "5000")
		$iUnBrkMaxGold = IniRead($config, "advanced", "maxUnBrkgold", "600000")
		$iUnBrkMaxElixir = IniRead($config, "advanced", "maxUnBrkelixir", "600000")
		$iUnBrkMaxDark = IniRead($config, "advanced", "maxUnBrkdark", "10000")

		;atk their king
		;atk their queen

	    ;End Battle Settings------------------------------------------------------------------------
		$sTimeStopAtk = IniRead($config, "endbattle", "txtTimeStopAtk", "20")
		$iChkTimeStopAtk = IniRead($config, "endbattle", "chkTimeStopAtk", "1")

		$sTimeStopAtk2 = IniRead($config, "endbattle", "txtTimeStopAtk2", "7")
		$iChkTimeStopAtk2 = IniRead($config, "endbattle", "chkTimeStopAtk2", "0")

		$stxtMinGoldStopAtk2 = IniRead($config, "endbattle", "txtMinGoldStopAtk2", "1000")
		$stxtMinElixirStopAtk2 = IniRead($config, "endbattle", "txtMinElixirStopAtk2", "1000")
		$stxtMinDarkElixirStopAtk2 = IniRead($config, "endbattle", "txtMinDarkElixirStopAtk2", "50")

		$ichkEndOneStar = IniRead($config, "endbattle", "chkEndOneStar", "0")
		$ichkEndTwoStars = IniRead($config, "endbattle", "chkEndTwoStars", "0")
		$ichkEndNoResources = IniRead($config, "endbattle", "chkEndNoResources", "0")


		$DESideEB = IniRead($config, "endbattle", "chkDESideEB", "0")
		$DELowEndMin = IniRead($config, "endbattle", "txtDELowEndMin", "25")
		$DisableOtherEBO = IniRead($config, "endbattle", "chkDisableOtherEBO", "0")
		$DEEndOneStar = IniRead($config, "endbattle", "chkDEEndOneStar", "0")
		$DEEndBk = IniRead($config, "endbattle", "chkDEEndBk", "0")
		$DEEndAq = IniRead($config, "endbattle", "chkDEEndAq", "0")


		;Donate Settings-------------------------------------------------------------------------
		$iChkRequest = IniRead($config, "donate", "chkRequest", "0")
		$sTxtRequest = IniRead($config, "donate", "txtRequest", "")
		$iChkdonate = IniRead($config, "donate", "chkDonate", "0")

		$ichkDonateBarbarians = IniRead($config, "donate", "chkDonateBarbarians", "0")
		$ichkDonateAllBarbarians = IniRead($config, "donate", "chkDonateAllBarbarians", "0")
		$sTxtDonateBarbarians = StringReplace(IniRead($config, "donate", "txtDonateBarbarians", "barbarians|barb|any"), "|", @CRLF)
		$sTxtBlacklistBarbarians = StringReplace(IniRead($config, "donate", "txtBlacklistBarbarians", "no barbarians|no barb|barbarians no|barb no"), "|", @CRLF)
		$aDonBarbarians = StringSplit($sTxtDonateBarbarians, @CRLF, $STR_ENTIRESPLIT)
		$aBlkBarbarians = StringSplit($sTxtBlacklistBarbarians, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateArchers = IniRead($config, "donate", "chkDonateArchers", "0")
		$ichkDonateAllArchers = IniRead($config, "donate", "chkDonateAllArchers", "0")
		$sTxtDonateArchers = StringReplace(IniRead($config, "donate", "txtDonateArchers", "archers|arch|any"), "|", @CRLF)
		$sTxtBlacklistArchers = StringReplace(IniRead($config, "donate", "txtBlacklistArchers", "no archers|no arch|archers no|arch no"), "|", @CRLF)
		$aDonArchers = StringSplit($sTxtDonateArchers, @CRLF, $STR_ENTIRESPLIT)
		$aBlkArchers = StringSplit($sTxtBlacklistArchers, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateGiants = IniRead($config, "donate", "chkDonateGiants", "0")
		$ichkDonateAllGiants = IniRead($config, "donate", "chkDonateAllGiants", "0")
		$sTxtDonateGiants = StringReplace(IniRead($config, "donate", "txtDonateGiants", "giants|giant|any"), "|", @CRLF)
		$sTxtBlacklistGiants = StringReplace(IniRead($config, "donate", "txtBlacklistGiants", "no giants|giants no"), "|", @CRLF)
		$aDonGiants = StringSplit($sTxtDonateGiants, @CRLF, $STR_ENTIRESPLIT)
		$aBlkGiants = StringSplit($sTxtBlacklistGiants, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateGoblins = IniRead($config, "donate", "chkDonateGoblins", "0")
		$ichkDonateAllGoblins = IniRead($config, "donate", "chkDonateAllGoblins", "0")
		$sTxtDonateGoblins = StringReplace(IniRead($config, "donate", "txtDonateGoblins", "goblins|goblin"), "|", @CRLF)
		$sTxtBlacklistGoblins = StringReplace(IniRead($config, "donate", "txtBlacklistGoblins", "no goblins|goblins no"), "|", @CRLF)
		$aDonGoblins = StringSplit($sTxtDonateGoblins, @CRLF, $STR_ENTIRESPLIT)
		$aBlkGoblins = StringSplit($sTxtBlacklistGoblins, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateWallBreakers = IniRead($config, "donate", "chkDonateWallBreakers", "0")
		$ichkDonateAllWallBreakers = IniRead($config, "donate", "chkDonateAllWallBreakers", "0")
		$sTxtDonateWallBreakers = StringReplace(IniRead($config, "donate", "txtDonateWallBreakers", "wall breakers|wb"), "|", @CRLF)
		$sTxtBlacklistWallBreakers = StringReplace(IniRead($config, "donate", "txtBlacklistWallBreakers", "no wallbreakers|wb no"), "|", @CRLF)
		$aDonWallBreakers = StringSplit($sTxtDonateWallBreakers, @CRLF, $STR_ENTIRESPLIT)
		$aBlkWallBreakers = StringSplit($sTxtBlacklistWallBreakers, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateBalloons = IniRead($config, "donate", "chkDonateBalloons", "0")
		$ichkDonateAllBalloons = IniRead($config, "donate", "chkDonateAllBalloons", "0")
		$sTxtDonateBalloons = StringReplace(IniRead($config, "donate", "txtDonateBalloons", "balloons|balloon"), "|", @CRLF)
		$sTxtBlacklistBalloons = StringReplace(IniRead($config, "donate", "txtBlacklistBalloons", "no balloons|balloons no"), "|", @CRLF)
		$aDonBalloons = StringSplit($sTxtDonateBalloons, @CRLF, $STR_ENTIRESPLIT)
		$aBlkBalloons = StringSplit($sTxtBlacklistBalloons, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateWizards = IniRead($config, "donate", "chkDonateWizards", "0")
		$ichkDonateAllWizards = IniRead($config, "donate", "chkDonateAllWizards", "0")
		$sTxtDonateWizards = StringReplace(IniRead($config, "donate", "txtDonateWizards", "wizards|wizard"), "|", @CRLF)
		$sTxtBlacklistWizards = StringReplace(IniRead($config, "donate", "txtBlacklistWizards", "no wizards|wizards no"), "|", @CRLF)
		$aDonWizards = StringSplit($sTxtDonateWizards, @CRLF, $STR_ENTIRESPLIT)
		$aBlkWizards = StringSplit($sTxtBlacklistWizards, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateHealers = IniRead($config, "donate", "chkDonateHealers", "0")
		$ichkDonateAllHealers = IniRead($config, "donate", "chkDonateAllHealers", "0")
		$sTxtDonateHealers = StringReplace(IniRead($config, "donate", "txtDonateHealers", "healer"), "|", @CRLF)
		$sTxtBlacklistHealers = StringReplace(IniRead($config, "donate", "txtBlacklistHealers", "no healer|healer no"), "|", @CRLF)
		$aDonHealers = StringSplit($sTxtDonateHealers, @CRLF, $STR_ENTIRESPLIT)
		$aBlkHealers = StringSplit($sTxtBlacklistHealers, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateDragons = IniRead($config, "donate", "chkDonateDragons", "0")
		$ichkDonateAllDragons = IniRead($config, "donate", "chkDonateAllDragons", "0")
		$sTxtDonateDragons = StringReplace(IniRead($config, "donate", "txtDonateDragons", "dragon"), "|", @CRLF)
		$sTxtBlacklistDragons = StringReplace(IniRead($config, "donate", "txtBlacklistDragons", "no dragon|dragon no"), "|", @CRLF)
		$aDonDragons = StringSplit($sTxtDonateDragons, @CRLF, $STR_ENTIRESPLIT)
		$aBlkDragons = StringSplit($sTxtBlacklistDragons, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonatePekkas = IniRead($config, "donate", "chkDonatePekkas", "0")
		$ichkDonateAllPekkas = IniRead($config, "donate", "chkDonateAllPekkas", "0")
		$sTxtDonatePekkas = StringReplace(IniRead($config, "donate", "txtDonatePekkas", "pekka"), "|", @CRLF)
		$sTxtBlacklistPekkas = StringReplace(IniRead($config, "donate", "txtBlacklistPekkas", "no pekka|pekka no"), "|", @CRLF)
		$aDonPekkas = StringSplit($sTxtDonatePekkas, @CRLF, $STR_ENTIRESPLIT)
		$aBlkPekkas = StringSplit($sTxtBlacklistPekkas, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateMinions = IniRead($config, "donate", "chkDonateMinions", "0")
		$ichkDonateAllMinions = IniRead($config, "donate", "chkDonateAllMinions", "0")
		$sTxtDonateMinions = StringReplace(IniRead($config, "donate", "txtDonateMinions", "minions|minion"), "|", @CRLF)
		$sTxtBlacklistMinions = StringReplace(IniRead($config, "donate", "txtBlacklistMinions", "no minions|minions no"), "|", @CRLF)
		$aDonMinions = StringSplit($sTxtDonateMinions, @CRLF, $STR_ENTIRESPLIT)
		$aBlkMinions = StringSplit($sTxtBlacklistMinions, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateHogRiders = IniRead($config, "donate", "chkDonateHogRiders", "0")
		$ichkDonateAllHogRiders = IniRead($config, "donate", "chkDonateAllHogRiders", "0")
		$sTxtDonateHogRiders = StringReplace(IniRead($config, "donate", "txtDonateHogRiders", "hogriders|hogs|hog"), "|", @CRLF)
		$sTxtBlacklistHogRiders = StringReplace(IniRead($config, "donate", "txtBlacklistHogRiders", "no hogriders|hogriders no|no hogs|hogs no"), "|", @CRLF)
		$aDonHogRiders = StringSplit($sTxtDonateHogRiders, @CRLF, $STR_ENTIRESPLIT)
		$aBlkHogRiders = StringSplit($sTxtBlacklistHogRiders, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateValkyries = IniRead($config, "donate", "chkDonateValkyries", "0")
		$ichkDonateAllValkyries = IniRead($config, "donate", "chkDonateAllValkyries", "0")
		$sTxtDonateValkyries = StringReplace(IniRead($config, "donate", "txtDonateValkyries", "valkyries|valkyrie"), "|", @CRLF)
		$sTxtBlacklistValkyries = StringReplace(IniRead($config, "donate", "txtBlacklistValkyries", "no valkyries|valkyries no"), "|", @CRLF)
		$aDonValkyries = StringSplit($sTxtDonateValkyries, @CRLF, $STR_ENTIRESPLIT)
		$aBlkValkyries = StringSplit($sTxtBlacklistValkyries, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateGolems = IniRead($config, "donate", "chkDonateGolems", "0")
		$ichkDonateAllGolems = IniRead($config, "donate", "chkDonateAllGolems", "0")
		$sTxtDonateGolems = StringReplace(IniRead($config, "donate", "txtDonateGolems", "golem"), "|", @CRLF)
		$sTxtBlacklistGolems = StringReplace(IniRead($config, "donate", "txtBlacklistGolems", "no golem|golem no"), "|", @CRLF)
		$aDonGolems = StringSplit($sTxtDonateGolems, @CRLF, $STR_ENTIRESPLIT)
		$aBlkGolems = StringSplit($sTxtBlacklistGolems, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateWitches = IniRead($config, "donate", "chkDonateWitches", "0")
		$ichkDonateAllWitches = IniRead($config, "donate", "chkDonateAllWitches", "0")
		$sTxtDonateWitches = StringReplace(IniRead($config, "donate", "txtDonateWitches", "witches|witch"), "|", @CRLF)
		$sTxtBlacklistWitches = StringReplace(IniRead($config, "donate", "txtBlacklistWitches", "no witches|witches no"), "|", @CRLF)
		$aDonWitches = StringSplit($sTxtDonateWitches, @CRLF, $STR_ENTIRESPLIT)
		$aBlkWitches = StringSplit($sTxtBlacklistWitches, @CRLF, $STR_ENTIRESPLIT)

		$ichkDonateLavaHounds = IniRead($config, "donate", "chkDonateLavaHounds", "0")
		$ichkDonateAllLavaHounds = IniRead($config, "donate", "chkDonateAllLavaHounds", "0")
		$sTxtDonateLavaHounds = StringReplace(IniRead($config, "donate", "txtDonateLavaHounds", "lavahounds|hound|lava"), "|", @CRLF)
		$sTxtBlacklistLavaHounds = StringReplace(IniRead($config, "donate", "txtBlacklistLavaHounds", "no lavahound|hound no"), "|", @CRLF)
		$aDonLavaHounds = StringSplit($sTxtDonateLavaHounds, @CRLF, $STR_ENTIRESPLIT)
		$aBlkLavaHounds = StringSplit($sTxtBlacklistLavaHounds, @CRLF, $STR_ENTIRESPLIT)

		;;; Custom Combination Donate by ChiefM3, edit by Hervidero
		$ichkDonateCustom = IniRead($config, "donate", "chkDonateCustom", "0")
		$ichkDonateAllCustom = IniRead($config, "donate", "chkDonateAllCustom", "0")
		$sTxtDonateCustom = StringReplace(IniRead($config, "donate", "txtDonateCustom", "any|need"), "|", @CRLF)
		$sTxtBlacklistCustom = StringReplace(IniRead($config, "donate", "txtBlacklistCustom", "only|just"), "|", @CRLF)
		$aDonCustom = StringSplit($sTxtDonateCustom, @CRLF, $STR_ENTIRESPLIT)
		$aBlkCustom = StringSplit($sTxtBlacklistCustom, @CRLF, $STR_ENTIRESPLIT)
		$varDonateCustom[0][0] = IniRead($config, "donate", "cmbDonateCustom1", "6")
		$varDonateCustom[1][0] = IniRead($config, "donate", "cmbDonateCustom2", "1")
		$varDonateCustom[2][0] = IniRead($config, "donate", "cmbDonateCustom3", "0")
		$varDonateCustom[0][1] = IniRead($config, "donate", "txtDonateCustom1", "2")
		$varDonateCustom[1][1] = IniRead($config, "donate", "txtDonateCustom2", "3")
		$varDonateCustom[2][1] = IniRead($config, "donate", "txtDonateCustom3", "1")

		$sTxtBlacklist = StringReplace(IniRead($config, "donate", "txtBlacklist", "clan war|war|cw"), "|", @CRLF)
		$aBlackList = StringSplit($sTxtBlacklist, @CRLF, $STR_ENTIRESPLIT)

		$gtfocount = IniRead($config, "donate", "GTFOKickCount", "0")
		$SubAllDonate = IniRead($config, "donate", "donateAllSubTroop", "0")
		;Troop Settings--------------------------------------------------------------------------
		$iCmbTroopComp = IniRead($config, "troop", "TroopComposition", "0")

		$ichkUsePercent = IniRead($config, "troop", "Percent", "0")

		For $i = 0 To UBound($TroopName) - 1
			Assign($TroopName[$i] & "Comp", IniRead($config, "troop", $TroopName[$i], "0"))
		Next
		For $i = 0 To UBound($TroopDarkName) - 1
			Assign($TroopDarkName[$i] & "Comp", IniRead($config, "troop", $TroopDarkName[$i], "0"))
		Next

		For $i = 0 To 3 ;Covers all 4 Barracks
			$barrackTroop[$i] = IniRead($config, "troop", "troop" & $i + 1, "0")
		Next

		For $i = 0 To 1 ;Covers all 2 Dark Barracks
			$darkbarrackTroop[$i] = IniRead($config, "troop", "darktroop" & $i + 1, "0")
		Next

		$fulltroop = IniRead($config, "troop", "fullTroop", "100")

		$isldTrainITDelay = IniRead($config, "troop", "TrainITDelay", "20")
		;barracks boost not saved (no use)

		$iSpeed = IniRead($config, "troop", "Speed", "0")

		;Misc Settings--------------------------------------------------------------------------

		;Laboratory
		$ichkLab = IniRead($config, "upgrade", "upgradetroops", "0")
		$icmbLaboratory = IniRead($config, "upgrade", "upgradetroopname", "0")
		$aLabPos[0] = Int(IniRead($building, "upgrade", "LabPosX", "0"))
		$aLabPos[1] = Int(IniRead($building, "upgrade", "LabPosY", "0"))

		$ichkWalls = IniRead($config, "other", "auto-wall", "0")
		$iSaveWallBldr = IniRead($config, "other", "savebldr", "0")
		$iUseStorage = IniRead($config, "other", "use-storage", "0")

		$icmbWalls = IniRead($config, "other", "walllvl", "0")
		$itxtWallMinGold = IniRead($config, "other", "minwallgold", "0")
		$itxtWallMinElixir = IniRead($config, "other", "minwallelixir", "0")

		$itxtRestartGold = IniRead($config, "other", "minrestartgold", "10000")
		$itxtRestartElixir = IniRead($config, "other", "minrestartelixir", "25000")
		$itxtRestartDark = IniRead($config, "other", "minrestartdark", "500")

		$ichkTrap = IniRead($config, "other", "chkTrap", "0")
		$iChkCollect = IniRead($config, "other", "chkCollect", "1")
		$ichkTombstones = IniRead($config, "other", "chkTombstones", "0")
		$sTimeWakeUp = IniRead($config, "other", "txtTimeWakeUp", "0")
		$iVSDelay = IniRead($config, "other", "VSDelay", "0")

		$itxtMaxTrophy = IniRead($config, "other", "MaxTrophy", "5000")
		$itxtdropTrophy = IniRead($config, "other", "MinTrophy", "5000")
		$iChkTrophyHeroes = IniRead($config, "other", "chkTrophyHeroes", "0")
		$iChkTrophyAtkDead = IniRead($config, "other", "chkTrophyAtkDead", "0")

		$iWAOffsetX =  IniRead($config, "other", "WAOffsetX", "10")
		$iWAOffsetY =  IniRead($config, "other", "WAOffsetY", "0")

		;PushBullet Settings ---------------------------------------------
		$PushToken = IniRead($config, "pushbullet", "AccountToken", "")
		$iOrigPushB = IniRead($config, "pushbullet", "OrigPushB", "")

		$iAlertPBVillage = IniRead($config, "pushbullet", "AlertPBVillage", "0")
		$iLastAttack = IniRead($config, "pushbullet", "AlertPBLastAttack", "0")
		$iAlertPBLastRaidTxt = IniRead($config, "pushbullet", "AlertPBLastRaidTxt", "0")


		$pEnabled = IniRead($config, "pushbullet", "PBEnabled", "0")
		$pRemote = IniRead($config, "pushbullet", "PBRemote", "0")
		$iDeleteAllPushes = IniRead($config, "pushbullet", "DeleteAllPBPushes", "0")
		$pMatchFound = IniRead($config, "pushbullet", "AlertPBVMFound", "0")
		$pLastRaidImg = IniRead($config, "pushbullet", "AlertPBLastRaid", "0")
		$pWallUpgrade = IniRead($config, "pushbullet", "AlertPBWallUpgrade", "0")
		$pOOS = IniRead($config, "pushbullet", "AlertPBOOS", "0")
		$pTakeAbreak = IniRead($config, "pushbullet", "AlertPBVBreak", "0")
		$pAnotherDevice = IniRead($config, "pushbullet", "AlertPBOtherDevice", "0")
		$icmbHoursPushBullet = IniRead($config, "pushbullet", "HoursPushBullet", "4")
		$ichkDeleteOldPushes = IniRead($config, "pushbullet", "DeleteOldPushes", "0")
		$ichkAlertPBCampFull = IniRead($config, "pushbullet", "AlertCampFull", "0")


		$ichkDeleteLogs		= IniRead($config, "deletefiles", "DeleteLogs", "0")
		$iDeleteLogsDays	= IniRead($config, "deletefiles", "DeleteLogsDays", "7")
		$ichkDeleteTemp		= IniRead($config, "deletefiles", "DeleteTemp", "0")
		$iDeleteTempDays	= IniRead($config, "deletefiles", "DeleteTempDays", "7")
		$ichkDeleteLoots	= IniRead($config, "deletefiles", "DeleteLoots", "0")
		$iDeleteLootsDays	= IniRead($config, "deletefiles", "DeleteLootsDays", "7")

		$debugClick = IniRead($config, "debug", "debugClick", "0")
		If $DevMode = 1 Then
			GUICtrlSetState($chkDebugSetlog, $GUI_SHOW)
			GUICtrlSetState($chkDebugOcr, $GUI_SHOW)
			$DebugSetlog = BitOR($DebugSetlog, IniRead($config, "debug", "debugsetlog", "0"))
			$DebugOcr = BitOR($DebugOcr, IniRead($config, "debug", "debugocr", "0"))
		EndIf

		; Hours Planned
		$iPlannedDonateHours 			= StringSplit(IniRead($config, "planned", "DonateHours", "1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"),"|", $STR_NOCOUNT)
		$iPlannedRequestCCHours			= StringSplit(IniRead($config, "planned", "RequestHours", "1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"),"|", $STR_NOCOUNT)
		$iPlannedDropCCHours 			= StringSplit(IniRead($config, "planned", "DropCCHours", "1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"),"|", $STR_NOCOUNT)
		$iPlannedDonateHoursEnable  	= IniRead($config, "planned", "DonateHoursEnable", "0")
		$iPlannedRequestCCHoursEnable 	= IniRead($config, "planned", "RequestHoursEnable", "0")
		$iPlannedDropCCHoursEnable 		= IniRead($config, "planned", "DropCCEnable", "0")

		;Share Attack Settings----------------------------------------
		$iShareminGold = IniRead($config, "shareattack", "minGold", "200000")
		$iShareminElixir = IniRead($config, "shareattack", "minElixir", "200000")
		$iSharemindark = IniRead($config, "shareattack", "minDark", "100")
		$iShareAttack = IniRead($config, "shareattack", "ShareAttack", "0")
		$sShareMessage = StringReplace(IniRead($config, "shareattack", "Message", "Nice|Good|Thanks|Wowwww"), "|", @CRLF)

		;screenshot type: 0 JPG   1 PNG
		$iScreenshotType = IniRead($config, "other", "ScreenshotType", "0")

		$ichkScreenshotHideName = IniRead($config, "other", "ScreenshotHideName", "1")

		;forced Total Camp values
		$ichkTotalCampForced =  IniRead($config, "other", "ChkTotalCampForced", "0")
		$iValueTotalCampForced =  IniRead($config, "other", "ValueTotalCampForced", "200")

		$ichkLanguage = IniRead($config, "General", "ChkLanguage", "1")


		$ichkVersion = IniRead($config, "General", "ChkVersion", "1")
		$iChkSnipeWhileTrain = IniRead($config, "advanced", "chkSnipeWhileTrain", "0")

        ;;; Toolbox
        $ichkToolboxModeBot = IniRead($config, "ToolBox", "ModeBot", "0")
        $ichkToolboxModeSearch = IniRead($config, "ToolBox", "ModeSearch", "0")
        $ichkToolboxDetach = IniRead($config, "ToolBox", "Detach", "0")
        $ichkToolboxSavePos = IniRead($config, "ToolBox", "SavePos", "0")
        $iToolbox_x = IniRead($config, "ToolBox", "xToolbox", "0")
        $iToolbox_y = IniRead($config, "ToolBox", "yToolbox", "0")

		;Profile Switch
		$ichkGoldSwitchMax = IniRead($config, "profiles", "chkGoldSwitchMax", "0")
		$icmbGoldMaxProfile = IniRead($config, "profiles", "cmbGoldMaxProfile", "0")
		$itxtMaxGoldAmount = IniRead($config, "profiles", "txtMaxGoldAmount", "6000000")
		$ichkGoldSwitchMin = IniRead($config, "profiles", "chkGoldSwitchMin", "0")
		$icmbGoldMinProfile = IniRead($config, "profiles", "cmbGoldMinProfile", "0")
		$itxtMinGoldAmount = IniRead($config, "profiles", "txtMinGoldAmount", "500000")

		$ichkElixirSwitchMax = IniRead($config, "profiles", "chkElixirSwitchMax", "0")
		$icmbElixirMaxProfile = IniRead($config, "profiles", "cmbElixirMaxProfile", "0")
		$itxtMaxElixirAmount = IniRead($config, "profiles", "txtMaxElixirAmount", "6000000")
		$ichkElixirSwitchMin = IniRead($config, "profiles", "chkElixirSwitchMin", "0")
		$icmbElixirMinProfile = IniRead($config, "profiles", "cmbElixirMinProfile", "0")
		$itxtMinElixirAmount = IniRead($config, "profiles", "txtMinElixirAmount", "500000")

		$ichkDESwitchMax = IniRead($config, "profiles", "chkDESwitchMax", "0")
		$icmbDEMaxProfile = IniRead($config, "profiles", "cmbDEMaxProfile", "0")
		$itxtMaxDEAmount = IniRead($config, "profiles", "txtMaxDEAmount", "200000")
		$ichkDESwitchMin = IniRead($config, "profiles", "chkDESwitchMin", "0")
		$icmbDEMinProfile = IniRead($config, "profiles", "cmbDEMinProfile", "0")
		$itxtMinDEAmount = IniRead($config, "profiles", "txtMinDEAmount", "10000")

		$ichkTrophySwitchMax = IniRead($config, "profiles", "chkTrophySwitchMax", "0")
		$icmbTrophyMaxProfile = IniRead($config, "profiles", "cmbTrophyMaxProfile", "0")
		$itxtMaxTrophyAmount = IniRead($config, "profiles", "txtMaxTrophyAmount", "3000")
		$ichkTrophySwitchMin = IniRead($config, "profiles", "chkTrophySwitchMin", "0")
		$icmbTrophyMinProfile = IniRead($config, "profiles", "cmbTrophyMinProfile", "0")
		$itxtMinTrophyAmount = IniRead($config, "profiles", "txtMinTrophyAmount", "1000")

	Else
		Return False
	EndIf
EndFunc   ;==>readConfig
