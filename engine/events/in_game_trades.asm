; TradeTextPointers1-3 indexes
	const_def
	const TRADETEXT_WANNA_TRADE ; 0
	const TRADETEXT_NO_TRADE    ; 1
	const TRADETEXT_WRONG_MON   ; 2
	const TRADETEXT_THANKS      ; 3
	const TRADETEXT_AFTER_TRADE ; 4
DEF NUM_TRADE_TEXTS EQU const_value

DoInGameTradeDialogue:
; trigger the trade offer/action specified by wWhichTrade
	call SaveScreenTilesToBuffer2
	ld hl, TradeMons
	ld a, [wWhichTrade]
	ld b, 0
	ld c, 3 + NAME_LENGTH ; Aironfaar mod: simplified the flow
	call AddNTimes ; Aironfaar mod
	ld a, [hli]
	ld [wInGameTradeGiveMonSpecies], a
	ld a, [hli]
	ld [wInGameTradeReceiveMonSpecies], a
	ld a, [hli]
	push af
	ld de, wInGameTradeMonNick
	ld bc, NAME_LENGTH
	rst _CopyData
	pop af
	ld l, a
	ld h, 0
	ld de, InGameTradeTextPointers
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wInGameTradeTextPointerTablePointer], a
	ld a, [hl]
	ld [wInGameTradeTextPointerTablePointer + 1], a
	ld a, [wInGameTradeGiveMonSpecies]
	ld de, wInGameTradeGiveMonName
	call InGameTrade_GetMonName
	ld a, [wInGameTradeReceiveMonSpecies]
	ld de, wInGameTradeReceiveMonName
	call InGameTrade_GetMonName
	ld hl, wCompletedInGameTradeFlags
	ld a, [wWhichTrade]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	ld a, TRADETEXT_AFTER_TRADE
	ld [wInGameTradeTextPointerTableIndex], a
	jr nz, .printText
; if the trade hasn't been done yet
	ASSERT TRADETEXT_WANNA_TRADE == 0
	xor a
	ld [wInGameTradeTextPointerTableIndex], a
	call .printText
	ld a, TRADETEXT_NO_TRADE
	ld [wInGameTradeTextPointerTableIndex], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .printText
	call InGameTrade_DoTrade
	jr c, .printText
	ld hl, TradedForText
	rst _PrintText
.printText
	ld hl, wInGameTradeTextPointerTableIndex
	ld a, [hld] ; wInGameTradeTextPointerTableIndex
	ld e, a
	ld d, 0
	ld a, [hld] ; wInGameTradeTextPointerTablePointer + 1
	ld l, [hl] ; wInGameTradeTextPointerTablePointer
	ld h, a
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PrintText

; copies name of species a to hl
InGameTrade_GetMonName:
	push de
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, wNameBuffer
	pop de
	ld bc, NAME_LENGTH
	jp CopyData

INCLUDE "data/events/trades.asm"

InGameTrade_DoTrade:
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	push af
	call InGameTrade_RestoreScreen
	pop af
	ld a, TRADETEXT_NO_TRADE
	jp c, .tradeFailed ; jump if the player didn't select a pokemon
	ld a, [wInGameTradeGiveMonSpecies]
	ld b, a
	ld a, [wCurPartySpecies]
	cp b
	ld a, TRADETEXT_WRONG_MON
	jp nz, .tradeFailed ; jump if the selected mon's species is not the required one
	ld a, [wWhichPokemon]
;;;;;;;;;; PureRGBnote: ADDED: check if we need to store whether the player's pokemon uses alternate palette to make the trade animation correct
	ld hl, wPartyMon1Flags
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hl]
	and 1
	ld [wIsAltPalettePkmn], a ; is the player's pokemon they're trading away alternate palette
	ld bc, wPartyMon1Level - wPartyMon1Flags
	add hl, bc ; go to level
	ld a, [hl]
