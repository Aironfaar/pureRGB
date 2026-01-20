	db DEX_JOLTEON ; pokedex id

	db  65,  65,  60, 130, 110
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 65 ; catch rate
	db 197 ; base exp

	INCBIN "gfx/pokemon/front/jolteon.pic", 0, 1 ; sprite dimensions
	dw JolteonPicFront, JolteonPicBackSW

	db TACKLE, SAND_ATTACK, THUNDERSHOCK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	HORN_DRILL,\ ; Aironfaar mod
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	ROLLING_KICK,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	MEDITATE,\ ; Aironfaar mod
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	TELEPORT,\ ; Aironfaar mod
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	TRI_ATTACK,\ ; Aironfaar mod
	HEADBUTT,\ ; Aironfaar mod
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(JolteonPicFront)
	db 0
	db BANK(JolteonPicBack)
	db BANK(JolteonPicBackSW)

	dw 0, JolteonPicBack

