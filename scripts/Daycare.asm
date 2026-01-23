Daycare_Script:
	jp EnableAutoTextBoxDrawing

Daycare_TextPointers:
	def_text_pointers
	dw_const MoveReminderText, TEXT_MOVEREMINDER ; Aironfaar mod: Move Reminder
	dw_const DaycareText, TEXT_DAYCARE ; Aironfaar mod: swap positions, different sprite, so no mention of Gentleman anymore

DaycareText: ; Aironfaar mod: renamed all instances of DaycareGentleman in file to Daycare, uses a different sprite now
	text_asm
	call SaveScreenTilesToBuffer2
	ld a, [wDayCareInUse]
	and a
	jp nz, .daycareInUse
	ld hl, .IntroText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .DontBeShyText
	jp nz, .done
	ld a, [wPartyCount]
	dec a
	ld hl, .OnlyHaveOneMonText
	jp z, .done
	ld hl, .WhichMonText
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
	ld hl, .AllRightThenText
	jp c, .done
	; callfar KnowsHMMove ; PureRGBnote: CHANGED: pokemon are never considered to have HM moves so the restrictions are gone
	; ld hl, .CantAcceptMonWithHMText
	; jp c, .done
	xor a
	ld [wPartyAndBillsPCSavedMenuItem], a
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, .WillLookAfterMonText
	rst _PrintText
	ld a, 1
	ld [wDayCareInUse], a
	ld a, PARTY_TO_DAYCARE
	ld [wMoveMonType], a
	call MoveMon
	xor a
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	ld a, [wCurPartySpecies]
	call PlayCry
	ld hl, .ComeSeeMeInAWhileText
	jp .done

.daycareInUse
	xor a
	ld hl, wDayCareMonName
	call GetPartyMonName
	ld a, DAYCARE_DATA
	ld [wMonDataLocation], a
	call LoadMonData
	callfar CalcLevelFromExperience
	ld a, d
	cp MAX_LEVEL
	jr c, .skipCalcExp

	ld d, MAX_LEVEL
	callfar CalcExperience
	ld hl, wDayCareMonExp
	ldh a, [hExperience]
	ld [hli], a
	ldh a, [hExperience + 1]
	ld [hli], a
	ldh a, [hExperience + 2]
	ld [hl], a
	ld d, MAX_LEVEL

.skipCalcExp
	xor a
	ld [wDayCareNumLevelsGrown], a
	ld hl, wDayCareMonBoxLevel
	ld a, [hl]
	ld [wDayCareStartLevel], a
	cp d
	ld [hl], d
	ld hl, .MonNeedsMoreTimeText
	jr z, .next
	ld a, [wDayCareStartLevel]
	ld b, a
	ld a, d
	sub b
	ld [wDayCareNumLevelsGrown], a
	ld hl, .MonHasGrownText

.next
	rst _PrintText
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	ld hl, .NoRoomForMonText
	jp z, .leaveMonInDayCare
	ld de, wDayCareTotalCost
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld hl, wDayCarePerLevelCost
	ld a, $1
	ld [hli], a
	ld [hl], $0
	ld a, [wDayCareNumLevelsGrown]
	inc a
	ld b, a
	ld c, 2
.calcPriceLoop
	push hl
	push de
	push bc
	predef AddBCDPredef
	pop bc
	pop de
	pop hl
	dec b
	jr nz, .calcPriceLoop
	ld hl, .OweMoneyText
	rst _PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld hl, .AllRightThenText
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .leaveMonInDayCare
	ld hl, wDayCareTotalCost
	ldh [hMoney], a
	ld a, [hli]
	ldh [hMoney + 1], a
	ld a, [hl]
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NotEnoughMoneyText
	jp .leaveMonInDayCare

.enoughMoney
	xor a
	ld [wDayCareInUse], a
	ld hl, wDayCareNumLevelsGrown
	ld [hli], a
	inc hl
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, .HeresYourMonText
	rst _PrintText
	ld a, DAYCARE_TO_PARTY
	ld [wMoveMonType], a
	call MoveMon
	ld a, [wDayCareMonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wPartyCount]
	dec a
	push af
	ld bc, wPartyMon2 - wPartyMon1
	push bc
	ld hl, wPartyMon1Moves
	call AddNTimes
	ld d, h
	ld e, l
	ld a, 1
	ld [wLearningMovesFromDayCare], a
	predef WriteMonMoves
	pop bc
	pop af