;;;;;;;;;;
	ld [wCurEnemyLevel], a
	ld hl, wCompletedInGameTradeFlags
	ld a, [wWhichTrade]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	ld hl, ConnectCableText
	rst _PrintText
	ld a, [wWhichPokemon]
	push af
	ld a, [wCurEnemyLevel]
	push af
	call GetTradeMonPalette ; PureRGBnote: ADDED: stores whether mon you receive via trade has an alternate palette into wIsAltPalettePkmnData
	call LoadHpBarAndStatusTilePatterns
	call InGameTrade_PrepareTradeData
	predef InternalClockTradeAnim
	pop af
	ld [wCurEnemyLevel], a
	pop af
	ld [wWhichPokemon], a
	ld a, [wInGameTradeReceiveMonSpecies]
	ld [wCurPartySpecies], a
	xor a
	ld [wMonDataLocation], a ; not used
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	ld a, %10000000 ; prevent the player from naming the mon
	ld [wMonDataLocation], a
	call AddPartyMon
	call InGameTrade_CopyDataToReceivedMon
	callfar InGameTrade_CheckForTradeEvo
	call ClearScreen
	call InGameTrade_RestoreScreen
	farcall RedrawMapView
	and a
	ld a, TRADETEXT_THANKS
	jr .tradeSucceeded
.tradeFailed
	scf
.tradeSucceeded
	ld [wInGameTradeTextPointerTableIndex], a
	ld a, 0
	ld [wIsAltPalettePkmnData], a ; PureRGBnote: ADDED: clear any alt palette flags so the next pokemon we deal with won't be alt palette
	ret

GetTradeMonPalette:
	ld a, [wWhichTrade]
	ld hl, TradeMonPalettes
	cp 8
	jr c, .firstByte
	inc hl
	sub 8 ; PureRGBnote: if you have more than 16 in game trades this code will need to be updated.
.firstByte
	and a
	ld b, a
	ld a, [hl]
	jr z, .clearAndTestBit
.loopShiftRight ; keep shifting until the bit we want to test is bit 0
	srl a
	dec b
	jr nz, .loopShiftRight
.clearAndTestBit
	and 1 ; zero every other bit than bit 0
	ld [wIsAltPalettePkmnData], a ; a now contains the flag value for whether the palette is alt or original.
	ret

InGameTrade_RestoreScreen::
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call ReloadTilesetTilePatterns
	call LoadScreenTilesFromBuffer2
	call Delay3
	call LoadGBPal
	ld c, 10
	rst _DelayFrames
	farjp LoadWildData

InGameTrade_PrepareTradeData:
	ld hl, wTradedPlayerMonSpecies
	ld a, [wInGameTradeGiveMonSpecies]
	ld [hli], a ; wTradedPlayerMonSpecies
	ld a, [wInGameTradeReceiveMonSpecies]
	ld [hl], a ; wTradedEnemyMonSpecies
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wTradedPlayerMonOT
	ld bc, NAME_LENGTH
	call InGameTrade_CopyData
	ld hl, InGameTrade_TrainerString
	ld de, wTradedEnemyMonOT
	call InGameTrade_CopyData
	ld de, wLinkEnemyTrainerName
	call InGameTrade_CopyData
	ld hl, wPartyMon1OTID
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wTradedPlayerMonOTID
	ld bc, $2
	call InGameTrade_CopyData
	call Random
	ld hl, hRandomAdd
	ld de, wTradedEnemyMonOTID
	jp CopyData

InGameTrade_CopyData:
	push hl
	push bc
	rst _CopyData
	pop bc
	pop hl
	ret

InGameTrade_CopyDataToReceivedMon:
	ld hl, wPartyMonNicks
	ld bc, NAME_LENGTH
	call InGameTrade_GetReceivedMonPointer
	ld hl, wInGameTradeMonNick
	ld bc, NAME_LENGTH
	rst _CopyData
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call InGameTrade_GetReceivedMonPointer
	ld hl, InGameTrade_TrainerString
	ld bc, NAME_LENGTH
	rst _CopyData
	ld hl, wPartyMon1OTID
	ld bc, wPartyMon2 - wPartyMon1
	call InGameTrade_GetReceivedMonPointer
	ld hl, wTradedEnemyMonOTID
	ld bc, $2
	jp CopyData

