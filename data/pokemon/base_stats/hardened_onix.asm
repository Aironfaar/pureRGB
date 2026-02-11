; PureRGBnote: ADDED: powered up version of onix with better stats and less weaknesses.
	db DEX_ONIX ; pokedex id

	db  80,  85, 180,  80,  75
	;   hp  atk  def  spd  spc

	db CRYSTAL, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw HardenedOnixPicFront, HardenedOnixPicBackSW ; Aironfaar mod

	db TACKLE, SCREECH, HARDEN, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	AMNESIA,\
	HYPER_BEAM,\
	BARRIER,\
	DRAGON_RAGE,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	KINESIS,\ ; FIREWALL
	SWORDS_DANCE,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	LIGHT_SCREEN,\
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	FISSURE,\ ; Aironfaar mod
	SELFDESTRUCT,\ ; Aironfaar mod
	EXPLOSION,\ ; Aironfaar mod
	HEADBUTT,\ ; Aironfaar mod
	RAGE,\ ; Aironfaar mod
	CUT,\
	SURF,\
	STRENGTH
	; end

	db BANK(HardenedOnixPicFront) ; Aironfaar mod
	db 0 ; Aironfaar mod
	db BANK(OnixPicBack)
	db BANK(HardenedOnixPicBackSW) ; Aironfaar mod

	dw 0, OnixPicBack ; Aironfaar mod

