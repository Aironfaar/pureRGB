;;; Aironfaar mod: new variant mon
	db DEX_NIDOKING ; pokedex id

	db  77,  92,  75,  81,  85
	;   hp  atk  def  spd  spc

	db POISON, DRAGON ; type
	db 65 ; catch rate
	db 195 ; base exp

	INCBIN "gfx/pokemon/front_alt/kaiju_nidoking.pic", 0, 1 ; sprite dimensions
	dw KaijuNidokingPicFront, KaijuNidomonarchPicBack

	db TACKLE, LEER, THRASH, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	DIG,\
	KINESIS,\ ; FIREWALL
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	REST,\
	MIMIC,\
	FISSURE,\
	WHIRLWIND,\
	TRI_ATTACK,\
	HEADBUTT,\
	PAY_DAY,\
	RAGE,\
	COUNTER,\ ; DRAIN PUNCH
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(KaijuNidokingPicFront)
	db 0
	db BANK(KaijuNidomonarchPicBack)
	db BANK(KaijuNidomonarchPicBack)

	dw 0, KaijuNidomonarchPicBack

