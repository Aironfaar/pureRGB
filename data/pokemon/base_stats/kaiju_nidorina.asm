;;; Aironfaar mod: new variant mon
	db DEX_NIDORINA ; pokedex id

	db  70,  55,  62,  56,  67
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 120 ; catch rate
	db 117 ; base exp

	INCBIN "gfx/pokemon/front_alt/kaiju_nidorina.pic", 0, 1 ; sprite dimensions
	dw KaijuNidorinaPicFront, KaijuNidorinoaPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
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
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	REST,\
	MIMIC,\
	HEADBUTT,\
	SUBMISSION,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(KaijuNidorinaPicFront)
	db 0
	db BANK(KaijuNidorinoaPicBack)
	db BANK(KaijuNidorinoaPicBack)

	dw 0, KaijuNidorinoaPicBack

