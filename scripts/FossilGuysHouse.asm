; PureRGBnote: ADDED: new house in saffron city. The super nerd from Mt Moon returns and will teleport to cinnabar with his teleporter
; in order to revive fossils for you early. There is also a bunch of amusing text to read in his house.
; PureRGBnote: ADDED: this map is also used for the MOVE MYSTIC's house and scripts.
FossilGuysHouse_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	jr z, .skip
	; on map load
	ResetEvent EVENT_TALKED_TO_MOVE_MYSTIC_ONCE
.skip
	jp EnableAutoTextBoxDrawing


FossilGuysHouse_TextPointers:
	def_text_pointers
	dw_const FossilGuysHouseFossilGuyText,   TEXT_FOSSILGUYSHOUSE_FOSSIL_GUY
	dw_const FossilGuysHouseCatText,         TEXT_FOSSILGUYSHOUSE_MEOWTH
	dw_const FossilGuysHousePaperText,       TEXT_FOSSILGUYSHOUSE_PAPER
	dw_const FossilGuysHouseRockText,        TEXT_FOSSILGUYSHOUSE_ROCK
	dw_const DoRet,                          TEXT_MOVE_MYSTIC
	dw_const MoveMysticCrystalBallText,      TEXT_MOVE_MYSTIC_CRYSTAL_BALL
	dw_const FossilGuysHouseTeleporterText,  TEXT_FOSSILGUYSHOUSE_TELEPORTER1
	dw_const FossilGuysHouseTeleporterText,  TEXT_FOSSILGUYSHOUSE_TELEPORTER2
	dw_const FossilGuysHousePosterText,      TEXT_FOSSILGUYSHOUSE_POSTER
	dw_const FossilGuysHouseDeskText,        TEXT_FOSSILGUYSHOUSE_DESK

;;; Aironfaar mod start: Fossil Guy now offers "fossil shuttle service" if you pay for teleporter repairs
FossilGuysHouseFossilGuyText:
	text_asm
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jp z, .neverMet
	CheckEvent EVENT_SUPER_NERD_GOING_TO_CINNABAR
	jp nz, .comeBackLater
	CheckEvent EVENT_RECEIVED_AERODACTYL_FROM_SUPER_NERD
	jp nz, .stageThreeStart
	CheckEvent EVENT_GAVE_OLD_AMBER_TO_SUPER_NERD
	jp nz, .doneRevivedAmber
	CheckEvent EVENT_RECEIVED_FOSSIL_PKMN_FROM_SUPER_NERD
	jp nz, .stageTwoStart
	CheckEvent EVENT_SKIP_FOSSIL_GUY_GREETING
	jr nz, .skip
	ld hl, FossilGuyGreeting
	rst _PrintText
.skip
	CheckEvent EVENT_GAVE_FOSSIL_TO_SUPER_NERD
	jr nz, .doneRevivedFossil
.stageOneStart
	CheckEvent EVENT_SEAFOAM_FOUND_OTHER_FOSSIL
	jp nz, .stageThreeStart
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr nz, .checkHelix
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .checkDome
.noFossil
	ld hl, FossilGuyWhereFossilText
	jp .donePrint
.checkHelix
	ld b, HELIX_FOSSIL
	jr .checkItemFossil
.checkDome
	ld b, DOME_FOSSIL
.checkItemFossil
	predef GetIndexOfItemInBag
	ld a, b
	cp $FF ; not in bag
	jr z, .noFossil
	push bc
	ld hl, FossilGuyHaveFossil
	rst _PrintText
	call YesNoChoice
	pop bc
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .suitYourself
.removeItem
	ld a, b
	ld [wWhichPokemon], a ; load item index to be removed
	ld hl, wNumBagItems
	ld a, 1 ; one item
	ld [wItemQuantity], a
	call RemoveItemFromInventory
	SetEvents EVENT_GAVE_FOSSIL_TO_SUPER_NERD, EVENT_SUPER_NERD_GOING_TO_CINNABAR, EVENT_SKIP_FOSSIL_GUY_GREETING
	ld hl, FossilGuyGaveFossil
	jp .donePrint
