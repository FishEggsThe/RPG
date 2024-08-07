var acceptInput = input_check_pressed("accept")
var cancelInput = input_check_pressed("cancel")
	
var horiInput = input_check_pressed("right") - input_check_pressed("left")
var vertInput = input_check_pressed("down") - input_check_pressed("up")

if room == Rm_Battle {
	switch(menuSpot) {
		case 0:
			if horiInput != 0 {menuIndex += horiInput}
			var options = array_length(battleOptions)
			if menuIndex >= options {menuIndex-=options}
			else if menuIndex < 0 {menuIndex+=options}
			
			if acceptInput {
				switch(menuIndex) {
					case 0:
						show_message("Attack")
					case 1:
						show_message("Spell Menu")
					case 2:
						show_message("Item Menu")
					case 3:
						show_message("fuckin pussy")
				}
			}
			if cancelInput {show_message("bruh")}
			break
	}
}