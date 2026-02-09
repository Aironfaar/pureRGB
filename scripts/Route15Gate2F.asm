Route15Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route15Gate2F_TextPointers:
	def_text_pointers
	dw_const Route15Gate2FOaksAideText,   TEXT_ROUTE15GATE2F_OAKS_AIDE
	dw_const Route15Gate2FBinocularsText, TEXT_ROUTE15GATE2F_BINOCULARS

; PureRGBnote: CHANGED: oak's aide here will give you the BOOSTER CHIP instead of EXP.ALL, and it requires 80 pokemon caught to obtain.
; Once you install it, you must talk to him to get it removed. This removes the need for it taking up an item slot when in use.
Route15Gate2FOaksAideText:
	text_asm
	CheckEvent EVENT_GOT_BOOSTER_CHIP
	jr z, .needItem
	CheckEvent EVENT_BOOSTER_CHIP_ACTIVE
	jr z, .boosterChipNotActive
	ld hl, Route15GateUpstairsRemoveBoosterText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .noUninstall
	lb bc, BOOSTER_CHIP, 1
	call GiveItem
	jr nc, .bagFull
	ResetEvent EVENT_BOOSTER_CHIP_ACTIVE
	call RemoveBoosterChipSounds
	ld hl, Route15GateUpstairsDoneText
	jr .endPrint
.bagFull
	ld hl, Route15GateUpstairsNoRoomText
	jr .endPrint
.noUninstall
	ld hl, Route15GateUpstairsNoUninstallText
	jr .endPrint
.boosterChipNotActive
	ld hl, BoosterChipText
.endPrint
	rst _PrintText
	rst TextScriptEnd
.needItem
	ld a, BOOSTER_CHIP
	ldh [hOaksAideRewardItem], a
	xor a
	ldh [hOaksAideChangeFlags], a
	ld b, 2
	CheckEventHL EVENT_TURNED_IN_CHANSEY
	jr z, .needChansey
	add b
.needChansey
	sla b
	CheckEventHL EVENT_TURNED_IN_RHYDON
	jr z, .needRhydon
	add b
.needRhydon
	ldh [hOaksAideEventFlags], a	
	predef OaksAideScript
	ldh a, [hOaksAideChangeFlags]
	bit 0, a
	jr z, .stillNeedItem
	SetEvent EVENT_GOT_BOOSTER_CHIP
.stillNeedItem
	bit 1, a
	jr z, .noChangeChansey
	SetEvent EVENT_TURNED_IN_CHANSEY
.noChangeChansey
	bit 2, a
	jr z, .noChangeRhydon
	SetEvent EVENT_TURNED_IN_RHYDON
.noChangeRhydon
	rst TextScriptEnd

RemoveBoosterChipSounds:
	ld b, 5
	ld a, SFX_STOP_ALL_MUSIC
	rst _PlaySound
.loop
	ld a, SFX_NOISE_INSTRUMENT16
	rst _PlaySound
	ld c, 10
	rst _DelayFrames
	dec b
	jr nz, .loop
	ld a, SFX_NOISE_INSTRUMENT03
	rst _PlaySound
	ld c, 10
	rst _DelayFrames
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	ld c, 30
	jp PlayDefaultMusic

BoosterChipText:
	text_far _Route15Gate2FOaksAideBoosterChipText
	text_end

Route15Gate2FBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route15Gate2FBinocularsText
	text_end

Route15GateUpstairsNoRoomText:
	text_far _PewterGymTM34NoRoomText
	text_end

Route15GateUpstairsRemoveBoosterText:
	text_far _Route15GateUpstairsRemoveBoosterText
	text_end

Route15GateUpstairsNoUninstallText:
	text_far _Route15GateUpstarsFairEnoughText
	text_end

Route15GateUpstairsDoneText:
	text_far _Route15GateUpstairsDoneText
	sound_get_item_1
	text_end