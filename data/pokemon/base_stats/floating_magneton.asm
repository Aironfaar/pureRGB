	db DEX_MAGNETON ; pokedex id

	db  65,  60,  95,  70, 120
	;   hp  atk  def  spd  spc

	db ELECTRIC, FLOATING ; type
	db 60 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/front/magneton.pic", 0, 1 ; sprite dimensions
	dw FloatingMagnetonPicFront, FloatingMagnetonPicBackSW ; Aironfaar mod

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	CRABHAMMER,\
	KINESIS,\ ; FIREWALL
	REFLECT,\
	BIDE,\
	BARRAGE,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	SUBSTITUTE,\
	TELEPORT,\ ; Aironfaar mod
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	SELFDESTRUCT,\ ; Aironfaar mod
	EXPLOSION,\ ; Aironfaar mod
	TRI_ATTACK,\ ; Aironfaar mod
	FLASH
	; end

	db BANK(FloatingMagnetonPicFront) ; Aironfaar mod
	db 0
	db BANK(MagnetonPicBack)
	db BANK(FloatingMagnetonPicBackSW) ; Aironfaar mod

	dw 0, MagnetonPicBack

