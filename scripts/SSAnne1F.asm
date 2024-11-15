SSAnne1F_Script:
	jp EnableAutoTextBoxDrawing

SSAnne1F_TextPointers:
	def_text_pointers
	dw_const SSAnne1FWaiterText, TEXT_SSANNE1F_WAITER
	dw_const SSAnne1FSailorText, TEXT_SSANNE1F_SAILOR
	dw_const SSAnne1FLittleBoyText, TEXT_SSANNE1F_LITTLE_BOY ; Aironfaar mod

SSAnne1FWaiterText:
	text_far _SSAnne1FWaiterText
	text_end

SSAnne1FSailorText:
	text_far _SSAnne1FSailorText
	text_end

;;;;;;;;;; Aironfaar mod START
SSAnne1FLittleBoyText:
    text_asm
	ld a, TRADE_FOR_DISCOMBOB
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd
;;;;;;;;;; Aironfaar mod END
