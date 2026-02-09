_DexCompletionText::
	text "#DEX comp-"
	line "letion is:"

	para "@"
	text_decimal hDexRatingNumMonsSeen, 1, 3
	text " #MON seen"
	line "@"
	text_decimal hDexRatingNumMonsOwned, 1, 3
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	prompt

_DexRatingText_Own0To9::
	text "You still have"
	line "lots to do."
	cont "Look for #MON"
	cont "in grassy areas!"
	done

_DexRatingText_Own10To19::
	text "You're on the"
	line "right track!"
;;; Aironfaar mod start
	cont "Have you met my"
	cont "AIDEs in the"
	cont "field yet?"
;;; Aironfaar mod end
	done

_DexRatingText_Own20To29::
	text "You still need"
	line "more #MON!"
	cont "Try to catch"
	cont "other species!"
	done

_DexRatingText_Own30To39::
	text "Good, you're"
	line "trying hard!"
;;; Aironfaar mod start
	cont "If you help with"
	cont "my AIDEs' field"
	cont "research, they"
	cont "will help you"
	cont "in turn!"
;;; Aironfaar mod end
	done

_DexRatingText_Own40To49::
	text "Very good!"
	line "Go fish for some"
	cont "marine #MON!"
	done

_DexRatingText_Own50To59::
	text "Ho! This is"
	line "getting even"
	cont "better!"
	done

_DexRatingText_Own60To69::
	text "Wonderful!"
	line "Do you like to"
	cont "collect things?"
	done

_DexRatingText_Own70To79::
	text "Looking good!"
;;; Aironfaar mod start
	line "You probably have"
	cont "a lot of #MON"
	cont "by now that you"
	cont "need to train so"
	cont "they can evolve."
;;; Aironfaar mod end
	done

_DexRatingText_Own80To89::
;;; Aironfaar mod start
	text "You finally got"
	line "past the halfway"
	cont "point!"
	cont "The BOOSTER CHIP"
	cont "that my AIDEs are"
	cont "developing should"
	cont "help a lot with"
	cont "your #MON's"
	cont "training!"
;;; Aironfaar mod end
	done

_DexRatingText_Own90To99::
	text "I'm impressed!"
	line "It must have been"
	cont "difficult to do!"
	done

_DexRatingText_Own100To109::
	text "I can't believe"
	line "how good you are!"
	para "You finally got at"
	line "least 100 species!"
	done

_DexRatingText_Own110To119::
	text "You even have the"
	line "evolved forms of"
	cont "#MON! Super!"
	done

_DexRatingText_Own120To129::
	text "Excellent! Trade"
	line "with friends to"
	cont "get some more!"
	done

_DexRatingText_Own130To139::
	text "Outstanding!"
	line "You've become a"
	cont "real pro at this!"
	done

_DexRatingText_Own140To149::
	text "I have nothing"
	line "left to say!"
	cont "You're the"
	cont "authority now!"
	done

_DexRatingText_Own150To151::
	text "Congratulations!"
	para "Your #DEX is"
	line "entirely complete!"
	done
