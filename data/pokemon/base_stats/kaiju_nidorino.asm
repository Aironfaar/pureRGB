;;; Aironfaar mod: new variant mon
	db DEX_NIDORINO ; pokedex id

	db  57,  72,  55,  61,  65
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 120 ; catch rate
	db 118 ; base exp

	INCBIN "gfx/pokemon/front/kaiju_nidorino.pic", 0, 1 ; sprite dimensions
	dw KaijuNidorinoPicFront, KaijuNidorinoaPicBackSW

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	ROLLING_KICK,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	REST,\
	MIMIC,\
	HEADBUTT,\
	RAGE,\
	COUNTER,\ ; DRAIN PUNCH
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(KaijuNidorinoPicFront)
	db 0
	db BANK(KaijuNidorinoaPicBack)
	db BANK(KaijuNidorinoaPicBackSW)

	dw 0, KaijuNidorinoaPicBack

