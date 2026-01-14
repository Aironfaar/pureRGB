_DaycareAllRightThenText:: ; Aironfaar mod: renamed all instances of DaycareGentleman in file to Daycare, uses a different sprite now
	text "All right then,"
	line "@"
	text_end

;;; Aironfaar mod start: add some text to make saying no much less abrupt
_DaycareDontBeShyText::
	text "Don't be shy,"
	line "@"
	text_end
;;; Aironfaar mod end

_DaycareComeAgainText::
	text "come again!" ; Aironfaar mod: ! instead of .
	done

_DaycareNoRoomForMonText::
	text "You have no room"
	line "for this #MON!"
	done

_DaycareOnlyHaveOneMonText::
	text "You only have one"
	line "#MON with you."
	done

;_DaycareCantAcceptMonWithHMText::
;	text "I can't accept a"
;	line "#MON that"
;	cont "knows an HM move."
;	done

_DaycareHeresYourMonText::
	text "Thank you! Here's"
	line "your #MON!"
	prompt

_DaycareNotEnoughMoneyText::
	text "Hey, you don't"
	line "have enough ¥!"
	done
