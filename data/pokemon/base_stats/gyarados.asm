	db DEX_GYARADOS ; pokedex id

	db  95, 125,  79,  81, 100
	;   hp  atk  def  spd  spc

	db WATER, FLYING ; type
	db 45 ; catch rate
	db 214 ; base exp

	INCBIN "gfx/pokemon/front/gyarados.pic", 0, 1 ; sprite dimensions
	dw GyaradosPicFront, GyaradosPicBackSW

	db TACKLE, BUBBLE, SPLASH, NO_MOVE ; level 1 learnset ; Aironfaar mod
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	DRAGON_RAGE,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	KINESIS,\ ; FIREWALL
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	GLARE,\
	SUBSTITUTE,\
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	WHIRLWIND,\ ; Aironfaar mod
	RAGE,\ ; Aironfaar mod
	FLY,\ ; Aironfaar mod
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(GyaradosPicFront)
	db 0
	db BANK(GyaradosPicBack)
	db BANK(GyaradosPicBackSW)

	dw 0, GyaradosPicBack

