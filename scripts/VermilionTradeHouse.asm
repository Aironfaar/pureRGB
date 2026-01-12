VermilionTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionTradeHouse_TextPointers:
	def_text_pointers
	dw_const VermilionTradeHouseCooltrainerFText, TEXT_VERMILIONTRADEHOUSE_COOLTRAINER_F ; Aironfaar mod

VermilionTradeHouseCooltrainerFText: ; Aironfaar mod
	text_asm
	ld a, TRADE_FOR_LIGHTYEAR ; Aironfaar mod
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd
