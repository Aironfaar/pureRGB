;;;;;;;;;; Aironfaar mod ENTIRE FILE
; MAGNETON SPROCKET
; WannaTrade for SPROCKET: _CeruleanRocketHouseB1FBeforeTradeText, then the following
_WannaTradeSprocketText::
    text "I'm looking for"
	line "a DRAGONITE."
	para "Would you trade"
	line "one for a"
	cont "MAGNETON?"
	done
	
_NoTradeSprocketText::
	text "I see."
	done

; WrongMon for SPROCKET: Hmm, then the following
_WrongMonSprocketText::
	para "If you get one,"
	line "come back here."
	done

_ThanksSprocketText::
	text "Thanks."
	done

; AfterTrade for SPROCKET: _CeruleanRocketHouseB1FAfterTradeText

; Legendary Birds Roald, Lawrence, Nikola
_WannaTradeScientistText::
    text "Greetings,"
	line "champion!"
	para "Do you want to"
	line "contribute to"
	cont "science?"
	para "I need more"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " for my"
	cont "research."
	para "Of course, you'll"
	line "get something"
	cont "amazing in"
	cont "return!"
	done

_NoTradeScientistText::
    text "Ah<...> Come back"
	line "if you change"
	cont "your mind."
	para "It should be worth"
	line "your while, truly!"
	done

; WrongMon for Legendary Bird: Hmm, then the following
_WrongMonScientistText::
    text "A freshly revived"
	line "specimen would be"
	cont "best."
	done

_ThanksScientistText::
    text "Thank you! This"
	line "will surely help"
	cont "advance our"
	cont "understanding of"
	cont "prehistoric"
	cont "#MON."
	done

_AfterTradeScientistText::
    text "How do you like"
	line "your @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	para "It was most"
	line "difficult to find."
	done

; Mythical PKMN Enigma, Mirage
_TradeMissingnoText::
    text "<...>"
	done

_TradeMissingnoExclaimText::
    text "<...>!"
	done

_TradeMissingnoAskText::
    text "<...>?"
	done