	db DEX_GEODUDE ; pokedex id

	db  40,  80, 100,  20,  30
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 255 ; catch rate
	db 86 ; base exp

	INCBIN "gfx/pokemon/front/geodude.pic", 0, 1 ; sprite dimensions
	dw GeodudePicFront, GeodudePicBackSW

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	THUNDERPUNCH,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	MEDITATE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	METRONOME,\ ; Aironfaar mod
	FISSURE,\ ; Aironfaar mod
	SELFDESTRUCT,\ ; Aironfaar mod
	EXPLOSION,\ ; Aironfaar mod
	HEADBUTT,\ ; Aironfaar mod
	COUNTER,\ ; DRAIN PUNCH ; Aironfaar mod
	CUT,\
	STRENGTH
	; end


	db BANK(GeodudePicFront)
	db 0
	db BANK(GeodudePicBack)
	db BANK(GeodudePicBackSW)

	dw 0, GeodudePicBack

