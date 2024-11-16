Route1_Script:
	jp EnableAutoTextBoxDrawing

Route1_TextPointers:
	def_text_pointers
	dw_const Route1Youngster1Text, TEXT_ROUTE1_YOUNGSTER1
	dw_const Route1Youngster2Text, TEXT_ROUTE1_YOUNGSTER2
	dw_const Route1StarterSwapperText, TEXT_ROUTE1_STARTER_SWAPPER ; Aironfaar mod
	dw_const Route1SignText,       TEXT_ROUTE1_SIGN

Route1Youngster1Text:
	text_asm
	CheckAndSetEvent EVENT_GOT_POTION_SAMPLE
	jr nz, .got_item
	ld hl, .MartSampleText
	rst _PrintText
	lb bc, ITEM_ROUTE_1_MART_SAMPLE, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .GotPotionText
	jr .done
.bag_full
	ld hl, .NoRoomText
	jr .done
.got_item
	ld hl, .AlsoGotPokeballsText
.done
	rst _PrintText
	rst TextScriptEnd

.MartSampleText:
	text_far _Route1Youngster1MartSampleText
	text_end

.GotPotionText:
	text_far _Route1Youngster1GotPotionText
	sound_get_item_1
	text_end

.AlsoGotPokeballsText:
	text_far _Route1Youngster1AlsoGotPokeballsText
	text_end

.NoRoomText:
	text_far _Route1Youngster1NoRoomText
	text_end

Route1Youngster2Text:
	text_far _Route1Youngster2Text
	text_end

;;;;;;;;;; Aironfaar mod ADDED: NPC that allows you to swap your starter for a Dratini until you get the pokedex, evolve it, or otherwise lose Bulbasaur, Charmander or Squirtle
Route1StarterSwapperText:
	text_asm
	call SaveScreenTilesToBuffer2
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .gotPokedex
	CheckEvent EVENT_STARTER_SWAP_DONE
	jr nz, .regret
	CheckEvent EVENT_STARTER_SWAP_MET
	jr nz, .metSwapper
	SetEvent EVENT_STARTER_SWAP_MET
	ld hl, Route1StarterSwapIntroText
	jr .checkSwap
.metSwapper
	ld hl, Route1StarterSwapRepeatText
.checkSwap
	rst _PrintText
	ld d, STARTER1
	call .checkStarter
	jr c, .canSwap
	ld d, STARTER2
	call .checkStarter
	jr c, .canSwap
	ld d, STARTER3
	call .checkStarter
	jr c, .canSwap
	ld hl, Route1StarterSwapEvolvedText
	jr .done
.gotPokedex
	CheckEvent EVENT_STARTER_SWAP_DONE
	jr nz, .didSwap
	ld hl, Route1StarterSwapMissedText
	jr .done
.regret
	ld hl, Route1StarterSwapRegretText
	jr .done
.canSwap
	ld hl, Route1StarterSwapRequestText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	xor a
	ld [wUpdateSpritesEnabled], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jr c, .no
	ld hl, Route1StarterSwapAcceptedText
	rst _PrintText
	ld a, [wCurPartySpecies]
	call PlayCry
	ld hl, Route1StarterSwapTreatText
	rst _PrintText
	lb bc, DRATINI, 5
	call GivePokemonRandomPalette
	xor a
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	SetEvent EVENT_STARTER_SWAP_DONE
	rst TextScriptEnd
.no
	ld hl, Route1StarterSwapDeniedText
	jr .done
.didSwap
	ld a, [wPlayerStarter]
	cp STARTER3
	ld hl, Route1StarterSwapBulbasaurText
	jr z, .done
	cp STARTER2
	ld hl, Route1StarterSwapSquirtleText
	jr z, .done
	ld hl, Route1StarterSwapCharmanderText
.done
	rst _PrintText
	rst TextScriptEnd
.checkStarter
	jpfar FindPokemonInParty

Route1StarterSwapIntroText:
	text_far _Route1StarterSwapIntroText
	text_end

Route1StarterSwapRepeatText:
	text_far _Route1StarterSwapRepeatText
	text_end

Route1StarterSwapEvolvedText:
	text_far _Route1StarterSwapEvolvedText
	text_end

Route1StarterSwapRequestText:
	text_far _Route1StarterSwapRequestText
	text_end

Route1StarterSwapAcceptedText:
	text_far _Route1StarterSwapAcceptedText
	text_end

Route1StarterSwapTreatText:
	text_far _Route1StarterSwapTreatText
	text_end

Route1StarterSwapDeniedText:
	text_far _Route1StarterSwapDeniedText
	text_end

Route1StarterSwapRegretText:
	text_far _Route1StarterSwapRegretText
	text_end

Route1StarterSwapBulbasaurText:
	text_far _Route1StarterSwapBulbasaurText
	text_end

Route1StarterSwapSquirtleText:
	text_far _Route1StarterSwapSquirtleText
	text_end

Route1StarterSwapCharmanderText:
	text_far _Route1StarterSwapCharmanderText
	text_end

Route1StarterSwapMissedText:
	text_far _Route1StarterSwapMissedText
	text_end
;;;;;;;;;; Aironfaar mod END

Route1SignText:
	text_far _Route1SignText
	text_end
