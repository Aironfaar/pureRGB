	db DEX_KADABRA ; pokedex id

	db  40,  35,  30, 105, 120
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 100 ; catch rate
	db 145 ; base exp

	INCBIN "gfx/pokemon/front/kadabra.pic", 0, 1 ; sprite dimensions
	dw KadabraPicFront, KadabraPicBackSW

	db TELEPORT, PSYWAVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	ROLLING_KICK,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SUBSTITUTE,\
	TELEPORT,\ ; Aironfaar mod
	RECOVER,\ ; Aironfaar mod
	REST,\ ; Aironfaar mod
	MIMIC,\ ; Aironfaar mod
	METRONOME,\ ; Aironfaar mod
	TRI_ATTACK,\ ; Aironfaar mod
	FLASH
	; end

	db BANK(KadabraPicFront)
	db BANK(KadabraPicFrontAlt)
	db BANK(KadabraPicBack)
	db BANK(KadabraPicBackSW)

	dw KadabraPicFrontAlt, KadabraPicBack

