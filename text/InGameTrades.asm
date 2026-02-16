;;; Aironfaar mod: entire file is new
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
    text "YEEHAW!"
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

; GRAVELER Sylvester
_WannaTradeSylvesterText::
    text "I have no #MON"
	line "that can learn"
	cont "FLASH, so I'm"
	cont "stuck here."
	
	para "Do you have a"
	line "KADABRA? You can"
	cont "have my GRAVELER"
	cont "in exchange."
	done

_NoTradeSylvesterText::
    text "Drat<...> Going"
	line "without FLASH"
	cont "seems risky<...>"
	done

; WrongMon for Sylvester: Oh, then NoTradeSylvesterText

_ThanksSylvesterText::
    text "Thank you! You're"
	line "a lifesaver, kid!"
	done

_AfterTradeSylvesterText::
    text "Hey, your KADABRA"
	line "evolved after we"
	cont "traded. Amazing!"
	
	para "Two spoons FLASH"
	line "better than one!"
	done

; HAUNTER Blair
_WannaTradeBlairText::
    text "Oi mate, got a"
	line "spare GRAVELER?"
	
	para "My HAUNTER's a"
	line "ripper alright,"
	cont "but I need more"
	cont "BOOM in my team,"
	cont "you get me?"
	
	para "Wanna trade?"
	done

_NoTradeBlairText::
    text "Don't leave me"
	line "hanging like"
	cont "this, mate!"
	done

; WrongMon for Blair: What, then NoTradeBlairText

_ThanksBlairText::
    text "Heck yeah, that's"
	line "the stuff!"
	
	para "EXPLOSIVE!"
	
	para "POWER!"
	done

_AfterTradeBlairText::
    text "Mate, your"
	line "GRAVELER's"
	cont "awesome!"
	
	para "It even evolved"
	line "when we traded!"
	done

; MACHOKE Arnold
_WannaTradeArnoldText::
    text "My parents want me"
	line "to release my"
	cont "MACHOKE."
	
	para "They say it would"
	line "be unseemly for a"
	cont "girl to have."
	
	para "I'll show them!"
	
	para "But I can't keep"
	line "MACHOKE."
	
	para "Do you have a"
	line "HAUNTER to trade"
	cont "with me?"
	done

_NoTradeArnoldText::
    text "Bring me a"
	line "HAUNTER!"
	
	para "I need it!"
	
	para "<...> please?"
	done

; WrongMon for Arnold: Hey, then NoTradeArnoldText

_ThanksArnoldText::
    text "Nye hye hye<...>"
	
	para "Time to plan"
	line "pranks<...>"
	
	para "They'll wish they"
	line "never forced me"
	cont "to part with"
	cont "MACHOKE!"
	done

_AfterTradeArnoldText::
    text "Your HAUNTER"
	line "evolved when we"
	cont "traded."
	
	para "Now GENGAR can"
	line "hide in my shadow"
	cont "and my parents"
	cont "will never even"
	cont "know!"
	done

; KADABRA Liam
_WannaTradeLiamText::
    text "I meant to join"
	line "the SAFFRON GYM"
	cont "to challenge and"
	cont "improve myself,"
	cont "but the DOJO folk"
	cont "seem much more"
	cont "down to earth."
	
	para "Now I need to"
	line "change my team."
	
	para "Want to trade?"
	line "My KADABRA for"
	cont "your MACHOKE?"
	done

_NoTradeLiamText::
    text "I'll keep looking,"
	line "then."
	done

; WrongMon for Liam: Oh, then NoTradeLiamText

_ThanksLiamText::
    text "Yes! It has that"
	line "fighting spirit!"
	
	para "HOO-HAH!"
	done

_AfterTradeLiamText::
    text "The trade stoked"
	line "MACHOKE's fighting"
	cont "spirit so much,"
	cont "it powered up"
	cont "and evolved!"
	done

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