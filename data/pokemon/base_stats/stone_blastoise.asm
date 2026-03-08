;;; Aironfaar mod: new variant mon
	db DEX_BLASTOISE ; pokedex id

	db  79,  83, 100,  78,  85
	;   hp  atk  def  spd  spc

	db ICE, GHOST ; type
	db 45 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/front/stone_blastoise.pic", 0, 1 ; sprite dimensions
	dw StoneBlastoisePicFront, StoneBlastoisePicBackSW

	db TACKLE, TAIL_WHIP, ICE_PUNCH, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	REST,\
	MIMIC,\
	FISSURE,\
	HEADBUTT,\
	COUNTER,\ ; DRAIN PUNCH
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH

	db BANK(StoneBlastoisePicFront)
	db 0
	db BANK(StoneBlastoisePicBack)
	db BANK(StoneBlastoisePicBackSW)

	dw 0, StoneBlastoisePicBack

