;;;;;;;;;; Aironfaar mod ENTIRE FILE
; JYNX Lola
_WannaTradeLolaText::
    text "My wife looks at"
	line "me funny whenever"
	cont "I brush the hair"
	cont "of my JYNX."
	para "I think I'll have"
	line "to decide between"
	cont "the two<...>"
	para "Would you trade me"
	line "a PIDGEOTTO for"
	cont "her?"
	para "<...>"
	para "For my JYNX,"
	line "of course."
	done

_NoTradeLolaText::
	text "Haa<...>"
	line "What to do<...>"
	done

; WrongMon for Lola: What, then NoTradeLolaText

_ThanksLolaText::
	text "Alright. This will"
	line "be for the best."
	done

_AfterTradeLolaText::
	text "Take good care of"
	line "my Lola<...>"
	done

; ELECTABUZZ Lightyear
_WannaTradeLightyearText::
    text "My ELECTABUZZ"
	line "has quite the"
	cont "temperament."
	para "It's a dear, but"
	line "I'd admittedly"
	cont "prefer something"
	cont "mellow, like a"
	cont "LICKITUNG."
	para "Hey, how about we"
	line "trade?"
	done

_NoTradeLightyearText::
    text "Well, we'll manage"
	line "for now."
	done

; WrongMon for Lightyear: Hmm, then NoTradeLightyearText

_ThanksLightyearText::
    text "I hope you'll get"
	line "along well!"
	done

_AfterTradeLightyearText::
    text "I miss Lightyear,"
	line "but he's better"
	cont "off with a"
	cont "competitive"
	cont "trainer like you."
	done

; TANGELA Discombob
_WannaTradeDiscombobText::
    text "I want a TAUROS"
	line "from Route 11,"
	cont "but my parents"
	cont "won't let me go."
	para "Will you trade"
	line "with me for my"
	cont "TANGELA?"
	done

_NoTradeDiscombobText::
	text "Man, being stuck"
	line "on this ship"
	cont "really sucks<...>"
	done

; WrongMon for Discombob: Hey, then NoTradeDiscombobText

_ThanksDiscombobText::
    text "Heck yeah!"
	line "Thanks!"
	done

_AfterTradeDiscombobText::
    text "I'll practice"
	line "riding TAUROS to"
	cont "become a cowboy"
	cont "one day!"
	done

; BULBASAUR Bulbert
; SQUIRTLE Mirtle
; CHARMANDER Mandy
_WannaTradeStarterText::
    text "I got a little"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text ", but"
	cont "raising a young"
	cont "#MON is so"
	cont "hard<...>"
	para "I heard that"
	line "traded #MON"
	cont "grow up faster,"
    cont "though."
	para "Would you trade me"
	line "a @"
	text_ram wInGameTradeGiveMonName
	text " for"
	cont "mine?"
	done

_NoTradeStarterText::
    text "Aww<...>"
	para "Come back if you"
	line "change your mind!"
	done

_WrongMonStarterText::
    text "I don't want"
	line "a different"
	cont "#MON, just a"
	cont "@"
	text_ram wInGameTradeGiveMonName
	text " that"
	cont "grows up faster."
	done

_ThanksStarterText::
    text "Awesome! Now we'll"
	line "train up swiftly!"
	done

_AfterTradeBulbertText::
    text "My younger brother"
	line "was looking to"
	cont "make a trade like"
	cont "ours on Route 11."
	para "Maybe you can help"
	line "him out, too!"
	done

_AfterTradeMirtleText::
    text "My oldest brother"
	line "was looking to"
	cont "make a trade like"
	cont "ours on Route 2."
	para "Maybe you can help"
	line "him out, too!"
	done

_AfterTradeMandyText::
    text "My baby sister"
	line "was looking to"
	cont "make a trade like"
	cont "ours on Route 5."
	para "Maybe you can help"
	line "her out, too!"
	done