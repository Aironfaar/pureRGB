; EmotionBubblesPointerTable indexes (see engine/overworld/emotion_bubbles.asm)
	const_def
	const EXCLAMATION_BUBBLE ; 0
	const QUESTION_BUBBLE    ; 1
	const SMILE_BUBBLE       ; 2
	const HEART_BUBBLE       ; 3
	const SLEEPING_BUBBLE    ; 4

; slot symbols
DEF SLOTS7      EQU $0200
DEF SLOTSBAR    EQU $0604
DEF SLOTSCHERRY EQU $0A08
DEF SLOTSFISH   EQU $0E0C
DEF SLOTSBIRD   EQU $1210
DEF SLOTSMOUSE  EQU $1614

; StartSlotMachine dialogs
DEF SLOTS_OUTOFORDER   EQU $fd
DEF SLOTS_OUTTOLUNCH   EQU $fe
DEF SLOTS_SOMEONESKEYS EQU $ff

; in game trades
; TradeMons indexes (see data/events/trades.asm)
	const_def
;;; Aironfaar mod start
	const TRADE_FOR_LOLA
	const TRADE_FOR_LIGHTYEAR
	const TRADE_FOR_DISCOMBOB
	const TRADE_FOR_BULBERT
	const TRADE_FOR_MIRTLE
	const TRADE_FOR_MANDY
	const TRADE_FOR_SYLVESTER
	const TRADE_FOR_BLAIR
	const TRADE_FOR_ARNOLD
	const TRADE_FOR_LIAM
	const TRADE_FOR_SPROCKET
	const TRADE_FOR_ROALD
	const TRADE_FOR_LAWRENCE
	const TRADE_FOR_NIKOLA
    const TRADE_FOR_ENIGMA
	const TRADE_FOR_MIRAGE
;;; Aironfaar mod end
DEF NUM_NPC_TRADES EQU const_value

; in game trade dialog sets
; InGameTradeTextPointers indexes (see engine/events/in_game_trades.asm)
	const_def
;;; Aironfaar mod start
	const TRADE_DIALOGSET_LOLA
	const TRADE_DIALOGSET_LIGHTYEAR
	const TRADE_DIALOGSET_DISCOMBOB
	const TRADE_DIALOGSET_BULBERT
	const TRADE_DIALOGSET_MIRTLE
	const TRADE_DIALOGSET_MANDY
	const TRADE_DIALOGSET_SYLVESTER
	const TRADE_DIALOGSET_BLAIR
	const TRADE_DIALOGSET_ARNOLD
	const TRADE_DIALOGSET_LIAM
	const TRADE_DIALOGSET_SPROCKET
	const TRADE_DIALOGSET_SCIENTIST
	const TRADE_DIALOGSET_MISSINGNO
;;; Aironfaar mod end
DEF NUM_TRADE_DIALOGSETS EQU const_value

; Aironfaar mod: changed how Oak's Aides work, so removed OaksAideScript results as they are no longer needed
