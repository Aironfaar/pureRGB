	object_const_def
;;; Aironfaar mod start
	const_export CINNABARLABTRADEROOM_SCIENTIST1
	const_export CINNABARLABTRADEROOM_SCIENTIST2
	const_export CINNABARLABTRADEROOM_SCIENTIST3
	const_export CINNABARLABTRADEROOM_SCIENTIST4
;;; Aironfaar mod end

CinnabarLabTradeRoom_Object:
	db $17 ; border block

	def_warp_events
	warp_event  2,  7, CINNABAR_LAB, 3
	warp_event  3,  7, CINNABAR_LAB, 3

	def_bg_events
	bg_event  3,  0, TEXT_CINNABARLABTRADEROOM_POSTER

	def_object_events
;;; Aironfaar mod start
	object_event  4,  7, SPRITE_SCIENTIST, STAY, LEFT, TEXT_CINNABARLABTRADEROOM_SCIENTIST1
	object_event  3,  2, SPRITE_SCIENTIST, STAY, DOWN, TEXT_CINNABARLABTRADEROOM_SCIENTIST2
	object_event  1,  4, SPRITE_SCIENTIST, WALK, ANY_DIR, TEXT_CINNABARLABTRADEROOM_SCIENTIST3
	object_event  5,  5, SPRITE_SCIENTIST, STAY, UP, TEXT_CINNABARLABTRADEROOM_SCIENTIST4
;;; Aironfaar mod end

	def_warps_to CINNABAR_LAB_TRADE_ROOM
