; PureRGBnote: CHANGED: different in-game trades

TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH
	; give mon, get mon, dialog id, nickname
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; Japanese Red and Green used TRADE_DIALOGSET_CASUAL, and had
	; the same species as English Red and Blue.
	; Aironfaar mod: doesn't matter, switched it all up
;;; Aironfaar mod start
	db PIDGEOTTO,  JYNX,       TRADE_DIALOGSET_LOLA,      "Lola@@@@@@@" ; cerulean city
	db LICKITUNG,  ELECTABUZZ, TRADE_DIALOGSET_LIGHTYEAR, "Lightyear@@" ; vermilion city
	db TAUROS,     TANGELA,    TRADE_DIALOGSET_DISCOMBOB, "Discombob@@" ; ss anne
	db BULBASAUR,  BULBASAUR,  TRADE_DIALOGSET_BULBERT,   "Bulbert@@@@" ; route 2
	db SQUIRTLE,   SQUIRTLE,   TRADE_DIALOGSET_MIRTLE,    "Mirtle@@@@@" ; route 5
	db CHARMANDER, CHARMANDER, TRADE_DIALOGSET_MANDY,     "Mandy@@@@@@" ; route 11
	db KADABRA,    GRAVELER,   TRADE_DIALOGSET_SYLVESTER, "Sylvester@@" ; route 10
	db GRAVELER,   HAUNTER,    TRADE_DIALOGSET_BLAIR,     "Blair@@@@@@" ; route 16
	db HAUNTER,    MACHOKE,    TRADE_DIALOGSET_ARNOLD,    "Arnold@@@@@" ; route 18
	db MACHOKE,    KADABRA,    TRADE_DIALOGSET_LIAM,      "Liam@@@@@@@" ; saffron city
; postgame trades
	db DRAGONITE,  MAGNETON,   TRADE_DIALOGSET_SPROCKET,  "SPROCKET@@@" ; cerulean city
	db AERODACTYL, ARTICUNO,   TRADE_DIALOGSET_SCIENTIST, "Roald@@@@@@" ; cinnabar island
	db KABUTO,     MOLTRES,    TRADE_DIALOGSET_SCIENTIST, "Lawrence@@@" ; cinnabar island
	db OMANYTE,    ZAPDOS,     TRADE_DIALOGSET_SCIENTIST, "Nikola@@@@@" ; cinnabar island
    db MISSINGNO,  MEWTWO,     TRADE_DIALOGSET_MISSINGNO, "Enigma@@@@@" ; saffron city
    db MISSINGNO,  MEW,        TRADE_DIALOGSET_MISSINGNO, "Mirage@@@@@" ; viridian forest
;;; Aironfaar mod end
	assert_table_length NUM_NPC_TRADES

; PureRGBnote: ADDED: some received pokemon use alternate color palettes if the feature is enabled
TradeMonPalettes:
	bit_array TradeMonPalettes
;;; Aironfaar mod start
    dbit TRUE ; JYNX cerulean city
	dbit TRUE ; ELECTABUZZ vermilion city
	dbit TRUE ; TANGELA ss anne
	dbit TRUE ; BULBASAUR route 2
	dbit TRUE ; SQUIRTLE route 5
	dbit TRUE ; CHARMANDER route 11
	dbit FALSE ; GRAVELER route 10
	dbit FALSE ; HAUNTER route 16
	dbit FALSE ; MACHOKE route 18
	dbit FALSE ; KADABRA saffron city
; postgame trades
	dbit TRUE ; MAGNETON cerulean city
	dbit TRUE ; ARTICUNO cinnabar island
	dbit TRUE ; MOLTRES cinnabar island
	dbit TRUE ; ZAPDOS cinnabar island
    dbit TRUE ; MEWTWO saffron city
    dbit TRUE ; MEW viridian forest
;;; Aironfaar mod end
	end_bit_array NUM_NPC_TRADES
