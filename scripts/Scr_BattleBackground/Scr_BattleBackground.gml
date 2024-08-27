function BattleBackgroundData(_sprite, _progress, _length, _frequency, _horizontal, _split, _ripple) constructor {
	battleBackground = _sprite
	
	progress = _progress
	length = _length
	frequency = _frequency

	horizontal = _horizontal
	split = _split
	ripple = _ripple
}

function FillBackgroundStorage() {
	var currentBackground = [new BattleBackgroundData(Spr_Lines, 1/5000, 1.5, 1, 1, 1, 0),
							 new BattleBackgroundData(Spr_Lines, 1/6000, 1.5, 1, 1, 1, 0)]
	ds_list_add(backgroundStorage, currentBackground)
	
	currentBackground = [new BattleBackgroundData(Spr_Lines2, 1/5000, 1.5, 1, 1, 1, 0),
						 new BattleBackgroundData(Spr_Lines2, 1/6000, 1.5, 1, 0, 0, 0)]
	ds_list_add(backgroundStorage, currentBackground)
	
	currentBackground = [new BattleBackgroundData(Spr_BattlePolka, 1/5000, 1.5, 1, 0, 1, 1),
						 new BattleBackgroundData(Spr_BattlePolka, 1/6000, 1.5, 1, 1, 0, 1)]
	ds_list_add(backgroundStorage, currentBackground)
	
	currentBackground = [new BattleBackgroundData(Spr_Squash, 1/5000, 1.5, 1, 1, 0, 1)]
	ds_list_add(backgroundStorage, currentBackground)
	
	currentBackground = [new BattleBackgroundData(Spr_NoThree, 1/4000, 0.35, 0.75, 0, 1, 1)]
	ds_list_add(backgroundStorage, currentBackground)
}