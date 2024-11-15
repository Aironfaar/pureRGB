	db DEX_VOLTORB ; pokedex id

	db  40,  30,  50, 100,  55
	;   hp  atk  def  spd  spc

	db ELECTRIC, FIRE ; type
	db 190 ; catch rate
	db 103 ; base exp

	INCBIN "gfx/pokemon/front/voltorb.pic", 0, 1 ; sprite dimensions
	dw VoltorbPicFront, VoltorbPicBackSW

	db TACKLE, THUNDERSHOCK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	AMNESIA,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	CRABHAMMER,\
	MEGA_DRAIN,\
	KINESIS,\ ; FIREWALL
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	TELEPORT,\ ; Aironfaar mod
	RECOVER,\ ; Aironfaar mod
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	SELFDESTRUCT,\ ; Aironfaar mod
	EXPLOSION,\ ; Aironfaar mod
	EGG_BOMB,\ ; Aironfaar mod
	FLASH
	; end


	db BANK(VoltorbPicFront)
	db BANK(VoltorbPicFrontAlt)
	db BANK(VoltorbPicBack)
	db BANK(VoltorbPicBackSW)

	dw VoltorbPicFrontAlt, VoltorbPicBack

