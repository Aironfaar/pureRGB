_ItemUseText001::
	text "<PLAYER> used@"
	text_end

_ItemUseText002::
	text_ram wStringBuffer
	text "!"
	done

_GotOnBicycleText1::
	text "<PLAYER> got on the@"
	text_end

_GotOnBicycleText2::
	text_ram wStringBuffer
	text "!"
	prompt

_GotOffBicycleText1::
	text "<PLAYER> got off@"
	text_end

_GotOffBicycleText2::
	text "the @"
	text_ram wStringBuffer
	text "."
	prompt

_ThrewAwayItemText::
	text "Threw away"
	line "@"
	text_ram wNameBuffer
	text "."
	prompt

_IsItOKToTossItemText::
	text "Is it OK to toss"
	line "@"
	text_ram wStringBuffer
	text "?"
	prompt

_TooImportantToTossText::
	text "That's too impor-"
	line "tant to toss!"
	prompt

_AlreadyKnowsText::
	text_ram wNameBuffer
	text " knows"
	line "@"
	text_ram wStringBuffer
	text "!"
	prompt

;;;;;;;;;; Aironfaar mod START
_ConnectCableText::
	text "Okay, connect the"
	line "cable like so!"
	prompt

_TradedForText::
	text "<PLAYER> traded"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " for"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text "!@"
	text_end

_WrongMonWhatText::
	text "What? That's no"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."
	done

_WrongMonHmmText::
	text "Hmm? That's no"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."
	done

_WrongMonOhText::
    text "Oh<...> That's no"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."
	done

_WrongMonHeyText::
    text "Hey! That's no"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"
	done

_NoTrade1Text::
	text "Awww!"
	line "Oh well<...>"
	done

_Thanks2Text::
	text "Thanks!"
	done
;;;;;;;;;; Aironfaar mod END

_NothingToCutText::
	text "There isn't"
	line "anything to CUT!"
	prompt

_UsedCutText::
	text_ram wNameBuffer
	text " hacked"
	line "away with CUT!"
	prompt

_ItemUseWildMonText::
	text "This can only"
	line "be used on wild"
	cont "#MON."
	prompt

_NoPokeDollsOnSpiritsText::
	text "A # DOLL won't"
	line "distract this"
	cont "violent spirit!"
	prompt
