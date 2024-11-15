; PureRGBnote: CHANGED: different prize pokemon and TMs

PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db JYNX
	db ELECTABUZZ
	db TANGELA
	db "@"

PrizeMenuMon1Cost:
	bcd2 500
	bcd2 500
	bcd2 500
	db "@"

PrizeMenuMon2Entries:
	db DRATINI
	db DITTO
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
	bcd2 2000
	bcd2 1000
	bcd2 3000 ; Aironfaar mod
	db "@"

PrizeMenuTMsEntries:
	db DOME_FOSSIL ; Aironfaar mod
	db HELIX_FOSSIL ; Aironfaar mod
	db OLD_AMBER ; Aironfaar mod
	db "@"

PrizeMenuTMsCost:
	bcd2 5000 ; Aironfaar mod
	bcd2 5000 ; Aironfaar mod
	bcd2 5000 ; Aironfaar mod
	db "@"
