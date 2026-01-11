	db DEX_ARBOK ; pokedex id

	db  85,  95,  69,  96,  70
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 90 ; catch rate
	db 147 ; base exp

	INCBIN "gfx/pokemon/front/arbok.pic", 0, 1 ; sprite dimensions
	dw ArbokPicFront, ArbokPicBackSW

	db WRAP, LEER, POISON_STING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	BARRIER,\
	DRAGON_RAGE,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	KINESIS,\ ; FIREWALL
	SWORDS_DANCE,\
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
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	FISSURE,\ ; Aironfaar mod
	LEECH_LIFE,\ ; Aironfaar mod
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(ArbokPicFront)
	db 0
	db BANK(ArbokPicBack)
	db BANK(ArbokPicBackSW)

	dw 0, ArbokPicBack
