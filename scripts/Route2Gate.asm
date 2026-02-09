Route2Gate_Script:
	jp EnableAutoTextBoxDrawing

Route2Gate_TextPointers:
	def_text_pointers
	dw_const Route2GateOaksAideText,  TEXT_ROUTE2GATE_OAKS_AIDE
	dw_const Route2GateYoungsterText, TEXT_ROUTE2GATE_YOUNGSTER

Route2GateOaksAideText:
	text_asm
	CheckEvent EVENT_GOT_HM05
	jr z, .needItem
	ld hl, .FlashExplanationText
	rst _PrintText
	rst TextScriptEnd
.needItem
	ld a, HM_FLASH
	ldh [hOaksAideRewardItem], a
	xor a
	ldh [hOaksAideChangeFlags], a
	ld b, 2
	CheckEventHL EVENT_TURNED_IN_MEOWTH
	jr z, .needMeowth
	add b
.needMeowth
	sla b
	CheckEventHL EVENT_TURNED_IN_VENONAT
	jr z, .needVenonat
	add b
.needVenonat
	sla b
	CheckEventHL EVENT_TURNED_IN_ZUBAT
	jr z, .needZubat
	add b
.needZubat
	sla b
	CheckEventHL EVENT_TURNED_IN_EXEGGCUTE
	jr z, .needExeggcute
	add b
.needExeggcute
	ldh [hOaksAideEventFlags], a	
	predef OaksAideScript
	ldh a, [hOaksAideChangeFlags]
	bit 0, a
	jr z, .stillNeedItem
	SetEvent EVENT_GOT_HM05
.stillNeedItem
	bit 1, a
	jr z, .noChangeMeowth
	SetEvent EVENT_TURNED_IN_MEOWTH
.noChangeMeowth
	bit 2, a
	jr z, .noChangeVenonat
	SetEvent EVENT_TURNED_IN_VENONAT
.noChangeVenonat
	bit 3, a
	jr z, .noChangeZubat
	SetEvent EVENT_TURNED_IN_ZUBAT
.noChangeZubat
	bit 4, a
	jr z, .noChangeExeggcute
	SetEvent EVENT_TURNED_IN_EXEGGCUTE
.noChangeExeggcute
	rst TextScriptEnd

.FlashExplanationText:
	text_far _Route2GateOaksAideFlashExplanationText
	text_end

Route2GateYoungsterText:
	text_far _Route2GateYoungsterText
	text_end
