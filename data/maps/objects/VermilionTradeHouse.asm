	object_const_def
	const_export VERMILIONTRADEHOUSE_COOLTRAINER_F ; Aironfaar mod

VermilionTradeHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 8
	warp_event  3,  7, LAST_MAP, 8

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_COOLTRAINER_F, STAY, UP, TEXT_VERMILIONTRADEHOUSE_COOLTRAINER_F ; Aironfaar mod

	def_warps_to VERMILION_TRADE_HOUSE
