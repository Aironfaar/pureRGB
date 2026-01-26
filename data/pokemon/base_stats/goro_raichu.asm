;;; Aironfaar mod: new variant mon
	db DEX_RAICHU ; pokedex id

	db  70,  90,  80,  90, 90
	;   hp  atk  def  spd  spc

	db ELECTRIC, DRAGON ; type
	db 95 ; catch rate
	db 122 ; base exp

	INCBIN "gfx/pokemon/front/goro_raichu.pic", 0, 1 ; sprite dimensions
	dw GoroRaichuPicFront, GoroRaichuPicBackSW

	db THUNDERSHOCK, GROWL, THUNDER_WAVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	AMNESIA,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	DRAGON_RAGE,\
	DIG,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	REST,\
	MIMIC,\
	PAY_DAY,\
	RAGE,\
	COUNTER,\ ; DRAIN PUNCH
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(GoroRaichuPicFront)
	db 0
	db BANK(GoroRaichuPicBack)
	db BANK(GoroRaichuPicBackSW)

	dw 0, GoroRaichuPicBack

