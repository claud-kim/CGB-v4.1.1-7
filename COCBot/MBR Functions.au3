; #FUNCTION# ====================================================================================================================
; Name ..........: MBR Functions
; Description ...: This file Includes several files in the current script.
; Syntax ........: #include
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

#include "functions\Config\applyConfig.au3"
#include "functions\Config\readConfig.au3"
#include "functions\Config\saveConfig.au3"
#include "functions\Config\ScreenCoordinates.au3"
#include "functions\Config\DelayTimes.au3"
#include "functions\Attack\DESide.au3"
#include "functions\Attack\AttackReport.au3"
#include "functions\Attack\CheckHeroesHealth.au3"
#include "functions\Attack\dropCC.au3"
#include "functions\Attack\dropHeroes.au3"
#include "functions\Attack\dropSpell.au3"
#include "functions\Attack\AttackBottomTHType.au3"
#include "functions\Attack\TrainSpells.au3"
#include "functions\Attack\GoldElixirChange.au3"
#include "functions\Attack\GoldElixirChangeEBO.au3"
#include "functions\Attack\PrepareAttack.au3"
#include "functions\Attack\ReturnHome.au3"
#include "functions\Attack\SetSleep.au3"
#include "functions\Attack\Unbreakable.au3"
#include "functions\Attack\Attack Algorithms\algorithm_AllTroops.au3"
#include "functions\Attack\Attack Algorithms\algorithm_Barch.au3"
#include "functions\Attack\Attack Algorithms\algorithmTH.au3"
#include "functions\Attack\RedArea\_FindPixelCloser.au3"
#include "functions\Attack\RedArea\_GetOffsetTroopFurther.au3"
#include "functions\Attack\RedArea\_GetRedArea.au3"
#include "functions\Attack\RedArea\_GetVectorOutZone.au3"
#include "functions\Attack\RedArea\DebugRedArea.au3"
#include "functions\Attack\RedArea\DropOnPixel.au3"
#include "functions\Attack\RedArea\DropTroop.au3"
#include "functions\Attack\RedArea\GetLocation.au3"
#include "functions\Attack\RedArea\GetOffestPixelRedArea2.au3"
#include "functions\Attack\RedArea\GetPixelDropTroop.au3"
#include "functions\Attack\RedArea\GetPixelSide.au3"
#include "functions\Attack\RedArea\GetVectorPixelAverage.au3"
#include "functions\Attack\RedArea\GetVectorPixelOnEachSide.au3"
#include "functions\Attack\RedArea\GetVectorPixelToDeploy.au3"
#include "functions\Attack\Troops\DropOnEdge.au3"
#include "functions\Attack\Troops\DropOnEdges.au3"
#include "functions\Attack\Troops\IdentifyTroopKind.au3"
#include "functions\Attack\Troops\LauchTroop.au3"
#include "functions\Attack\Troops\NameOfTroop.au3"
#include "functions\Attack\Troops\OldDropTroop.au3"
#include "functions\Attack\Troops\ReadTroopQuantity.au3"
#include "functions\Attack\Troops\SelectDropTroop.au3"
#include "functions\Attack\Troops\GetXPosOfArmySlot.au3"
#include "functions\Attack\Troops\GetSlotIndexFromXPos.au3"

#include "functions\Image Search\ImageSearch.au3"
#include "functions\Image Search\checkDeadBase.au3"
#include "functions\Image Search\checkTownhall.au3"
#include "functions\Image Search\checkWall.au3"
;#include "functions\Image Search\checkDElixS.au3"
#include "functions\Image Search\CheckTombs.au3"
#include "functions\Image Search\ClearObstacles.au3"
#include "functions\Image Search\checkDefense.au3"

#include "functions\Main Screen\checkMainScreen.au3"
#include "functions\Main Screen\checkObstacles.au3"
#include "functions\Main Screen\CloseBlueStacks.au3"
#include "functions\Main Screen\isGemOpen.au3"
#include "functions\Main Screen\isNoUpgradeLoot.au3"
#include "functions\Main Screen\isProblemAffect.au3"
#include "functions\Main Screen\OpenBlueStacks.au3"
#include "functions\Main Screen\RemoveGhostTrayIcons.au3"
#include "functions\Main Screen\waitMainScreen.au3"
#include "functions\Main Screen\ZoomOut.au3"


