Route11Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route11Gate2F_TextPointers:
	def_text_pointers
	dw_const Route11Gate2FYoungsterText,       TEXT_ROUTE11GATE2F_YOUNGSTER
	dw_const Route11Gate2FOaksAideText,        TEXT_ROUTE11GATE2F_OAKS_AIDE
	dw_const Route11Gate2FLeftBinocularsText,  TEXT_ROUTE11GATE2F_LEFT_BINOCULARS
	dw_const Route11Gate2FRightBinocularsText, TEXT_ROUTE11GATE2F_RIGHT_BINOCULARS

Route11Gate2FYoungsterText:
	text_asm
	ld a, TRADE_FOR_MANDY ; Aironfaar mod
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd

Route11Gate2FOaksAideText:
	text_asm
	CheckEvent EVENT_GOT_ITEMFINDER
	jr z, .needItem
	ld hl, .ItemfinderDescriptionText
	rst _PrintText
	rst TextScriptEnd
.needItem
	ld a, ITEMFINDER
	ldh [hOaksAideRewardItem], a
	xor a
	ldh [hOaksAideChangeFlags], a
	ld b, 2
	CheckEventHL EVENT_TURNED_IN_FARFETCHD
	jr z, .needFarfetchd
	add b
.needFarfetchd
	sla b
	CheckEventHL EVENT_TURNED_IN_PIKACHU
	jr z, .needPikachu
	add b
.needPikachu
	sla b
	CheckEventHL EVENT_TURNED_IN_PINSIR
	jr z, .needPinsir
	add b
.needPinsir
	sla b
	CheckEventHL EVENT_TURNED_IN_MAGIKARP
	jr z, .needMagikarp
	add b
.needMagikarp
	ldh [hOaksAideEventFlags], a	
	predef OaksAideScript
	ldh a, [hOaksAideChangeFlags]
	bit 0, a
	jr z, .stillNeedItem
	SetEvent EVENT_GOT_ITEMFINDER
.stillNeedItem
	bit 1, a
	jr z, .noChangeFarfetchd
	SetEvent EVENT_TURNED_IN_FARFETCHD
.noChangeFarfetchd
	bit 2, a
	jr z, .noChangePikachu
	SetEvent EVENT_TURNED_IN_PIKACHU
.noChangePikachu
	bit 3, a
	jr z, .noChangePinsir
	SetEvent EVENT_TURNED_IN_PINSIR
.noChangePinsir
	bit 4, a
	jr z, .noChangeMagikarp
	SetEvent EVENT_TURNED_IN_MAGIKARP
.noChangeMagikarp
	rst TextScriptEnd

.ItemfinderDescriptionText:
	text_far _Route11Gate2FOaksAideItemfinderDescriptionText
	text_end

Route11Gate2FLeftBinocularsText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jp nz, GateUpstairsScript_PrintIfFacingUp
	CheckEvent EVENT_BEAT_ROUTE12_SNORLAX
	ld hl, .SnorlaxText
	jr z, .print
	ld hl, .NoSnorlaxText
.print
	rst _PrintText
	rst TextScriptEnd

.SnorlaxText:
	text_far _Route11Gate2FLeftBinocularsSnorlaxText
	text_end

.NoSnorlaxText:
	text_far _Route11Gate2FLeftBinocularsNoSnorlaxText
	text_end

Route11Gate2FRightBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route11Gate2FRightBinocularsText
	text_end
