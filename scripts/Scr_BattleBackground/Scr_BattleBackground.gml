function BattleBackgroundData(_sprite, _progress, _length, _frequency, _horizontal, _split, _ripple) constructor {
	battleBackground = _sprite
	var uv = sprite_get_uvs(battleBackground, 0)
	uv_width = uv[2]-uv[0]; uv_height = uv[3]-uv[1]
	
	progress = _progress
	length = _length
	frequency = _frequency

	horizontal = _horizontal
	split = _split
	ripple = _ripple
}

function FillBackgroundStorage() {
	// Noxious Gas
	var currentBackground = [new BattleBackgroundData(Spr_Lines, 1/5000, 1.5, 1, 1, 1, 0),
							 new BattleBackgroundData(Spr_Lines, 1/6000, 2.5, 1, 1, 1, 0)]
	ds_list_add(backgroundStorage, currentBackground)
	
	// Noxious Fog
	currentBackground = [new BattleBackgroundData(Spr_Lines2, 1/5000, 1.5, 1, 0, 0, 0),
						 new BattleBackgroundData(Spr_Lines2, 1/6000, 1.5, 1, 1, 1, 0)]
	ds_list_add(backgroundStorage, currentBackground)
	
	// Cyberspace Ocean
	currentBackground = [new BattleBackgroundData(Spr_BattlePolka, 1/5000, 1.5, 1, 0, 1, 1),
						 new BattleBackgroundData(Spr_BattlePolka, 1/6000, 1.5, 1, 1, 0, 1)]
	ds_list_add(backgroundStorage, currentBackground)
	
	// Stretchy Cheesy Goop
	currentBackground = [new BattleBackgroundData(Spr_Squash, 1/5000, 1.5, 1, 1, 0, 1)]
	ds_list_add(backgroundStorage, currentBackground)
	
	// Third Strongest
	currentBackground = [new BattleBackgroundData(Spr_NoThree, 1/2500, 0.35, 0.75, 1, 0, 1)]
	ds_list_add(backgroundStorage, currentBackground)
	
	// Boiling Point
	currentBackground = [new BattleBackgroundData(Spr_WaveFunk, 1/2500, 1, 5, 1, 0, 0),
						 new BattleBackgroundData(Spr_WaveFunk, 1/5000, 3, 5, 0, 1, 0)]
	ds_list_add(backgroundStorage, currentBackground)
	
	// Couch Pattern
	currentBackground = [new BattleBackgroundData(Spr_Couch1, 1/5000, 1.5, 0.5, 1, 0, 0),
						 new BattleBackgroundData(Spr_Couch2, 1/6000, 1.5, 0.5, 1, 0, 0)]
	ds_list_add(backgroundStorage, currentBackground)
}