; #FUNCTION# ====================================================================================================================
; Name ..........: MBR Bot
; Description ...: This file contens the Sequence that runs all MBR Bot
; Author ........:  (2014)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

#RequireAdmin
#AutoIt3Wrapper_UseX64=n
#include <WindowsConstants.au3>
#include <WinAPI.au3>

#pragma compile(Icon, "Icons\MyBot.ico")
#pragma compile(FileDescription, Clash of Clans Bot - A Free Clash of Clans bot - https://mybot.run)
#pragma compile(ProductName, My Bot)

#pragma compile(ProductVersion, 4.2)
#pragma compile(FileVersion, 4.2)
#pragma compile(LegalCopyright, © https://mybot.run)

$sBotVersion = "v4.2-1"
$sBotTitle = "My Bot " & $sBotVersion
Global $sBotDll = @ScriptDir & "\MBRPlugin.dll"

If _Singleton($sBotTitle, 1) = 0 Then
	MsgBox(0, "", "Bot is already running.")
	Exit
EndIf

If @AutoItX64 = 1 Then
	MsgBox(0, "", "Don't Run/Compile the Script as (x64)! try to Run/Compile the Script as (x86) to get the bot to work." & @CRLF & _
			"If this message still appears, try to re-install AutoIt.")
	Exit
EndIf

If Not FileExists(@ScriptDir & "\License.txt") Then
	$license = InetGet("http://www.gnu.org/licenses/gpl-3.0.txt", @ScriptDir & "\License.txt")
	InetClose($license)
EndIf

#include "COCBot\MBR Global Variables.au3"
#include "COCBot\MBR GUI Design.au3"
#include "COCBot\MBR GUI Control.au3"
#include "COCBot\MBR Functions.au3"

CheckPrerequisites() ; check for VC2010 and .NET software

