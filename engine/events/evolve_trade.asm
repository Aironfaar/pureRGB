InGameTrade_CheckForTradeEvo:
; In Japanese Blue, TradeMons include a Graveler and a Haunter,
; both of which have Japanese names that start with "ゴ",
; which is what this routine originally checked in that game.
; For English Red and Blue, this routine was adjusted for
; Graveler's English name and Haunter's early English name "Spectre".
; The final release replaced Graveler and Haunter in TradeMons.
;;; Aironfaar mod start: in-game trades are entirely changed, so the check logic had to be adapted
	ld a, [wInGameTradeReceiveMonSpecies]
	cp GRAVELER
	jr z, .nameMatched
	cp HAUNTER
	jr z, .nameMatched
	cp KADABRA
	jr z, .nameMatched
	cp MACHOKE
	ret nz
;;; Aironfaar mod end
.nameMatched
	ld a, [wPartyCount]
	dec a
	ld [wWhichPokemon], a
	ld a, TRUE
	ld [wForceEvolution], a
	ld a, LINK_STATE_TRADING
	ld [wLinkState], a
	callfar TryEvolvingMon
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
	jp PlayDefaultMusic