; set mon's HP to max
	ld hl, wPartyMon1HP
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, wPartyMon1MaxHP - wPartyMon1HP
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	ld a, [wCurPartySpecies]
	call PlayCry
	ld hl, .GotMonBackText
	jr .done

.leaveMonInDayCare
	ld a, [wDayCareStartLevel]
	ld [wDayCareMonBoxLevel], a

.done
	rst _PrintText
	rst TextScriptEnd

.IntroText:
	text_far _DaycareIntroText
	text_end

.WhichMonText:
	text_far _DaycareWhichMonText
	text_end

.WillLookAfterMonText:
	text_far _DaycareWillLookAfterMonText
	text_end

.ComeSeeMeInAWhileText:
	text_far _DaycareComeSeeMeInAWhileText
	text_end

.MonHasGrownText:
	text_far _DaycareMonHasGrownText
	text_end

.OweMoneyText:
	text_far _DaycareOweMoneyText
	text_end

.GotMonBackText:
	text_far _DaycareGotMonBackText
	text_end

.MonNeedsMoreTimeText:
	text_far _DaycareMonNeedsMoreTimeText
	text_end

.DontBeShyText:
	text_far _DaycareDontBeShyText
	text_far _DaycareComeAgainText
	text_end

.AllRightThenText:
	text_far _DaycareAllRightThenText
	text_far _DaycareComeAgainText
	text_end

.NoRoomForMonText:
	text_far _DaycareNoRoomForMonText
	text_end

.OnlyHaveOneMonText:
	text_far _DaycareOnlyHaveOneMonText
	text_end

;.CantAcceptMonWithHMText:
;	text_far _DaycareCantAcceptMonWithHMText
;	text_end

.HeresYourMonText:
	text_far _DaycareHeresYourMonText
	text_end

.NotEnoughMoneyText:
	text_far _DaycareNotEnoughMoneyText
	text_end

;;; Aironfaar mod start: Move Reminder stuff
MoveReminderText:
	text_asm
	call SaveScreenTilesToBuffer2
	ld hl, .ReminderGreetingText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .bye
	; check for player money (5000)
	xor a
	ld [hMoney], a
	ld [hMoney + 2], a
	ld a, $50
	ld [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .ReminderNotEnoughMoneyText
	jp .exit
.enoughMoney
	ld hl, .ReminderSaidYesText
	rst _PrintText
	xor a
	ld [wListScrollOffset], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jp c, .bye
	ld a, [wWhichPokemon]
	ld b, a
	push bc
	ld hl, WriteReminderMoveList
	ld b, BANK(WriteReminderMoveList)
	rst _Bankswitch
	ld a, [wMoveReminderList]
	and a
	jr nz, .chooseMove
	pop bc
	ld hl, .ReminderNoMovesText
	jp .exit
.chooseMove
	ld hl, .ReminderWhichMoveText
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, MOVESLISTMENU
	ld [wListMenuID], a
	ld de, wMoveReminderList
	ld hl, wListPointer
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld [wPrintItemPrices], a ; don't print prices
	call DisplayListMenuID
	pop bc
	jr c, .bye
	push bc
	ld a, [wCurListMenuItem]
	ld [wMoveNum], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	pop bc
	ld a, b
	ld [wWhichPokemon], a
	ld a, [wLetterPrintingDelayFlags]
	push af
	xor a
	ld [wLetterPrintingDelayFlags], a
	predef LearnMove
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, b
	and a
	jr z, .bye
	; charge money (5000)
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $50
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
.bye
	ld hl, .ReminderByeText
.exit
	rst _PrintText
	rst TextScriptEnd

.ReminderGreetingText:
	text_far _MoveReminderGreetingText
	text_end

.ReminderSaidYesText:
	text_far _MoveReminderSaidYesText
	text_end

.ReminderNotEnoughMoneyText:
	text_far _MoveReminderNotEnoughMoneyText
	text_end

.ReminderWhichMoveText:
	text_far _MoveReminderWhichMoveText
	text_end

.ReminderByeText:
	text_far _MoveReminderByeText
	text_end

.ReminderNoMovesText:
	text_far _MoveReminderNoMovesText
	text_end
;;; Aironfaar mod end