DirCreate($sTemplates)
DirCreate($sProfilePath & "\" & $sCurrProfile)
DirCreate($dirLogs)
DirCreate($dirLoots)
DirCreate($dirTemp)
FileMove(@ScriptDir & "\*.ini", $sProfilePath & "\" & $sCurrProfile, $FC_OVERWRITE + $FC_CREATEPATH)
DirCopy(@ScriptDir & "\Logs", $sProfilePath & "\" & $sCurrProfile & "\Logs", $FC_OVERWRITE + $FC_CREATEPATH)
DirCopy(@ScriptDir & "\Loots", $sProfilePath & "\" & $sCurrProfile & "\Loots", $FC_OVERWRITE + $FC_CREATEPATH)
DirCopy(@ScriptDir & "\Temp", $sProfilePath & "\" & $sCurrProfile & "\Temp", $FC_OVERWRITE + $FC_CREATEPATH)
DirRemove(@ScriptDir & "\Logs", 1)
DirRemove(@ScriptDir & "\Loots", 1)
DirRemove(@ScriptDir & "\Temp", 1)

If $ichkDeleteLogs = 1 Then DeleteFiles($dirLogs, "*.*", $iDeleteLogsDays, 0)
If $ichkDeleteLoots = 1 Then DeleteFiles($dirLoots, "*.*", $iDeleteLootsDays, 0)
If $ichkDeleteTemp = 1 Then DeleteFiles($dirTemp, "*.*", $iDeleteTempDays, 0)
FileChangeDir($LibDir)

;MBRfunctions.dll debugger
debugMBRFunctions($debugSearchArea, $debugRedArea, $debugOcr) ; set debug levels

AdlibRegister("PushBulletRemoteControl", $PBRemoteControlInterval)
AdlibRegister("PushBulletDeleteOldPushes", $PBDeleteOldPushesInterval)

;CheckVersion() ; check latest version on mybot.run site

;AutoStart Bot if request
AutoStart()

While 1
	Switch TrayGetMsg()
		Case $tiAbout
			MsgBox(64 + $MB_APPLMODAL + $MB_TOPMOST, $sBotTitle, "Clash of Clans Bot" & @CRLF & @CRLF & _
					"Version: " & $sBotVersion & @CRLF & _
					"Released under the GNU GPLv3 license.", 0, $frmBot)
		Case $tiExit
			ExitLoop
	EndSwitch
WEnd

Func runBot() ;Bot that runs everything in order
	$TotalTrainedTroops = 0
	;$ChatbotStartTime =  TimerInit()
	$ClanAdStartTime =  TimerInit()
	While 1
		SWHTrainRevertNormal()
		$Restart = False
		$fullArmy = False
		$CommandStop = -1
		If _Sleep($iDelayRunBot1) Then Return
		checkMainScreen()
		If $Restart = True Then ContinueLoop
		If $Is_ClientSyncError = False Then
			If BotCommand() Then btnStop()
			If _Sleep($iDelayRunBot2) Then Return
			checkMainScreen(False)
			If $Restart = True Then ContinueLoop
			If $RequestScreenshot = 1 Then PushMsg("RequestScreenshot")
			If _Sleep($iDelayRunBot3) Then Return
			VillageReport()
			ProfileSwitch()
			If $OutOfGold = 1 And ($GoldCount >= $itxtRestartGold) Then ; check if enough gold to begin searching again
				$OutOfGold = 0 ; reset out of gold flag
				Setlog("Switching back to normal after no gold to search ...", $COLOR_RED)
				$ichkBotStop = 0 ; reset halt attack variable
				ContinueLoop ; Restart bot loop to reset $CommandStop
			EndIf
			If $OutOfElixir = 1 And ($ElixirCount >= $itxtRestartElixir) And ($DarkCount >= $itxtRestartDark) Then ; check if enough elixir to begin searching again
				$OutOfElixir = 0 ; reset out of gold flag
				Setlog("Switching back to normal setting after no elixir to train ...", $COLOR_RED)
				$ichkBotStop = 0 ; reset halt attack variable
				ContinueLoop ; Restart bot loop to reset $CommandStop
			EndIf
			If _Sleep($iDelayRunBot5) Then Return
			checkMainScreen(False)
			If $Restart = True Then ContinueLoop
			CheckTombs()
			If _Sleep($iDelayRunBot3) Then Return
			If $Restart = True Then ContinueLoop
			ReArm()
			If _Sleep($iDelayRunBot3) Then Return
			If $Restart = True Then ContinueLoop
			ReplayShare($iShareAttackNow)
			If _Sleep($iDelayRunBot3) Then Return
			If $Restart = True Then ContinueLoop
			ReportPushBullet()
			If _Sleep($iDelayRunBot3) Then Return
			If $Restart = True Then ContinueLoop
			DonateCC()
			If _Sleep($iDelayRunBot1) Then Return
			checkMainScreen(False) ; required here due to many possible exits
			If $Restart = True Then ContinueLoop
			$iArmyPercent = 0
			If $ichkUsePercent = 1 Then
				checkArmyCamp()
				PercentComp()
			EndIf
			Train()
			If _Sleep($iDelayRunBot1) Then Return
			checkMainScreen(False)
			If $Restart = True Then ContinueLoop
			Collect()
			If $Restart = True Then ContinueLoop
			BoostBarracks()
			If $Restart = True Then ContinueLoop
			BoostSpellFactory()
			If $Restart = True Then ContinueLoop
			BoostHeros()
			If $Restart = True Then ContinueLoop
			RequestCC()
			If _Sleep($iDelayRunBot1) Then Return
			checkMainScreen(False) ; required here due to many possible exits
			If $Restart = True Then ContinueLoop
			If $iUnbreakableMode >= 1 Then
				If Unbreakable() = True Then ContinueLoop
			EndIf
			Laboratory()
			If _Sleep($iDelayRunBot3) Then Return
			checkMainScreen(False) ; required here due to many possible exits
			If $Restart = True Then ContinueLoop
			If $FreeBuilder > $iSaveWallBldr Then
				UpgradeHeroes()
				If _Sleep($iDelayRunBot3) Then Return
				checkMainScreen(False) ; required here due to many possible exits
				If $Restart = True Then ContinueLoop
				UpgradeBuilding()
				If _Sleep($iDelayRunBot3) Then Return
				checkMainScreen(False) ; required here due to many possible exits
				If $Restart = True Then ContinueLoop
			EndIf
			UpgradeWall()
			If _Sleep($iDelayRunBot3) Then Return
			If $Restart = True Then ContinueLoop

			ClearObstacles()

			If _Sleep($iDelayRunBot3) Then Return
			If $Restart = True Then ContinueLoop

			RequestCC()

			If _Sleep($iDelayRunBot3) Then Return
			;checkMainScreen(False) ; required here due to many possible exits
			If $Restart = True Then ContinueLoop

			Idle()
			If _Sleep($iDelayRunBot3) Then Return
			If $Restart = True Then ContinueLoop
			If $CommandStop <> 0 And $CommandStop <> 3 Then
				AttackMain()
				If $OutOfGold = 1 Then
					Setlog("Switching to Halt Attack, Stay Online/Collect mode ...", $COLOR_RED)
					$ichkBotStop = 1 ; set halt attack variable
					$icmbBotCond = 16 ; set stay online/collect only mode
					$FirstStart = True ; reset First time flag to ensure army balancing when returns to training
					ContinueLoop
				EndIf
				If _Sleep($iDelayRunBot1) Then Return
				If $Restart = True Then ContinueLoop
			EndIf
			;
		Else ;When error occours directly goes to attack
			SetLog("Restarted after Out of Sync Error: Attack Now", $COLOR_RED)
			PushMsg("OutOfSync")
			checkMainScreen(False)
			If $Restart = True Then ContinueLoop
			AttackMain()
			If $OutOfGold = 1 Then
				Setlog("Switching to Halt Attack, Stay Online/Collect mode ...", $COLOR_RED)
				$ichkBotStop = 1 ; set halt attack variable
				$icmbBotCond = 16 ; set stay online/collect only mode
				$FirstStart = True ; reset First time flag to ensure army balancing when returns to training
				$Is_ClientSyncError = False ; reset fast restart flag to stop OOS mode and start collecting resources
				ContinueLoop
			EndIf
			If _Sleep($iDelayRunBot5) Then Return
			If $Restart = True Then ContinueLoop
		EndIf
	WEnd
EndFunc   ;==>runBot

Func Idle() ;Sequence that runs until Full Army
	Local $TimeIdle = 0 ;In Seconds
	Local $trainTimerAdjust=-1, $timeInTrain=0, $TimeIdleinMinutes=0 ;In minutes

	If $debugSetlog = 1 Then SetLog("Func Idle ", $COLOR_PURPLE)
	While $fullArmy = False
		If $RequestScreenshot = 1 Then PushMsg("RequestScreenshot")
		If _Sleep($iDelayIdle1) Then Return
		If $CommandStop = -1 Then SetLog("====== Waiting for full army ======", $COLOR_GREEN)
		Local $hTimer = TimerInit()
		Local $iReHere = 0
		While $iReHere < 7
			$iReHere += 1
			DonateCC(True)
			If _Sleep($iDelayIdle2) Then ExitLoop
			If $Restart = True Then ExitLoop
		WEnd
		If _Sleep($iDelayIdle1) Then ExitLoop
		checkMainScreen(False) ; required here due to many possible exits
		If ($CommandStop = 3 Or $CommandStop = 0) Then
			CheckOverviewFullArmy(True)
			If Not ($fullArmy) And $bTrainEnabled = True Then
				SetLog("Army Camp and Barracks are not full, Training Continues...", $COLOR_ORANGE)
				$CommandStop = 0
			EndIf
		EndIf
		ReplayShare($iShareAttackNow)
		If _Sleep($iDelayIdle1) Then Return
		If $Restart = True Then ExitLoop
		If $iCollectCounter > $COLLECTATCOUNT Then ; This is prevent from collecting all the time which isn't needed anyway
			Collect()
			If $Restart = True Then ExitLoop
			If _Sleep($iDelayIdle1) Or $RunState = False Then ExitLoop
			$iCollectCounter = 0
		EndIf
		$iCollectCounter = $iCollectCounter + 1
		If $CommandStop <> 0 Or $CommandStop <> 3 Then
			If _GUICtrlComboBox_GetCurSel($cmbTroopComp) = 8 Then

				If (($CurCamp >= ($TotalCamp * 20 / 100)) And ($iArmyPercent < 20)) Then
					SetLog("====== Army more than 20% ======", $COLOR_GREEN)
					Train()
					If $Restart = True Then ExitLoop
					If _Sleep($iDelayIdle1) Then ExitLoop
					checkMainScreen(False)
					RequestCC()
					If $Restart = True Then ExitLoop
					If _Sleep($iDelayIdle1) Then ExitLoop
					;checkMainScreen(False)
					$iArmyPercent = 20
				ElseIf (($CurCamp >= ($TotalCamp * 40 / 100)) And ($iArmyPercent < 40)) Then
					SetLog("====== Army more than 40% ======", $COLOR_GREEN)
					Train()
					If $Restart = True Then ExitLoop
					If _Sleep($iDelayIdle1) Then ExitLoop
					checkMainScreen(False)
					RequestCC()
					If $Restart = True Then ExitLoop
					If _Sleep($iDelayIdle1) Then ExitLoop
					;checkMainScreen(False)
					$iArmyPercent = 40
				ElseIf (($CurCamp >= ($TotalCamp * 60 / 100)) And ($iArmyPercent < 60)) Then
					SetLog("====== Army more than 60% ======", $COLOR_GREEN)
					Train()
					If $Restart = True Then ExitLoop
					If _Sleep($iDelayIdle1) Then ExitLoop
					checkMainScreen(False)
					RequestCC()
					If $Restart = True Then ExitLoop
					If _Sleep($iDelayIdle1) Then ExitLoop
					;checkMainScreen(False)
					$iArmyPercent = 60
				ElseIf (($CurCamp >= ($TotalCamp * 80 / 100)) And ($iArmyPercent < 80)) Then
					SetLog("====== Army more than 80% ======", $COLOR_GREEN)
					Train()
					If $Restart = True Then ExitLoop
					If _Sleep($iDelayIdle1) Then ExitLoop
					checkMainScreen(False)
					RequestCC()
					If $Restart = True Then ExitLoop
					If _Sleep($iDelayIdle1) Then ExitLoop
					;checkMainScreen(False)
					$iArmyPercent = 80
				Else
					checkArmyCamp()
					If $Restart = True Then ExitLoop
					If _Sleep($iDelayIdle1) Then ExitLoop
					checkMainScreen(False)
				EndIf
			Else
				Train()
				If $Restart = True Then ExitLoop
				If _Sleep($iDelayIdle1) Then ExitLoop
				checkMainScreen(False)
			EndIf
		EndIf
		If _Sleep($iDelayIdle1) Then Return
		If $CommandStop = 0 And $bTrainEnabled = True Then
			If Not ($fullArmy) Then
				Train()
				If $Restart = True Then ExitLoop
				If _Sleep($iDelayIdle1) Then ExitLoop
				checkMainScreen(False)
				If $fullArmy Then
					SetLog("Army Camp and Barracks are full, stop Training...", $COLOR_ORANGE)
					$CommandStop = 3
				EndIf
			EndIf
		EndIf
		If _Sleep($iDelayIdle1) Then Return
		If $CommandStop = -1 Then
			DropTrophy()
			If $Restart = True Then ExitLoop
			If $fullArmy Then ExitLoop
			If _Sleep($iDelayIdle1) Then ExitLoop
			checkMainScreen(False)
		EndIf
		If _Sleep($iDelayIdle1) Then Return
		If $Restart = True Then ExitLoop
		If $ichkIceBreaker = 1 Then IceBreaker()
		If $ichkKeepAlive = 1 Then KeepAlive()
		If $ichkClanAd = 1 Then
			If TimerDiff($ClanAdStartTime) = 15*1000 Then
				WriteClan($itxtClanAd)
				$ClanAdStartTime = TimerInit()
			EndIf
		EndIf
		RequestCC()
		SnipeWhileTrain()
		$TimeIdle += Round(TimerDiff($hTimer) / 1000, 2) ;In Seconds
		; use getMinInTrain() if Idle is too long without troops in training
		$timeInTrain = getMaxInTrain()
		$TimeIdleinMinutes = Floor($TimeIdle/60)
		If $trainTimerAdjust = -1 Then $trainTimerAdjust = $TimeIdleinMinutes + $timeInTrain
		If $debugSetlog = 1 Then SetLog("$trainTimerAdjust: " & $trainTimerAdjust & " $timeInTrain: " & $timeInTrain & " $TimeIdleinMinutes: " & $TimeIdleinMinutes)
		If $debugSetlog = 1 Then SetLog("$CurCamp: " & $CurCamp & " $CurCampOld: " & $CurCampOld)
		If $CurCamp = $CurCampOld Then ; if no new troop is produced or being trained
			If $TimeIdleinMinutes-$trainTimerAdjust > 0 Then ;the adjusted idle time exceeds minimum time to wait for unit to be produced
				If $iSpeed = 0 Then
					If $notTraining < $numBarracksAvaiables Then ; training stuck, also $timeInTrain = -1
						$RemoveTroops=True
						ResetCounters()
						$trainFiller = True
					Else
						$trainFiller = True
					EndIf
					If $notTrainingDark < $numDarkBarracksAvaiables Then ; training stuck, also $timeInTrain = -1
						$RemoveDarkTroops=True
						ResetCounters()
						$trainFillerDark = True
					Else
						$trainFillerDark = True
					EndIf
				ElseIf $iSpeed = 1 Then
					If $notTraining = 0 Then
						$RemoveTroops=True
						ResetCounters()
						$trainFiller = True
					Else
						$trainFiller = True
					EndIf
					If $notTrainingDark = 0 Then
						$RemoveDarkTroops=True
						ResetCounters()
						$trainFillerDark = True
					Else
						$trainFillerDark = True
					EndIf
				EndIf

				If $debugSetlog = 1 Then SetLog("time $ArchComp: " & $ArchComp & " $eBallComp" & $BallComp & " $eMiniComp: " & $MiniComp)
			EndIf
		Else
			$trainTimerAdjust = $TimeIdleinMinutes + $timeInTrain ;units are being produced, increment time to adjust idle time
		EndIf
		;If all barracks are idle and army not yet full
		If $TotalCamp<>$CurCamp And $notTraining  + $notTrainingDark = $numBarracksAvaiables + $numDarkBarracksAvaiables Then ResetCounters()
		SetLog("Time Idle: " & StringFormat("%02i", Floor(Floor($TimeIdle / 60) / 60)) & ":" & StringFormat("%02i", Floor(Mod(Floor($TimeIdle / 60), 60))) & ":" & StringFormat("%02i", Floor(Mod($TimeIdle, 60))))
		If $OutOfGold = 1 Then Return
	WEnd
	If $iSpeed = 0 Then
		$RemoveTroops=True
		$RemoveDarkTroops=True
	EndIf
	ResetCounters()
	If $debugSetlog = 1 Then SetLog("attack $ArchComp: " & $ArchComp & " $eBallComp" & $BallComp & " $eMiniComp: " & $MiniComp)
EndFunc   ;==>Idle

Func AttackMain() ;Main control for attack functions
	;launch profilereport() only if option balance D/R it's activated
	If $iChkUseCCBalanced = 1 Then
		ProfileReport()
		If _Sleep($iDelayAttackMain1) Then Return
		checkMainScreen(False)
		If $Restart = True Then Return
	EndIf
	PrepareSearch()
	If $OutOfGold = 1 Then Return ; Check flag for enough gold to search
	If $Restart = True Then Return
	VillageSearch()
	If $OutOfGold = 1 Then Return ; Check flag for enough gold to search
	If $Restart = True Then Return

	;;; ToolBox ;;;;;;;;;
	If $ToolboxModeBot Then
		_GUI_Toolbox_Show()
	EndIf

	PrepareAttack($iMatchMode)
	If $Restart = True Then Return
	;checkDarkElix()
	;DEAttack()

	;;; ToolBox ;;;;;;;;;
	If $ToolboxModeBot Then
		_GUI_Toolbox_Activate()
	EndIf

	If $Restart = True Then Return
	Attack()
	If $Restart = True Then Return
	ReturnHome($TakeLootSnapShot)
	If _Sleep($iDelayAttackMain2) Then Return
	Return True
EndFunc   ;==>AttackMain

Func Attack() ;Selects which algorithm
	SetLog(" ====== Start Attack ====== ", $COLOR_GREEN)
	algorithm_AllTroops()
EndFunc   ;==>Attack