#include "functions\Other\_NumberFormat.au3"
#include "functions\Other\_PadStringCenter.au3"
#include "functions\Other\_ReduceMemory.au3"
#include "functions\Other\_Sleep.au3"
#include "functions\Other\_SleepStatus.au3"
#include "functions\Other\_StatusUpdateTime.au3"
#include "functions\Other\Click.au3"
#include "functions\Other\CreateLogFile.au3"
#include "functions\Other\debugMBRFunctions.au3"
#include "functions\Other\FindPos.au3"
#include "functions\Other\getBSPos.au3"
#include "functions\Other\ExtMsgBox.au3"
#include "functions\Other\StringSize.au3"
;#include "functions\Other\GUICtrlGetBkColor.au3" ; included in CGB GUI Control
#include "functions\Other\SetLog.au3"
#include "functions\Other\Tab.au3"
#include "functions\Other\Time.au3"
#include "functions\Other\BlockInputEx.au3"
#include "functions\Other\TogglePause.au3"
#include "functions\Other\CheckPrerequisites.au3"
#include "functions\Other\AutoStart.au3"
#include "functions\Other\WindowsArrange.au3"
#include "functions\Other\MakeScreenshot.au3"
#include "functions\Other\ClickDrag.au3"
#include "functions\Other\TestLanguage.au3"
#include "functions\Other\DeleteFiles.au3"
#include "functions\Other\CheckVersion.au3"
#include "functions\Other\TrainClick.au3"
#include "functions\Other\ProfileSwitch.au3"
#include "functions\Other\IceBreaker.au3"
#include "functions\Other\KeepAlive.au3"
#include "functions\Other\Chatbot.au3"

#include "functions\Pixels\_CaptureRegion.au3"
#include "functions\Pixels\_ColorCheck.au3"
#include "functions\Pixels\_CheckPixel.au3"
#include "functions\Pixels\GetListPixel.au3"
#include "functions\Pixels\_GetPixelColor.au3"
#include "functions\Pixels\_PixelSearch.au3"
#include "functions\Pixels\_MultiPixelSearch.au3"
#include "functions\Pixels\boolPixelSearch.au3"
#include "functions\Pixels\isInsideDiamond.au3"
#include "functions\Pixels\isInsideBigDiamond.au3"

#include "functions\Read Text\BuildingInfo.au3"
#include "functions\Read Text\getChar.au3"
#include "functions\Read Text\getDarkElixir.au3"
#include "functions\Read Text\getDigit.au3"
#include "functions\Read Text\getDigitLarge.au3"
#include "functions\Read Text\getDigitSmall.au3"
#include "functions\Read Text\getDigitProfile.au3"
#include "functions\Read Text\getElixir.au3"
#include "functions\Read Text\getGold.au3"
#include "functions\Read Text\getNormal.au3"
#include "functions\Read Text\getOther.au3"
#include "functions\Read Text\getReturnHome.au3"
#include "functions\Read Text\getTrophy.au3"
#include "functions\Read Text\getString.au3"
#include "functions\Read Text\getOcr.au3"

;#include "functions\Search\checkNextButton.au3"
#include "functions\Search\CompareResources.au3"
#include "functions\Search\GetResources.au3"
#include "functions\Search\PrepareSearch.au3"
#include "functions\Search\VillageSearch.au3"
#include "functions\Search\CheckZoomOut.au3"
#include "functions\Search\SearchTownHallloc.au3"
#include "functions\Search\CheckHeroAvailable.au3"
#include "functions\Village\_TrainMoveBtn.au3"
#include "functions\Village\BoostBarracks.au3"
#include "functions\Village\BotDetectFirstTime.au3"
#include "functions\Village\BotCommand.au3"
#include "functions\Village\CheckFullArmy.au3"
#include "functions\Village\CheckArmyCamp.au3"
#include "functions\Village\Collect.au3"
#include "functions\Village\DonateCC.au3"
#include "functions\Village\DropTrophy.au3"
#include "functions\Village\GetTownHallLevel.au3"
#include "functions\Village\isGoldFull.au3"
#include "functions\Village\isElixirFull.au3"
#include "functions\Village\isDarkElixirFull.au3"
#include "functions\Village\LocateBarrack.au3"
#include "functions\Village\LocateUpgrade.au3"
#include "functions\Village\LocateClanCastle.au3"
#include "functions\Village\LocateLab.au3"
#include "functions\Village\LocateTownHall.au3"
#include "functions\Village\LocateSpell.au3"
#include "functions\Village\ProfileReport.au3"
#include "functions\Village\ReArm.au3"
#include "functions\Village\RequestCC.au3"
#include "functions\Village\Spell.au3"
#include "functions\Village\Train.au3"
#include "functions\Village\TrainIt.au3"
#include "functions\Village\VillageReport.au3"
#include "functions\Village\isBarrack.au3"
#include "functions\Village\UpgradeBuilding.au3"
#include "functions\Village\UpgradeWall.au3"
#include "functions\Village\PushBullet.au3"
#include "functions\Village\Laboratory.au3"
#include "functions\Village\ReplayShare.au3"
#include "functions\Village\BarracksStatus.au3"
#include "functions\Attack\SnipeWhileTrain.au3"
#include "functions\Attack\Attack Algorithms\MasterGiBAM.au3"
#include "functions\Attack\Attack Algorithms\AttackTHSmartBarch.au3"
#include "functions\Attack\Attack Algorithms\AllIn.au3"
#include "functions\Attack\Attack Algorithms\Lavaloonion.au3"
#include "functions\Attack\Attack Algorithms\THDragons.au3"
#include "functions\Attack\Attack Algorithms\THWizard.au3"
#include "functions\Village\LocateHeroes.au3"
#include "functions\Village\UpgradeHeroes.au3"