; the received mon's index is (partyCount - 1),
; so this adds bc to hl (partyCount - 1) times and moves the result to de
InGameTrade_GetReceivedMonPointer:
	ld a, [wPartyCount]
	dec a
	call AddNTimes
	ld e, l
	ld d, h
	ret

InGameTrade_TrainerString:
	db "<TRAINER>@@@@@@@@@@"

InGameTradeTextPointers:
; entries correspond to TRADE_DIALOGSET_* constants
	table_width 2
;;; Aironfaar mod start: new trades, new tables and table contents
	dw TradeTextPointers1  ; JYNX Lola
	dw TradeTextPointers2  ; ELECTABUZZ Lightyear
	dw TradeTextPointers3  ; TANGELA Discombob
	dw TradeTextPointers4  ; BULBASAUR Bulbert
	dw TradeTextPointers5  ; SQUIRTLE Mirtle
	dw TradeTextPointers6  ; CHARMANDER Mandy
	dw TradeTextPointers7  ; GRAVELER Sylvester
	dw TradeTextPointers8  ; HAUNTER Blair
	dw TradeTextPointers9  ; MACHOKE Arnold
	dw TradeTextPointers10 ; KADABRA Liam
	dw TradeTextPointers11 ; MAGNETON SPROCKET
	dw TradeTextPointers12 ; Legendary Birds Roald, Lawrence, Nikola
	dw TradeTextPointers13 ; Mythical PKMN Enigma, Mirage
	assert_table_length NUM_TRADE_DIALOGSETS

TradeTextPointers1:
	table_width 2
	dw WannaTradeLolaText
	dw NoTradeLolaText
	dw WrongMonLolaText
	dw ThanksLolaText
	dw AfterTradeLolaText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers2:
	table_width 2
	dw WannaTradeLightyearText
	dw NoTradeLightyearText
	dw WrongMonLightyearText
	dw ThanksLightyearText
	dw AfterTradeLightyearText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers3:
	table_width 2
	dw WannaTradeDiscombobText
	dw NoTradeDiscombobText
	dw WrongMonDiscombobText
	dw ThanksDiscombobText
	dw AfterTradeDiscombobText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers4:
	table_width 2
	dw WannaTradeStarterText
	dw NoTradeStarterText
	dw WrongMonStarterText
	dw ThanksStarterText
	dw AfterTradeBulbertText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers5:
	table_width 2
	dw WannaTradeStarterText
	dw NoTradeStarterText
	dw WrongMonStarterText
	dw ThanksStarterText
	dw AfterTradeMirtleText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers6:
	table_width 2
	dw WannaTradeStarterText
	dw NoTradeStarterText
	dw WrongMonStarterText
	dw ThanksStarterText
	dw AfterTradeMandyText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers7:
	table_width 2
	dw WannaTradeSylvesterText
	dw NoTradeSylvesterText
	dw WrongMonSylvesterText
	dw ThanksSylvesterText
	dw AfterTradeSylvesterText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers8:
	table_width 2
	dw WannaTradeBlairText
	dw NoTradeBlairText
	dw WrongMonBlairText
	dw ThanksBlairText
	dw AfterTradeBlairText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers9:
	table_width 2
	dw WannaTradeArnoldText
	dw NoTradeArnoldText
	dw WrongMonArnoldText
	dw ThanksArnoldText
	dw AfterTradeArnoldText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers10:
	table_width 2
	dw WannaTradeLiamText
	dw NoTradeLiamText
	dw WrongMonLiamText
	dw ThanksLiamText
	dw AfterTradeLiamText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers11:
	table_width 2
	dw WannaTradeSprocketTextConcat
	dw NoTradeSprocketText
	dw WrongMonSprocketText
	dw ThanksSprocketText
	dw AfterTradeSprocketText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers12:
	table_width 2
	dw WannaTradeScientistText
	dw NoTradeScientistText
	dw WrongMonScientistTextConcat
	dw ThanksScientistText
	dw AfterTradeScientistText
	assert_table_length NUM_TRADE_TEXTS

