; PureRGBnote: ADDED: some new overworld sprites were added, and are used if the option for enhanced sprites is turned on.
; overworld sprites
; SpriteSheetPointerTable indexes (see data/sprites/sprites.asm)
	const_def
	const SPRITE_NONE                      ; $00
	const SPRITE_RED                       ; $01
	const SPRITE_BLUE                      ; $02
	const SPRITE_OAK                       ; $03
	const SPRITE_YOUNGSTER                 ; $04
	const SPRITE_MONSTER                   ; $05
	const SPRITE_COOLTRAINER_F             ; $06
	const SPRITE_COOLTRAINER_M             ; $07
	const SPRITE_LITTLE_GIRL               ; $08
	const SPRITE_BIRD                      ; $09
	const SPRITE_MIDDLE_AGED_MAN           ; $0a
	const SPRITE_GAMBLER                   ; $0b
	const SPRITE_SUPER_NERD                ; $0c
	const SPRITE_GIRL                      ; $0d
	const SPRITE_HIKER                     ; $0e
	const SPRITE_BEAUTY                    ; $0f
	const SPRITE_GENTLEMAN                 ; $10
	const SPRITE_DAISY                     ; $11
	const SPRITE_BIKER                     ; $12
	const SPRITE_SAILOR                    ; $13
	const SPRITE_COOK                      ; $14
	const SPRITE_BIKE_SHOP_CLERK           ; $15
	const SPRITE_MR_FUJI                   ; $16
	const SPRITE_GIOVANNI                  ; $17
	const SPRITE_ROCKET                    ; $18
	const SPRITE_CHANNELER                 ; $19
	const SPRITE_WAITER                    ; $1a
	const SPRITE_SILPH_WORKER_F            ; $1b
	const SPRITE_MIDDLE_AGED_WOMAN         ; $1c
	const SPRITE_BRUNETTE_GIRL             ; $1d
	const SPRITE_LANCE                     ; $1e
	const SPRITE_QUADRUPED2                ; $1f
	const SPRITE_SCIENTIST                 ; $20
	const SPRITE_ROCKER                    ; $21
	const SPRITE_SWIMMER                   ; $22
	const SPRITE_SAFARI_ZONE_WORKER        ; $23
	const SPRITE_GYM_GUIDE                 ; $24
	const SPRITE_GRAMPS                    ; $25
	const SPRITE_CLERK                     ; $26
	const SPRITE_FISHING_GURU              ; $27
	const SPRITE_GRANNY                    ; $28
	const SPRITE_NURSE                     ; $29
	const SPRITE_LINK_RECEPTIONIST         ; $2a
	const SPRITE_SILPH_PRESIDENT           ; $2b
	const SPRITE_SILPH_WORKER_M            ; $2c
	const SPRITE_WARDEN                    ; $2d
	const SPRITE_CAPTAIN                   ; $2e
	const SPRITE_FISHER                    ; $2f
	const SPRITE_KOGA                      ; $30
	const SPRITE_GUARD                     ; $31
	const SPRITE_MOM                       ; $32
	const SPRITE_BALDING_GUY               ; $33
	const SPRITE_LITTLE_BOY                ; $34
	const SPRITE_GAMEBOY_KID               ; $35
	const SPRITE_FAIRY                     ; $36
	const SPRITE_AGATHA                    ; $37
	const SPRITE_BRUNO                     ; $38
	const SPRITE_LORELEI                   ; $39
	const SPRITE_BROCK                     ; $3a
	const SPRITE_MISTY                     ; $3b
	const SPRITE_LT_SURGE                  ; $3c
	const SPRITE_ERIKA                     ; $3d
	const SPRITE_SABRINA                   ; $3e
	const SPRITE_BLAINE                    ; $3f
	const SPRITE_SEEL                      ; $40
	const SPRITE_MONSTER2                  ; $41
	const SPRITE_CAT                       ; $42
	const SPRITE_BIRD2                     ; $43
	const SPRITE_PSYCHIC                   ; $44
	const SPRITE_FIGHTING                  ; $45
	const SPRITE_DAD                       ; $46
	const SPRITE_CHIEF                     ; $47
	const SPRITE_ARENA_ASSISTANT           ; $48
	const SPRITE_SUPER_NERD_SITTING        ; $49
	const SPRITE_BRUNETTE_GIRL_SITTING     ; $4a
	const SPRITE_MIDDLE_AGED_MAN_SITTING   ; $4b
	const SPRITE_MIDDLE_AGED_WOMAN_SITTING ; $4c
	const SPRITE_LITTLE_BOY_SITTING        ; $4d
	const SPRITE_COOLTRAINER_F_SITTING     ; $4e
	const SPRITE_GYM_GUIDE_SITTING         ; $4f
	const SPRITE_MOM_SITTING               ; $50
	const SPRITE_DAD_SITTING               ; $51
	const SPRITE_DAISY_SITTING             ; $52
	const SPRITE_OAK_SITTING               ; $53
	const SPRITE_AGATHA_SITTING            ; $54
	const SPRITE_GIOVANNI_SITTING          ; $55
	const SPRITE_BLUE_SITTING              ; $56
	const SPRITE_LAVA_SUIT                 ; $57
	const SPRITE_MONSTER_SWIMMING          ; $58
	const SPRITE_GRAVELER                  ; $59
	const SPRITE_NOTHING                   ; $5a
	const SPRITE_GHOST                     ; $5b
	const SPRITE_SNAKE                     ; $5c
	const SPRITE_MISSINGNO                 ; $5d ; Aironfaar mod (comments below this changed accordingly)
DEF FIRST_STILL_SPRITE EQU const_value
	const SPRITE_POKE_BALL                 ; $5e
	const SPRITE_FOSSIL                    ; $5f
	const SPRITE_BOULDER                   ; $60
	const SPRITE_PAPER                     ; $61
	const SPRITE_POKEDEX                   ; $62
	const SPRITE_CLIPBOARD                 ; $63
	const SPRITE_SNORLAX                   ; $64
	const SPRITE_OLD_AMBER                 ; $65
	const SPRITE_GAMBLER_ASLEEP            ; $66
	const SPRITE_MONSTER2_STILL            ; $67
	const SPRITE_POKE_BALL2			 	   ; $68
	const SPRITE_DARK_CHANNELER            ; $69
	const SPRITE_BOOMBOX                   ; $6a
	const SPRITE_NOTHING_STILL             ; $6b
	const SPRITE_SCUBA_DIVER               ; $6c
DEF NUM_SPRITES EQU const_value - 1