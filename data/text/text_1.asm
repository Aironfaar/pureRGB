_CardKeySuccessText1::
	text "Bingo!@"
	text_end

_CardKeySuccessText2::
	text_start
	line "The CARD KEY"
	cont "opened the door!"
	done

_CardKeyFailText::
	text "Darn! It needs a"
	line "CARD KEY!"
	done

_CardKeyDoneText::
	text "All the CARD KEY"
	line "doors have been"
	cont "opened!"
	
	para "Don't need this"
	line "CARD KEY anymore."

	para "<PLAYER> left it"
	line "in the card slot!"
	done

_TrainerNameText::
	text_ram wNameBuffer
	text ": @"
	text_end

_NoNibbleText::
	text "Not even a nibble!"
	prompt

_NothingHereText::
	text "Looks like there's"
	line "nothing here."
	prompt

_ItsABiteText::
	text "Oh!"
	line "It's a bite!"
	prompt

_ExclamationText::
	text "!"
	done

;_GroundRoseText:: ; unused
;	text "Ground rose up"
;	line "somewhere!"
;	done

_BoulderText::
	text "This requires"
	line "STRENGTH to move!"
	done

_StrengthActive::
	text "This boulder"
	line "can be moved!"
	done

_MartSignText::
	text "All your item"
	line "needs fulfilled!"
	cont "#MON MART"
	done

_PokeCenterSignText::
	text "Heal Your #MON!"
	line "#MON CENTER"
	done

_FoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_FoundMultipleItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer
	text " ×@"
	text_ram wTempStore1
	text "!@"
	text_end

_NoMoreRoomForItemText::
	text "No more room for"
	line "items!"
	done

;;; Aironfaar mod START: new Oak's Aide behavior
_OaksAideGreetingText::
	text "Hi <PLAYER>!"
	line "I'm one of"
	cont "PROF.OAK's AIDEs,"
	cont "working in the"
	cont "field!"
	prompt
; then: if not preparing, selection menu "Explain!", "Can I help?", "Take this.", "See you!"

_OaksAidePreparingText::
	text "But I'm busy"
	line "preparing my"
	cont "research project."
	prompt

; "Tell me more!": aide-specific CurrentResearchText, then
_OaksAideHelpMeText::
	text "If you assist me,"
	line "you'll get this"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	prompt

; "See you later!" and canceling help
_OaksAideComeBackText::
	text "Alright. I'll be"
	line "here."
	prompt

; "Can I help?"
_OaksAideNeedMonsText::
	text "I need to study"
	line "certain #MON."
	
	para "Use your #DEX"
	line "to learn in which"
	cont "AREAs they live."
	
	para "Please catch and"
	line "bring them to me."
	prompt
; then aide-specific <PokemonName>Text with DisplayPokedex spliced in

; when providing a mon
_OaksAideWhichMonText::
	text "Splendid! Which"
	line "#MON is it?"
	prompt

_OaksAideAppreciateAssistanceText::
	text "Thank you for"
	line "your hard work!"
	prompt

; when research is done
_OaksAideDoneText::
	text "Due to your"
	line "contributions, my"
	cont "work here is"
	cont "already done."
	cont "Thank you!"

	para "Here's the item I"
	line "promised."
	prompt

; when offering the wrong mon
_OaksAideIncorrectMonText::
	text "That's not a"
	line "#MON I need to"
	cont "study right now."
	done
;;; Aironfaar mod END

_OaksAideGotItemText::
	text "<PLAYER> got the"
	line "@"
	text_ram wOaksAideRewardItemName
	text "!@"
	text_end

_OaksAideNoRoomText::
	text "Oh! I see you"
	line "don't have any"
	cont "room for the"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done

_ConversionEnteredAttackModeText::
	text "<USER>"
	line "converted to"
	cont "ATTACK mode!"
	prompt

_ConversionEnteredDefenseModeText::
	text "<USER>"
	line "converted to"
	cont "DEFENSE mode!"
	prompt

_ConversionAlreadyDefenseModeText::
	text "<USER> is"
	line "already in"
	cont "DEFENSE mode."
	prompt