.suitYourself
	ld hl, FossilGuyDenied
	jp .donePrint
.doneRevivedFossil
	ld hl, FossilGuyCameBackFossil
	rst _PrintText
	CheckEvent EVENT_GOT_DOME_FOSSIL
	ld a, KABUTO
	jr nz, .finishGiveFossil
	ld a, OMANYTE
.finishGiveFossil
	ld b, a
	ld c, 24
	call GivePokemonRandomPalette
	jp nc, .done
	SetEvent EVENT_RECEIVED_FOSSIL_PKMN_FROM_SUPER_NERD
	ResetEvent EVENT_SKIP_FOSSIL_GUY_GREETING
	jp .done
.stageTwoStart
	ld b, OLD_AMBER
	predef GetIndexOfItemInBag
	ld a, b
	cp $FF ; not in bag
	jp z, .greetingEnd
	push bc
	ld hl, FossilGuyHaveAmber
	rst _PrintText
	call YesNoChoice
	pop bc
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .suitYourself
.removeAmber
	ld a, b
	ld [wWhichPokemon], a ; load item index to be removed
	ld hl, wNumBagItems
	ld a, 1 ; one item
	ld [wItemQuantity], a
	call RemoveItemFromInventory
	SetEvents EVENT_GAVE_OLD_AMBER_TO_SUPER_NERD, EVENT_SUPER_NERD_GOING_TO_CINNABAR
	ld hl, FossilGuyGaveAmber
	jp .donePrint
.doneRevivedAmber
	ld hl, FossilGuyCameBackAmber
	rst _PrintText
	lb bc, AERODACTYL, 24
	call GivePokemonRandomPalette
	jp nc, .done
	SetEvent EVENT_RECEIVED_AERODACTYL_FROM_SUPER_NERD
	jp .done
.stageThreeStart
	ld c, 24
	CheckEvent EVENT_FOSSIL_GUY_DOME_SHUTTLE
	ld b, KABUTO
	jr nz, .giveRevivedMon
	CheckEvent EVENT_FOSSIL_GUY_HELIX_SHUTTLE
	ld b, OMANYTE
	jr nz, .giveRevivedMon
	CheckEvent EVENT_FOSSIL_GUY_AMBER_SHUTTLE
	ld b, AERODACTYL
	jr z, .noRevivedMonPending
.giveRevivedMon
	push bc
	ld hl, FossilGuyCameBackAmber
	rst _PrintText
	pop bc
	call GivePokemonRandomPalette
	jp nc, .done
	ResetEvents EVENT_FOSSIL_GUY_DOME_SHUTTLE, EVENT_FOSSIL_GUY_HELIX_SHUTTLE, EVENT_FOSSIL_GUY_AMBER_SHUTTLE
	jp .done
.noRevivedMonPending
	call FossilGuy_GetFossilsInBag
	ld a, [wFilteredBagItemsCount]
	and a
	ld hl, FossilGuyEndText
	jp z, .donePrint ; no fossils in bag
	ld hl, FossilGuyGoToCinnabarText
	rst _PrintText
	call DisplayTextPromptButton
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, FossilGuyRepairPriceText
	rst _PrintText
	ld a, 0
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .saidYes
.goThereYourself
	ld hl, FossilGuyGoThereYourselfText
	jp .donePrint
.saidYes
	; check for money (20000)
	xor a
	ld [hMoney + 2], a
	ld [hMoney + 1], a
	ld a, $2
	ld [hMoney], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, FossilGuyNotEnoughMoneyText
	jp .donePrint
