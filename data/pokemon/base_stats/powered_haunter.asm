	db DEX_HAUNTER ; pokedex id

	db  60, 110,  60, 135,  60 ; Aironfaar mod
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 45 ; catch rate
	db 190 ; base exp

	INCBIN "gfx/pokemon/front/powered_haunter.pic", 0, 1 ; sprite dimensions ; Aironfaar mod
	dw PoweredHaunterPicFront, HaunterPicBackSW

	db LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\ ; FIREWALL
	BIDE,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	LOVELY_KISS,\
	PSYBEAM,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	METRONOME,\ ; Aironfaar mod
	DREAM_EATER,\ ; Aironfaar mod
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(PoweredHaunterPicFront)
	db 0
	db BANK(HaunterPicBack)
	db BANK(HaunterPicBackSW)

	dw 0, HaunterPicBack