TradeTextPointers13:
	table_width 2
    dw TradeMissingnoCryAskText
	dw TradeMissingnoCryText
	dw TradeMissingnoCryText
	dw TradeMissingnoCryExclaimText
	dw TradeMissingnoCryExclaimText
	assert_table_length NUM_TRADE_TEXTS
;;; Aironfaar mod end


ConnectCableText:
	text_far _ConnectCableText
	text_end

TradedForText:
	text_far _TradedForText
	sound_get_key_item
	text_pause
	text_end

;;; Aironfaar mod start: new trades, new trade dialogues
WrongMonWhatText:
    text_far _WrongMonWhatText
	text_promptbutton
    text_end

WrongMonHmmText:
    text_far _WrongMonHmmText
	text_promptbutton
    text_end

WrongMonOhText:
    text_far _WrongMonOhText
	text_promptbutton
    text_end

WrongMonHeyText:
    text_far _WrongMonHeyText
	text_promptbutton
    text_end

WannaTradeLolaText:
	text_far _WannaTradeLolaText
	text_end

NoTradeLolaText:
    text_far _NoTradeLolaText
	text_end

WrongMonLolaText:
    text_asm
	ld hl, WrongMonWhatText
	rst _PrintText
	ld hl, NoTradeLolaText
	rst _PrintText
	rst TextScriptEnd

ThanksLolaText:
    text_far _ThanksLolaText
	text_end

AfterTradeLolaText:
	text_far _AfterTradeLolaText
	text_end

WannaTradeLightyearText:
    text_far _WannaTradeLightyearText
	text_end

NoTradeLightyearText:
    text_far _NoTradeLightyearText
	text_end

WrongMonLightyearText:
    text_asm
	ld hl, WrongMonHmmText
	rst _PrintText
	ld hl, NoTradeLightyearText
	rst _PrintText
	rst TextScriptEnd

ThanksLightyearText:
    text_far _ThanksLightyearText
	text_end

AfterTradeLightyearText:
    text_far _AfterTradeLightyearText
	text_end

WannaTradeDiscombobText:
    text_far _WannaTradeDiscombobText
	text_end

NoTradeDiscombobText:
    text_far _NoTradeDiscombobText
	text_end

WrongMonDiscombobText:
    text_asm
	ld hl, WrongMonHeyText
	rst _PrintText
	ld hl, NoTradeDiscombobText
	rst _PrintText
	rst TextScriptEnd

ThanksDiscombobText:
    text_far _ThanksDiscombobText
	text_end

AfterTradeDiscombobText:
	text_far _AfterTradeDiscombobText
	text_end

WannaTradeStarterText:
    text_far _WannaTradeStarterText
	text_end

NoTradeStarterText:
    text_far _NoTradeStarterText
	text_end

WrongMonStarterText:
    text_far _WrongMonStarterText
	text_end

ThanksStarterText:
    text_far _ThanksStarterText
	text_end

AfterTradeBulbertText:
    text_far _AfterTradeBulbertText
	text_end

AfterTradeMirtleText:
    text_far _AfterTradeMirtleText
	text_end

AfterTradeMandyText:
    text_far _AfterTradeMandyText
	text_end

WannaTradeSylvesterText:
    text_far _WannaTradeSylvesterText
	text_end

NoTradeSylvesterText:
    text_far _NoTradeSylvesterText
	text_end

WrongMonSylvesterText:
    text_asm
	ld hl, WrongMonOhText
	rst _PrintText
	ld hl, NoTradeSylvesterText
	rst _PrintText
	rst TextScriptEnd

ThanksSylvesterText:
    text_far _ThanksSylvesterText
	text_end

AfterTradeSylvesterText:
	text_far _AfterTradeSylvesterText
	text_end

WannaTradeBlairText:
    text_far _WannaTradeBlairText
	text_end

NoTradeBlairText:
    text_far _NoTradeBlairText
	text_end

WrongMonBlairText:
    text_asm
	ld hl, WrongMonWhatText
	rst _PrintText
	ld hl, NoTradeBlairText
	rst _PrintText
	rst TextScriptEnd

