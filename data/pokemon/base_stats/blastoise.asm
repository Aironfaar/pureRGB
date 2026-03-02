	db DEX_BLASTOISE ; pokedex id

	db  79,  83, 100,  78,  85
	;   hp  atk  def  spd  spc

	db WATER, ELECTRIC ; type ; Aironfaar mod
	db 45 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/front/blastoise.pic", 0, 1 ; sprite dimensions
	dw BlastoisePicFront, BlastoisePicBackSW

	db TACKLE, TAIL_WHIP, THUNDERPUNCH, NO_MOVE ; level 1 learnset ; Aironfaar mod
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
	THUNDERBOLT,\ ; Aironfaar mod
	THUNDER,\ ; Aironfaar mod
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
	THUNDER_WAVE,\ ; Aironfaar mod
	GLARE,\
	SUBSTITUTE,\
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	FISSURE,\ ; Aironfaar mod
	HEADBUTT,\ ; Aironfaar mod
	COUNTER,\ ; DRAIN PUNCH ; Aironfaar mod
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH

	db BANK(BlastoisePicFront)
	db BANK(BlastoisePicFrontAlt)
	db BANK(BlastoisePicBack)
	db BANK(BlastoisePicBackSW)

	dw BlastoisePicFrontAlt, BlastoisePicBack

