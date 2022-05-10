IndigoPlateauLobby_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	ld hl, wBeatLorelei
	bit 1, [hl]
	res 1, [hl]
	ret z
	; Elite 4 events
	ResetEventRange ELITE4_EVENTS_START, EVENT_LANCES_ROOM_LOCK_DOOR
	ret

IndigoPlateauLobby_TextPointers:
	dw IndigoHealNurseText
	dw IndigoPlateauGymGuideText
	dw IndigoPlateauLobbyText3
	dw IndigoCashierText
	dw IndigoTradeNurseText
	dw IndigoGymGuideSonText

IndigoHealNurseText:
	script_pokecenter_nurse

IndigoPlateauGymGuideText:
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .afterChamp
	ld hl, IndigoPlateauLobbyText2get
	call PrintText
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .done
	ld hl, IndigoPlateauApexChipsAfterChamp
	call PrintText
	jr .done
.afterChamp
	CheckEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	jr nz, .quickGreet
	SetEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	ld hl, IndigoPlateauGymGuideChampGreeting
	call PrintText
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .done
	ld hl, IndigoPlateauGymGuideChampApexChips
	call PrintText
	jr .sellChips
.quickGreet
	ld hl, IndigoPlateauGymGuideChampAfterGreet
	call PrintText
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .done
.sellChips
	ld hl, IndigoGymGuideShop
	call DisplayPokemartNoGreeting
.done
	jp TextScriptEnd

IndigoGymGuideSonText:
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .afterChamp
	ld hl, IndigoPlateauGymGuideSonText
	call PrintText
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	call nz, .noIntroduce
	call .checkIntroduce
	jr .shop1
.checkIntroduce
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	call z, .introduce
	ret
.introduce
	ld hl, IndigoPlateauGymGuideSonIntro
	call PrintText
	ret
.noIntroduce
	ld hl, IndigoPlateauGymGuideSonShopStart
	call PrintText
	ret
.moreTMs
	CheckEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	ret nz
	ld hl, IndigoPlateauGymGuideSonMoreTMs
	call PrintText
	ret
.afterChamp
	ld hl, IndigoPlateauGymGuideSonChampText
	call PrintText
	call .checkIntroduce
	CheckEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	call nz, .noIntroduce 
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	call nz, .moreTMs 
	SetEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	jr .shop2
.shop2
	ld hl, IndigoGymGuideSonShop2
	jr .done
.shop1
	ld hl, IndigoGymGuideSonShop1
.done
	call DisplayPokemartNoGreeting
	SetEvent EVENT_MET_GYM_GUIDE_SON
	jp TextScriptEnd

IndigoPlateauLobbyText2get:
	text_far _IndigoPlateauLobbyText2
	text_end

IndigoPlateauApexChipsAfterChamp:
	text_far _IndigoPlateauApexChipsAfterChamp
	text_end

IndigoPlateauLobbyText3:
	text_far _IndigoPlateauLobbyText3
	text_end

IndigoPlateauGymGuideChampGreeting:
	text_far _IndigoPlateauGymGuideChampGreeting
	text_end

IndigoPlateauGymGuideChampApexChips:
	text_far _IndigoPlateauGymGuideChampApexChips
	text_end

IndigoPlateauGymGuideChampAfterGreet:
	text_far _IndigoPlateauGymGuideChampAfterGreet
	text_end

IndigoTradeNurseText:
	script_cable_club_receptionist
	
IndigoCashierText:
	script_mart ULTRA_BALL, GREAT_BALL, FULL_RESTORE, MAX_POTION, FULL_HEAL, REVIVE, MAX_REPEL

IndigoPlateauGymGuideSonText:
	text_far _IndigoPlateauGymGuideSonText
	text_end

IndigoPlateauGymGuideSonChampText:
	text_far _IndigoPlateauGymGuideSonChampText
	text_end

IndigoPlateauGymGuideSonIntro:
	text_far _IndigoPlateauGymGuideSonIntro
	text_end

IndigoPlateauGymGuideSonShopStart:
	text_far _IndigoPlateauGymGuideSonShopStart
	text_end

IndigoPlateauGymGuideSonMoreTMs:
	text_far _IndigoPlateauGymGuideSonMoreTMs
	text_end

IndigoGymGuideSonShop1:
	script_mart ULTRA_BALL, GREAT_BALL, FULL_RESTORE, MAX_POTION, FULL_HEAL, REVIVE, MAX_REPEL

IndigoGymGuideSonShop2:
	script_mart ULTRA_BALL, GREAT_BALL, FULL_RESTORE, MAX_POTION, FULL_HEAL, REVIVE, MAX_REVIVE

IndigoGymGuideShop:
	script_mart APEX_CHIP