ThanksBlairText:
    text_far _ThanksBlairText
	text_end

AfterTradeBlairText:
	text_far _AfterTradeBlairText
	text_end

WannaTradeArnoldText:
    text_far _WannaTradeArnoldText
	text_end

NoTradeArnoldText:
    text_far _NoTradeArnoldText
	text_end

WrongMonArnoldText:
    text_asm
	ld hl, WrongMonHeyText
	rst _PrintText
	ld hl, NoTradeArnoldText
	rst _PrintText
	rst TextScriptEnd

ThanksArnoldText:
    text_far _ThanksArnoldText
	text_end

AfterTradeArnoldText:
	text_far _AfterTradeArnoldText
	text_end

WannaTradeLiamText:
    text_far _WannaTradeLiamText
	text_end

NoTradeLiamText:
    text_far _NoTradeLiamText
	text_end

WrongMonLiamText:
    text_asm
	ld hl, WrongMonOhText
	rst _PrintText
	ld hl, NoTradeLiamText
	rst _PrintText
	rst TextScriptEnd

ThanksLiamText:
    text_far _ThanksLiamText
	text_end

AfterTradeLiamText:
	text_far _AfterTradeLiamText
	text_end

BeforeTradeSprocketText:
    text_far _CeruleanRocketHouseB1FBeforeTradeText
	text_promptbutton
	text_end

WannaTradeSprocketText:
    text_far _WannaTradeSprocketText
	text_end

WannaTradeSprocketTextConcat:
    text_asm
	ld hl, BeforeTradeSprocketText
	rst _PrintText
	ld hl, WannaTradeSprocketText
	rst _PrintText
	rst TextScriptEnd

NoTradeSprocketText:
    text_far _NoTradeSprocketText
	text_end

WrongMonSprocketText:
    text_far _WrongMonSprocketText
	text_end

WrongMonSprocketTextConcat:
    text_asm
	ld hl, WrongMonHmmText
	rst _PrintText
	ld hl, WrongMonSprocketText
	rst _PrintText
	rst TextScriptEnd

ThanksSprocketText:
    text_far _ThanksSprocketText
	text_promptbutton
	text_end

AfterTradeSprocketText:
    text_far _CeruleanRocketHouseB1FAfterTradeText
	text_end

WannaTradeScientistText:
    text_far _WannaTradeScientistText
	text_end

NoTradeScientistText:
    text_far _NoTradeScientistText
	text_end

WrongMonScientistText:
    text_far _WrongMonScientistText
	text_end

WrongMonScientistTextConcat:
    text_asm
	ld hl, WrongMonHmmText
	rst _PrintText
	ld hl, WrongMonScientistText
	rst _PrintText
	rst TextScriptEnd	
	
ThanksScientistText:
    text_far _ThanksScientistText
	text_end

AfterTradeScientistText:
    text_far _AfterTradeScientistText
	text_end

TradeMissingnoText:
    text_far _TradeMissingnoText
	text_end

TradeMissingnoExclaimText:
    text_far _TradeMissingnoExclaimText
	text_end

TradeMissingnoAskText:
    text_far _TradeMissingnoAskText
	text_end

TradeMissingnoCryText:
    text_asm
	ld hl, TradeMissingnoText
	rst _PrintText
	ld a, MISSINGNO
	call PlayCry
	rst TextScriptEnd

TradeMissingnoCryAskText:
    text_asm
	ld hl, TradeMissingnoAskText
	rst _PrintText
	ld a, 2
	ld [wFrequencyModifier], a
	ld a, $C0
	ld [wTempoModifier], a
	ld a, SFX_CRY_23
	rst _PlaySound
	rst TextScriptEnd

TradeMissingnoCryExclaimText:
    text_asm
	ld hl, TradeMissingnoExclaimText
	rst _PrintText
	ld a, 4
	ld [wFrequencyModifier], a
	ld a, $C0
	ld [wTempoModifier], a
	ld a, SFX_CRY_23
	rst _PlaySound
	rst TextScriptEnd
;;; Aironfaar mod end