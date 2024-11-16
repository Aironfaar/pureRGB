CinnabarLabTradeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabTradeRoom_TextPointers:
	def_text_pointers
;;;;;;;;;; Aironfaar mod START
	dw_const CinnabarLabTradeRoomScientist1Text, TEXT_CINNABARLABTRADEROOM_SCIENTIST1
	dw_const CinnabarLabTradeRoomScientist2Text, TEXT_CINNABARLABTRADEROOM_SCIENTIST2
	dw_const CinnabarLabTradeRoomScientist3Text, TEXT_CINNABARLABTRADEROOM_SCIENTIST3
	dw_const CinnabarLabTradeRoomScientist4Text, TEXT_CINNABARLABTRADEROOM_SCIENTIST4
;;;;;;;;;; Aironfaar mod END
	dw_const CinnabarLabTradeRoomPosterText,    TEXT_CINNABARLABTRADEROOM_POSTER

CinnabarLabTradeRoomScientist1Text:
	text_far _CinnabarLabTradeRoomPreparationText
	text_end

CinnabarLabTradeRoomScientist2Text:
	text_asm
	ld a, TRADE_FOR_LAWRENCE ; Aironfaar mod
	ld [wWhichTrade], a
	jr CinnabarLabTradeRoomDoTrade

CinnabarLabTradeRoomScientist3Text:
	text_asm
	ld a, TRADE_FOR_ROALD ; Aironfaar mod
	ld [wWhichTrade], a
	jr CinnabarLabTradeRoomDoTrade

CinnabarLabTradeRoomScientist4Text:
	text_asm
	ld a, TRADE_FOR_NIKOLA ; Aironfaar mod
	ld [wWhichTrade], a
CinnabarLabTradeRoomDoTrade:
	predef DoInGameTradeDialogue
	rst TextScriptEnd

; PureRGBnote: ADDED: text entry for the poster in this room

CinnabarLabTradeRoomPosterText:
	text_far _CinnabarLabTradeRoomPosterText
	text_end