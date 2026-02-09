OaksAideScript:
	call OaksAideCheckAllTurnedIn
	jp c, .researchDone
	ld hl, OaksAideGreetingText
	rst _PrintText
	ldh a, [hOaksAideRewardItem]
	cp BOOSTER_CHIP
	ld hl, OaksAidePreparingText
	jr z, .checkForItemfinder
	jr c, .checkForFlash
	jr .menuLoop
.checkForItemfinder
	CheckEvent EVENT_GOT_ITEMFINDER
	jr nz, .menuLoop
	rst _PrintText
	ld hl, OaksAideRoute15ColleagueRoute11Text
	rst _PrintText
	ret
.checkForFlash
	CheckEvent EVENT_GOT_HM05
	jr nz, .menuLoop
	rst _PrintText
	ld hl, OaksAideRoute11ColleagueRoute2Text
	rst _PrintText
	ret
.menuLoopPrint
	rst _PrintText
.menuLoop
	call SaveScreenTilesToBuffer2
	ld hl, OaksAideResponseMenu
	ld b, A_BUTTON
	call DisplayMultiChoiceTextBox
	call LoadScreenTilesFromBuffer2
	ld a, [wCurrentMenuItem]
	and a
	jr z, .tellMeMore
	dec a
	jr z, .canIHelp
	dec a
	jr z, .thisIsForYou
.seeYouLater
	ld hl, OaksAideComeBackText
	rst _PrintText
	ret
.tellMeMore
	ldh a, [hOaksAideRewardItem]
	cp BOOSTER_CHIP
	ld hl, OaksAideRoute15CurrentResearchText
	jr z, .printCurrentResearch
	ld hl, OaksAideRoute11CurrentResearchText
	jr c, .printCurrentResearch
	ld hl, OaksAideRoute2CurrentResearchText
.printCurrentResearch
	rst _PrintText
	call OaksAideGetRewardItemName
	ld hl, OaksAideIfYouAssistText
	rst _PrintText
	ldh a, [hOaksAideRewardItem]
	cp BOOSTER_CHIP
	ld hl, OaksAideRoute15YouHelpedText
	jr z, .menuLoopPrint
	ld hl, OaksAideRoute11YouHelpedText
	jr c, .menuLoopPrint
	jr .menuLoop
.canIHelp
	ld hl, OaksAideNeedMonsText
	rst _PrintText
	ldh a, [hOaksAideRewardItem]
	cp BOOSTER_CHIP
	ld hl, OaksAideRoute15MonList
	jr z, .canIHelpContinue
	ld hl, OaksAideRoute11MonList
	jr c, .canIHelpContinue
	ld hl, OaksAideRoute2MonList
.canIHelpContinue
	ld b, 2
	xor a
	jr .canIHelpLoop
.canIHelpSkip
	inc hl
.canIHelpNext
	inc hl ; hl now contains pointer to next mon ID
	ld a, [hl]
	and a
	jr z, .menuLoop ; reached end of mon list
	sla b
.canIHelpLoop
	ldh a, [hOaksAideEventFlags]
	and b
	ld a, [hli] ; mon ID
	jr nz, .canIHelpSkip ; already turned this mon in
	push bc
	push hl
	call DisplayPokedex
	call LoadScreenTilesFromBuffer2
	pop hl
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a ; hl now contains pointer to mon text
	rst _PrintText
	pop hl
	pop bc
	jr .canIHelpNext	
.thisIsForYou
	ld a, [wPartyCount]
	dec a
	jr nz, .moreThanOne
	ld hl, OaksAideOnlyOneMonText
	jp .menuLoopPrint
.moreThanOne
	ld hl, OaksAideWhichMonText
	rst _PrintText
	xor a
	ld [wUpdateSpritesEnabled], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jp c, .seeYouLater
	ldh a, [hOaksAideRewardItem]
	cp BOOSTER_CHIP
	ld hl, OaksAideRoute15MonList
	jr z, .turnInContinue
	ld hl, OaksAideRoute11MonList
	jr c, .turnInContinue
	ld hl, OaksAideRoute2MonList
.turnInContinue
	ld a, [wCurPartySpecies]
	ld c, a
	ld b, 2
	ld a, [hli]
.turnInLoop
	cp c
	jr z, .confirmSpecies
	sla b
	inc hl
	inc hl
	ld a, [hli]
	and a
	jr nz, .turnInLoop
.wrongMon
	ld hl, OaksAideIncorrectMonText
	jp .menuLoopPrint
.confirmSpecies
	ldh a, [hOaksAideEventFlags]
	and b
	jr nz, .wrongMon
	ldh a, [hOaksAideEventFlags]
	add b
	ldh [hOaksAideEventFlags], a
	ldh a, [hOaksAideChangeFlags]
	add b
	ldh [hOaksAideChangeFlags], a
	ld hl, OaksAideAppreciateAssistanceText
	rst _PrintText
	xor a
	ld [wPartyAndBillsPCSavedMenuItem], a
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	ld a, [wCurPartySpecies]
	call PlayCry
	call WaitForSoundToFinish
	call OaksAideCheckAllTurnedIn
	jr c, .researchDone
	jp .menuLoop
.researchDone
	ld hl, OaksAideDoneText
	rst _PrintText
	ldh a, [hOaksAideRewardItem]
	ld b, a
	ld c, 1
	call GiveItem
	jr c, .itemReceived
	call OaksAideGetRewardItemName
	ld hl, OaksAideNoRoomText
	rst _PrintText
	ret
.itemReceived
	ldh a, [hOaksAideChangeFlags]
	add 1
	ldh [hOaksAideChangeFlags], a
	call OaksAideGetRewardItemName
	ld hl, OaksAideGotItemText
	rst _PrintText
	ret

OaksAideCheckAllTurnedIn:
	ldh a, [hOaksAideRewardItem]
	cp BOOSTER_CHIP
	ld hl, OaksAideRoute15MonList+1
	jr z, .continue
	ld hl, OaksAideRoute11MonList+1
	jr c, .continue
	ld hl, OaksAideRoute2MonList+1
.continue
	ld b, 2
.loop
	ldh a, [hOaksAideEventFlags]
	and b
	jr z, .notDone
	sla b
	inc hl
	inc hl
	ld a, [hli]
	and a
	jr nz, .loop
	scf ; done, so set carry flag
	ret
.notDone
	xor a ; not done, so clear carry flag
	ret

OaksAideGetRewardItemName:
	ldh a, [hOaksAideRewardItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wNameBuffer
	ld de, wOaksAideRewardItemName
	ld bc, ITEM_NAME_LENGTH
	rst _CopyData
	ret

OaksAideRoute2MonList:
	dbw MEOWTH, OaksAideRoute2FirstText
	dbw VENONAT, OaksAideRoute2SecondText
	dbw ZUBAT, OaksAideRoute2ThirdText
	dbw EXEGGCUTE, OaksAideRoute2FourthText
	db 0

OaksAideRoute11MonList:
	dbw FARFETCHD, OaksAideRoute11FirstText
	dbw PIKACHU, OaksAideRoute11SecondText
	dbw PINSIR, OaksAideRoute11ThirdText
	dbw MAGIKARP, OaksAideRoute11FourthText
	db 0

OaksAideRoute15MonList:
	dbw CHANSEY, OaksAideRoute15FirstText
	dbw RHYDON, OaksAideRoute15SecondText
	db 0

OaksAidePreparingText:
	text_far _OaksAidePreparingText
	text_end
OaksAideRoute15ColleagueRoute11Text:
	text_far _Route15Gate2FOaksAideRoute11Text
	text_end
OaksAideRoute11ColleagueRoute2Text:
	text_far _Route11Gate2FOaksAideRoute2Text
	text_end
OaksAideGreetingText:
	text_far _OaksAideGreetingText
	text_end
OaksAideComeBackText:
	text_far _OaksAideComeBackText
	text_end
OaksAideRoute2CurrentResearchText:
	text_far _Route2GateOaksAideCurrentResearchText
	text_end
OaksAideRoute11CurrentResearchText:
	text_far _Route11Gate2FOaksAideCurrentResearchText
	text_end
OaksAideRoute11YouHelpedText:
	text_far _Route11Gate2FOaksAideYouHelpedText
	text_end
OaksAideRoute15CurrentResearchText:
	text_far _Route15Gate2FOaksAideCurrentResearchText
	text_end
OaksAideRoute15YouHelpedText:
	text_far _Route15Gate2FOaksAideYouHelpedText
	text_end
OaksAideIfYouAssistText:
	text_far _OaksAideHelpMeText
	text_end
OaksAideNeedMonsText:
	text_far _OaksAideNeedMonsText
	text_end
OaksAideRoute2FirstText:
	text_far _Route2GateOaksAideMeowthText
	text_end
OaksAideRoute2SecondText:
	text_far _Route2GateOaksAideVenonatText
	text_end
OaksAideRoute2ThirdText:
	text_far _Route2GateOaksAideZubatText
	text_end
OaksAideRoute2FourthText:
	text_far _Route2GateOaksAideExeggcuteText
	text_end
OaksAideRoute11FirstText:
	text_far _Route11Gate2FOaksAideFarfetchdText
	text_end
OaksAideRoute11SecondText:
	text_far _Route11Gate2FOaksAidePikachuText
	text_end
OaksAideRoute11ThirdText:
	text_far _Route11Gate2FOaksAidePinsirText
	text_end
OaksAideRoute11FourthText:
	text_far _Route11Gate2FOaksAideMagikarpText
	text_end
OaksAideRoute15FirstText:
	text_far _Route15Gate2FOaksAideChanseyText
	text_end
OaksAideRoute15SecondText:
	text_far _Route15Gate2FOaksAideRhydonText
	text_end
OaksAideOnlyOneMonText:
	text_far _DaycareOnlyHaveOneMonText
	text_end
OaksAideWhichMonText:
	text_far _OaksAideWhichMonText
	text_end
OaksAideAppreciateAssistanceText:
	text_far _OaksAideAppreciateAssistanceText
	text_end
OaksAideIncorrectMonText:
	text_far _OaksAideIncorrectMonText
	text_end
OaksAideDoneText:
	text_far _OaksAideDoneText
	text_end
OaksAideNoRoomText:
	text_far _OaksAideNoRoomText
	text_end
OaksAideGotItemText:
	text_far _OaksAideGotItemText
	sound_get_item_1
	text_end
