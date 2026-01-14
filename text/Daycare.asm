_DaycareIntroText:: ; Aironfaar mod: renamed all instances of DaycareGentleman in file to Daycare, uses a different sprite now
	text "We run a DAYCARE." ; Aironfaar mod: it's two people now! Made according changes accross the entire file.
	line "Would you like us" ; Aironfaar mod
	cont "to raise one of"
	cont "your #MON?"
	done

_DaycareWhichMonText::
	text "Which #MON"
	line "should we raise?" ; Aironfaar mod
	prompt

_DaycareWillLookAfterMonText::
	text "Fine, we'll look" ; Aironfaar mod
	line "after @"
	text_ram wNameBuffer
	text_start
	cont "for a while."
	prompt

_DaycareComeSeeMeInAWhileText::
	text "Come see us in" ; Aironfaar mod
	line "a while."
	done

_DaycareMonHasGrownText::
	text "Your @"
	text_ram wNameBuffer
	text_start
	line "has grown a lot!"

	para "By level, it's"
	line "grown by @"
	text_decimal wDayCareNumLevelsGrown, 1, 3
	text "!"

	para "Aren't we great?" ; Aironfaar mod
	prompt

_DaycareOweMoneyText::
	text "You owe us ¥@" ; Aironfaar mod
	text_bcd wDayCareTotalCost, 2 | LEADING_ZEROES | LEFT_ALIGN
	text_start
	line "for the return"
	cont "of this #MON."
	done

_DaycareGotMonBackText::
	text "<PLAYER> got"
	line "@"
	text_ram wDayCareMonName
	text " back!"
	done

_DaycareMonNeedsMoreTimeText::
	text "Back already?"
	line "Your @"
	text_ram wNameBuffer
	text_start
	cont "needs some more"
	cont "time with us." ; Aironfaar mod
	prompt

;;; Aironfaar mod start: Move Reminder dialogue
_MoveReminderGreetingText::
	text "We help #MON"
	line "remember moves."
	
	para "¥5000 per lesson."
	line "How about it?"
	done

_MoveReminderSaidYesText::
	text "Which #MON"
	line "should we tutor?"
	prompt

_MoveReminderNotEnoughMoneyText::
	text "Hmm<...>"
	
	para "You don't have"
	line "enough money."
	done

_MoveReminderWhichMoveText::
	text "Which move should"
	line "it remember?"
	done

_MoveReminderByeText::
	text "If any of your"
	line "#MON need to"
	cont "remember a move,"
	cont "drop by again!"
	done

_MoveReminderNoMovesText::
	text "This #MON"
	line "hasn't forgotten"
	cont "any moves."
	done
;;; Aironfaar mod end
