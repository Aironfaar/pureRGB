;;; Aironfaar mod: new variant mon
	db DEX_CHARIZARD ; pokedex id

	db  78,  84,  78, 100,  85
	;   hp  atk  def  spd  spc

	db FIRE, DRAGON ; type
	db 45 ; catch rate
	db 209 ; base exp

	INCBIN "gfx/pokemon/front/stone_charizard.pic", 0, 1 ; sprite dimensions
	dw StoneCharizardPicFront, StoneCharizardPicBackSW

	db SCRATCH, GROWL, FIRE_PUNCH, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\ ; ROOST
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	KINESIS,\ ; FIREWALL
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	SOFTBOILED,\
	REST,\
	MIMIC,\
	EGG_BOMB,\
	RAGE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(StoneCharizardPicFront)
	db 0
	db BANK(StoneCharizardPicBack)
	db BANK(StoneCharizardPicBackSW)

	dw 0, StoneCharizardPicBack

