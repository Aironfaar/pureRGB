;;; Aironfaar mod: new variant mon
	db DEX_VENUSAUR ; pokedex id

	db  80,  82,  83,  80, 100
	;   hp  atk  def  spd  spc

	db GRASS, ROCK ; type
	db 45 ; catch rate
	db 208 ; base exp

	INCBIN "gfx/pokemon/front/stone_venusaur.pic", 0, 1 ; sprite dimensions
	dw StoneVenusaurPicFront, StoneVenusaurPicBackSW

	db TACKLE, GROWL, SKULL_BASH, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\ 
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	ROLLING_KICK,\
	BARRIER, \
	RAZOR_LEAF,\
	SOLARBEAM,\
	DRAGON_RAGE,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	MEDITATE,\
	LIGHT_SCREEN,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	FISSURE,\ ; Aironfaar mod
	CUT,\
	SURF,\ ; Aironfaar mod
	STRENGTH,\
	FLASH
	; end

	db BANK(StoneVenusaurPicFront)
	db 0
	db BANK(StoneVenusaurPicBack)
	db BANK(StoneVenusaurPicBackSW)

	dw 0, StoneVenusaurPicBack

