	object_const_def
	const_export DAYCARE_GENTLEMAN

Daycare_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 5
	warp_event  3,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_GENTLEMAN, STAY, LEFT, TEXT_MOVEREMINDER ; Aironfaar mod: Move Reminder
	object_event  5,  4, SPRITE_BALDING_GUY, STAY, LEFT, TEXT_DAYCARE ; Aironfaar mod: sit on same side, different sprite

	def_warps_to DAYCARE
