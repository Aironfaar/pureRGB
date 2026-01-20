;;; Aironfaar mod: new variant mon
	db DEX_NIDOQUEEN ; pokedex id

	db  90,  75,  82,  76,  87
	;   hp  atk  def  spd  spc

	db POISON, DRAGON ; type
	db 45 ; catch rate
	db 194 ; base exp

	INCBIN "gfx/pokemon/front_alt/kaiju_nidoqueen.pic", 0, 1 ; sprite dimensions
	dw KaijuNidoqueenPicFront, KaijuNidomonarchPicBack

	db TACKLE, GROWL, STOMP, NO_MOVE ; level 1 learnset
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
	LOVELY_KISS,\
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
	SUBMISSION,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(KaijuNidoqueenPicFront)
	db 0
	db BANK(KaijuNidomonarchPicBack)
	db BANK(KaijuNidomonarchPicBack)

	dw 0, KaijuNidomonarchPicBack