.enoughMoney
	ld hl, FossilGuyWhichFossilText
	rst _PrintText
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	xor a
	ld [wCurrentMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, [wFilteredBagItemsCount]
	dec a
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	ld a, [wFilteredBagItemsCount]
	dec a
	ld bc, 2
	ld hl, 3
	call AddNTimes
	dec l
	ld b, l
	ld c, $d
	hlcoord 0, 0
	call TextBoxBorder
	call UpdateSprites
	call FossilGuy_PrintFossilsInBag
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jr nz, .goThereYourself
	ld hl, wFilteredBagItems
	ld a, [wCurrentMenuItem]
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ldh [hItemToRemoveID], a
	cp DOME_FOSSIL
	jr nz, .notDome
	SetEvents EVENT_FOSSIL_GUY_DOME_SHUTTLE, EVENT_SUPER_NERD_GOING_TO_CINNABAR
	jr .removeFossil
.notDome
	cp HELIX_FOSSIL
	jr nz, .notHelix
	SetEvents EVENT_FOSSIL_GUY_HELIX_SHUTTLE, EVENT_SUPER_NERD_GOING_TO_CINNABAR
	jr .removeFossil
.notHelix
	SetEvents EVENT_FOSSIL_GUY_AMBER_SHUTTLE, EVENT_SUPER_NERD_GOING_TO_CINNABAR
	jr .removeFossil
.removeFossil
	farcall RemoveItemByID
	xor a
	ld [wPriceTemp + 2], a
	ld [wPriceTemp + 1], a
	ld a, $2
	ld [wPriceTemp], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld hl, FossilGuyStartRepairsText
	jr .donePrint
.neverMet
	ld hl, FossilGuyNeverMet
	jr .donePrint
.comeBackLater
	ld hl, FossilGuyComeBackLater
	jr .donePrint
.greetingEnd
	ld hl, FossilGuyGreetingEnd
.donePrint
	rst _PrintText
.done
	rst TextScriptEnd

; Conversation text

FossilGuyGreeting:
	text_far _FossilGuyGreeting
	text_end

FossilGuyGreetingEnd:
	text_far _FossilGuyGreetingEnd
	text_end

FossilGuyComeBackLater:
	text_far _FossilGuyComeBackLater
	text_end

FossilGuyNeverMet:
	text_far _FossilGuyNeverMet
	text_end

FossilGuyWhereFossilText:
	text_far _FossilGuyWhereFossilText
	text_end

FossilGuyHaveFossil:
	text_far _FossilGuyHaveFossil
	text_end

FossilGuyDenied:
	text_far _FossilGuyDenied
	text_end

FossilGuyGaveFossil:
	text_far _FossilGuyGaveFossil
	text_end

FossilGuyCameBackFossil:
	text_far _FossilGuyCameBackFossil
	text_end

FossilGuyHaveAmber:
	text_far _FossilGuyHaveOldAmber
	text_end

FossilGuyGaveAmber:
	text_far _FossilGuyGiveOldAmber
	text_end

FossilGuyCameBackAmber:
	text_far _FossilGuyGiveAerodactyl
	text_end

FossilGuyEndText:
	text_far _FossilGuyEndingText
	text_end

FossilGuyGoToCinnabarText:
	text_far _FossilGuyGoToCinnabarText
	text_end

FossilGuyRepairPriceText:
	text_far _FossilGuyRepairPriceText
	text_end

FossilGuyWhichFossilText:
	text_far _FossilGuyWhichFossilText
	text_end

FossilGuyNotEnoughMoneyText:
	text_far _FossilGuyNotEnoughMoneyText
	text_end

FossilGuyGoThereYourselfText:
	text_far _FossilGuyGoThereYourselfText
	text_end

FossilGuyStartRepairsText:
	text_far _FossilGuyStartRepairsText
	text_end

FossilGuy_GetFossilsInBag:
; construct a list of all fossils in the player's bag
	xor a
	ld [wFilteredBagItemsCount], a
	ld de, wFilteredBagItems
	ld hl, FossilGuy_FossilsList
.loop
	ld a, [hli]
	and a
	jr z, .done
	push hl
	push de
	ld [wTempByteValue], a
	ld b, a
	predef GetQuantityOfItemInBag
	pop de
	pop hl
	ld a, b
	and a
	jr z, .loop
	; A fossil is in the bag
	ld a, [wTempByteValue]
	ld [de], a
	inc de
	push hl
	ld hl, wFilteredBagItemsCount
	inc [hl]
	pop hl
	jr .loop
.done
	ld a, $ff
	ld [de], a
	ret

FossilGuy_FossilsList:
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	db 0 ; end

FossilGuy_PrintFossilsInBag:
	ld hl, wFilteredBagItems
	xor a
	ldh [hItemCounter], a
.loop
	ld a, [hli]
	cp $ff
	ret z
	push hl
	ld [wNamedObjectIndex], a
	call GetItemName
	hlcoord 2, 2
	ldh a, [hItemCounter]
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld de, wNameBuffer
	call PlaceString
	ld hl, hItemCounter
	inc [hl]
	pop hl
	jr .loop
;;; Aironfaar mod end

; cat text

FossilGuysHouseCatText:
	text_asm
	CheckEvent EVENT_MET_FOSSIL_GUYS_CAT
	jr nz, .metCatAlready
	SetEvent EVENT_MET_FOSSIL_GUYS_CAT
	ld hl, FossilGuysHouseCatText1
	rst _PrintText
	call FossilGuyFacesPlayerDirection
	ld hl, FossilGuysHouseCatText2
	jr .done
.metCatAlready
	ld hl, FossilGuysHouseCatText3
	rst _PrintText
	call FossilGuyFacesPlayerDirection
	ld hl, FossilGuysHouseCatText4
.done
	rst _PrintText
	rst TextScriptEnd

; makes fossil guy face the player
FossilGuyFacesPlayerDirection:
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, [wXCoord]
	cp 1
	jr z, .checkYcoord
	and a
	ld a, SPRITE_FACING_LEFT
	jr z, .doFacing
	ld a, SPRITE_FACING_RIGHT
	jr .doFacing
.checkYcoord
	ld a, [wYCoord]
	cp 4
	ret c ; don't need to change facing if facing up is the best option
	ld a, SPRITE_FACING_DOWN
.doFacing
  	ldh [hSpriteFacingDirection], a
  	jp SetSpriteFacingDirection	

FossilGuysHouseCatText1:
	text_far _CeladonMansion1FMeowthText
	text_asm
.MeowthCry
	ld a, MEOWTH
	call PlayCry
	call DisplayTextPromptButton
	rst TextScriptEnd

FossilGuysHouseCatText2:
	text_far _FossilGuysCat2
	text_end

FossilGuysHouseCatText3:
	text_far _FossilGuysCat1
	text_asm
	jr FossilGuysHouseCatText1.MeowthCry

FossilGuysHouseCatText4:
	text_far _FossilGuysCat3
	text_end

; sign/house object text

FossilGuysHousePaperText:
	text_asm
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jr z, .done
	ld hl, FossilGuysPaperText
	rst _PrintText
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	ld hl, FossilGuysKabutoText
	jr nz, .print
	ld hl, FossilGuysOmanyteText
.print
	rst _PrintText
.done
	rst TextScriptEnd

FossilGuysPaperText:
	text_far _FossilGuysPaperText
	text_end

FossilGuysKabutoText:
	text_far _FossilGuysPaperTextKabuto
	text_end

FossilGuysOmanyteText:
	text_far _FossilGuysPaperTextOmanyte
	text_end

FossilGuysHouseRockText:
	text_far _FossilGuysRock
	text_end

FossilGuysHouseTeleporterText:
	text_far _FossilGuysTeleporterText
	text_end

FossilGuysHousePosterText:
	text_far _FossilGuysPosterText
	text_end

FossilGuysHouseDeskText:
	text_far _FossilGuysDesk
	text_end
	
MoveMysticCrystalBallText:
	text_asm
	call SaveScreenTilesToBuffer2
	CheckAndSetEvent EVENT_TALKED_TO_MOVE_MYSTIC_ONCE
	jr nz, .talkedOnce
	CheckAndSetEvent EVENT_MET_MOVE_MYSTIC
	ld hl, .MoveMysticAgain
	jr nz, .met
	ld hl, .MoveMysticIntro
.met
	rst _PrintText
.talkedOnce
	ld hl, .MoveMysticQuestion
	rst _PrintText
	ld a, [wListScrollOffset]
	push af ; save list scroll offset to preserve item list index
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.loop
	call FormulateMoveMysticMonList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld [wListMenuCustomType], a
	ld [wListMenuHoverTextType], a
	ld a, CUSTOMLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jp c, .comeAgain
	ld hl, wItemList + 1
	ld d, 0
	ld a, [wChosenMenuItem]
	ld e, a
	ld a, [wListScrollOffset]
	add e
	ld e, a
	add hl, de
	ld a, [hl] ; chosen mon
	push af
	ld [wNamedObjectIndex], a
	call GetMonName
	call CopyToStringBuffer
	pop af
	ld b, a
	push bc
	ld hl, MoveMysticMonsList
	ld de, 4
	call IsInArray
	pop bc
	jp nc, .comeAgain
	push bc
	inc hl
	inc hl
	hl_deref ; hl = text specific to the mon chosen
	push hl
	call LoadScreenTilesFromBuffer2
	ld hl, .lookdeep
	rst _PrintText
	call WaitForSoundToFinish
	; start the "crystal ball" animation
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld a, $FF
	ld [wUpdateSpritesEnabled], a
	ld a, [wAudioROMBank]
	push af
	ld a, BANK(SFX_Psybeam)
	ld [wAudioROMBank], a
	xor a
	ld [wFrequencyModifier], a
	ld [wTempoModifier], a
	ld a, SFX_PSYBEAM
	rst _PlaySound
	ld a, 4
	call .sparkleCrystalBall
	ld a, 5
	call .sparkleCrystalBall
	ld a, SFX_POUND
	rst _PlaySound ; by playing this short sound we can end the psybeam sound effect early
	call WaitForSoundToFinish
	pop af
	ld [wAudioROMBank], a
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ld [wMapPalOffset], a
	inc a
	ld [wUpdateSpritesEnabled], a
	call LoadGBPal
	; done crystal ball animation
	ld hl, .ahyes
	rst _PrintText
	pop hl ; pokemon-specific text
	call TextCommandProcessor
	pop de
	; d = which pokemon we chose
	ld a, d
	cp BEEDRILL
	ld hl, .beedrillInfoText
	jr z, .printDone
;;; Aironfaar mod start: handle Magikarp and Gyarados dialogue
	cp MAGIKARP
	ld hl, .magikarpInfoText
	jr z, .printDone
	cp GYARADOS
	ld hl, .gyaradosInfoText
	jr z, .printDone
;;; Aironfaar mod end
	push de
	cp JIGGLYPUFF
	jr z, .forceSING
	cp WIGGLYTUFF
	jr z, .forceSING
	jr .remapCheck
.forceSING
	ld d, SING
	jr .gotMove
.remapCheck
	callfar GetRemappedMoveAndPowerFromPokemon
	pop bc
	jr nc, .done
	push bc
.gotMove
	; d = move ID, e = remapped power
	ld a, e
	ld [w2CharStringBuffer], a
	ld a, d
	ld [wNamedObjectIndex], a
	call GetMoveName
	call Random
	and %11
	ld hl, .masterOfMove
	jr z, .printMoveSpecialty
	dec a
	ld hl, .talentOfMove
	jr z, .printMoveSpecialty
	dec a
	ld hl, .soulCallsForMove
	jr z, .printMoveSpecialty
	ld hl, .lovesToUseMove
.printMoveSpecialty
	rst _PrintText
	pop bc
	ld a, b
	cp JIGGLYPUFF
	ld hl, .jigglywigglytext
	jr z, .printDone
	cp WIGGLYTUFF
	jr z, .printDone
	cp HYPNO
	ld hl, .hypnoText
	jr z, .printDone
	ld hl, .genericMovePowerIncreasesText
.printDone
	rst _PrintText
.done
	xor a
	ld [wListMenuHoverTextType], a
	ld [wCurrentMenuItem], a
	pop af
	ld [wListScrollOffset], a ; restore list scroll offset to preserve item list index
	rst TextScriptEnd
.comeAgain
	ld hl, .comeAgainText
	rst _PrintText
	jr .done
.sparkleCrystalBall
	ld [wMapPalOffset], a
	call LoadGBPal
	ld a, 8
.loop2
	push af
	ld hl, wShadowOAMSprite08TileID
	call HorizontalFlipOverworldSprite
	ld c, 4
	rst _DelayFrames
	pop af
	dec a
	jr nz, .loop2
	ret
.MoveMysticIntro
	text_far _MoveMysticIntro
	text_end
.MoveMysticAgain
	text_far _MoveMysticAgain
	text_end
.MoveMysticQuestion
	text_far _MoveMysticQuestion
	text_end
.ahyes
	text_far _MoveMysticAhYes
	text_end
.comeAgainText
	text_far _Museum1FScientist1ComeAgainText
	text_end
.lookdeep
	text_far _MoveMysticLookDeep
	text_end
.beedrillInfoText
	text_far _MoveMysticBeedrillText
	text_end
;;; Aironfaar mod start: info text for Magikarp and Gyarados
.magikarpInfoText
	text_far _MoveMysticMagikarpText
	text_end
.gyaradosInfoText
	text_far _MoveMysticGyaradosText
	text_end
;;; Aironfaar mod end
.masterOfMove
	text_far _MoveMysticMasterOfMoveText
	text_end
.talentOfMove
	text_far _MoveMysticTalentOfMoveText
	text_end
.soulCallsForMove
	text_far _MoveMysticSoulCallsForMoveText
	text_end
.lovesToUseMove
	text_far _MoveMysticLovesMoveText
	text_end
.genericMovePowerIncreasesText
	text_far _GenericMovePowerIncreasesText
	text_end
.jigglywigglytext
	text_far _MoveMysticAccuracy85
	text_far _MoveMysticJigglyWigglyOnlyLevel20Text
	text_end
.hypnoText
	text_far _MoveMysticAccuracy85
	text_end

; hl = start of sprite in wShadowOAM at tile ID attribute
HorizontalFlipOverworldSprite:
	call .exchangeAndFlipTwoOAMEntries
	call .nextSprite
	; fall through
.exchangeAndFlipTwoOAMEntries
	call .nextSprite
	ld a, [hl]
	call .previousSprite
	ld b, [hl]
	ld [hli], a
	ld a, [hl]
	xor %00100000 ; toggle horizontal flip
	ld [hl], a
	call .nextSprite
	ld a, [hl]
	xor %00100000 ; toggle horizontal flip
	ld [hl], a
	dec hl
	ld [hl], b
	ret
.nextSprite
	ld de, 4
	add hl, de
	ret
.previousSprite
	dec hl
	dec hl
	dec hl
	dec hl
	ret



FormulateMoveMysticMonList:
	ld hl, MoveMysticMonsList
	ld de, wItemList + 1
	ld b, 0
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	ld a, [hld]
	cp $FF
	ld c, a
	ld a, [hl]
	jr z, .seen
	push hl
	push bc
	ld hl, wPokedexSeen
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	pop bc
	pop hl
	and a
	ld a, [hl]
	jr z, .skipSeen
.seen
	ld [de], a
	inc de
	inc b
.skipSeen
	inc hl
	inc hl
	inc hl
	inc hl
	jr .loop
.done
	ld a, -1
	ld [de], a ; end of list
	ld hl, wItemList
	ld [hl], b ; length of list
	ret


; mon ID, mon dex ID (needed for checking if it's seen)
; if it's guaranteed to be seen at meeting this NPC $FF is used instead for dex ID
MoveMysticMonsList:
	db BEEDRILL, $FF
	dw BeedrillMoveMysticText
	db FEAROW, DEX_FEAROW
	dw FearowMoveMysticText
	db ARBOK, DEX_ARBOK
	dw ArbokMoveMysticText
	db JIGGLYPUFF, $FF
	dw JigglypuffMoveMysticText
	db WIGGLYTUFF, DEX_WIGGLYTUFF
	dw WigglytuffMoveMysticText
	db GOLEM, DEX_GOLEM
	dw GolemMoveMysticText
	db HYPNO, DEX_HYPNO
	dw HypnoMoveMysticText
;;; Aironfaar mod start: add Kingler to Move Mystic selection list
	db KINGLER, DEX_KINGLER
	dw KinglerMoveMysticText
;;; Aironfaar mod end
	db HITMONLEE, DEX_HITMONLEE
	dw HitmonleeMoveMysticText
	db HITMONCHAN, DEX_HITMONCHAN
	dw HitmonchanMoveMysticText
	db LICKITUNG, $FF
	dw LickitungMoveMysticText
	db KANGASKHAN, DEX_KANGASKHAN
	dw KangaskhanMoveMysticText
	db SEAKING, DEX_SEAKING
	dw SeakingMoveMysticText
	db JYNX, DEX_JYNX
	dw JynxMoveMysticText
	db ELECTABUZZ, DEX_ELECTABUZZ
	dw ElectabuzzMoveMysticText
	db MAGMAR, DEX_MAGMAR
	dw MagmarMoveMysticText
;;; Aironfaar mod start: add Magikarp and Gyarados to Move Mystic selection list
	db MAGIKARP, DEX_MAGIKARP
	dw MagikarpMoveMysticText
	db GYARADOS, DEX_GYARADOS
	dw GyaradosMoveMysticText
;;; Aironfaar mod end
	db OMASTAR, DEX_OMASTAR
	dw OmastarMoveMysticText
	db DRAGONITE, DEX_DRAGONITE
	dw DragoniteMoveMysticText
	db -1

BeedrillMoveMysticText:
	text_far _BeedrillMoveMysticText
	text_end

ArbokMoveMysticText::
	text_far _ArbokMoveMysticText
	text_end

FearowMoveMysticText::
	text_far _FearowMoveMysticText
	text_end

GolemMoveMysticText::
	text_far _GolemMoveMysticText
	text_end

HitmonleeMoveMysticText::
	text_far _HitmonleeMoveMysticText
	text_end

HitmonchanMoveMysticText::
	text_far _HitmonchanMoveMysticText
	text_end

ElectabuzzMoveMysticText::
	text_far _ElectabuzzMoveMysticText
	text_end

MagmarMoveMysticText::
	text_far _MagmarMoveMysticText
	text_end

JynxMoveMysticText::
	text_far _JynxMoveMysticText
	text_end

HypnoMoveMysticText::
	text_far _HypnoMoveMysticText
	text_end

DragoniteMoveMysticText::
	text_far _DragoniteMoveMysticText
	text_end

SeakingMoveMysticText::
	text_far _SeakingMoveMysticText
	text_end
	
KangaskhanMoveMysticText::
	text_far _KangaskhanMoveMysticText
	text_end
	
LickitungMoveMysticText::
	text_far _LickitungMoveMysticText
	text_end

OmastarMoveMysticText::
	text_far _OmastarMoveMysticText
	text_end

JigglypuffMoveMysticText::
	text_far _JigglypuffMoveMysticText
	text_end

WigglytuffMoveMysticText::
	text_far _WigglytuffMoveMysticText
	text_end

;;; Aironfaar mod start: get Magikarp, Gyarados and Kingler info text
MagikarpMoveMysticText::
	text_far _MagikarpMoveMysticText
	text_end

GyaradosMoveMysticText::
	text_far _GyaradosMoveMysticText
	text_end

KinglerMoveMysticText::
	text_far _KinglerMoveMysticText
	text_end
;;; Aironfaar mod end
