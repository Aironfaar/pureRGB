SeaRoutesWildMons:
	def_grass_wildmons 20 ; encounter rate
;;;;;;;;;; Aironfaar mod CHANGED: Missingno. encounters at various levels
	db 40, MISSINGNO
	db 45, MISSINGNO
	db 75, MISSINGNO
	db 60, MISSINGNO
	db 60, MISSINGNO
	db 80, MISSINGNO
	db 80, MISSINGNO
	db 120, MISSINGNO
	db 100, MISSINGNO
	db 100, MISSINGNO
;;;;;;;;;; Aironfaar mod END
	end_grass_wildmons

	def_water_wildmons 7 ; encounter rate
	db 32, TENTACOOL
	db 30, TENTACOOL
	db 28, HORSEA
	db 30, STARYU
	db 31, HORSEA
	db 30, STARYU
	db 35, MAGIKARP
	db 25, GYARADOS
	db 32, TENTACRUEL
	db 36, TENTACRUEL
	end_water_wildmons
