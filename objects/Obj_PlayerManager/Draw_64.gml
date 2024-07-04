var width = display_get_gui_width()
var height = display_get_gui_height()

if inventoryUp {
	draw_set_color(c_black)
	draw_rectangle(width/6, height*2/6, width*5/6, height*4/6, false)
	
	var acceptInput = input_check_pressed("accept")
	var cancelInput = input_check_pressed("cancel")
	
	var horiInput = input_check_pressed("right") - input_check_pressed("left")
	var vertInput = input_check_pressed("down") - input_check_pressed("up")
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(20+width/6, 20+height*2/6, string(inventorySpot) + " " + string(inventoryIndex))
	
	
	switch(inventorySpot) {
		case 0:
			for(var i = 0; i < array_length(menuOptions); i++) {
				var offset = (width/4)+i*(width/2)
				draw_text(offset, height/2, menuOptions[i])
			}
			break
		case 1:
			draw_text(width/2, height/2, "Inventory")
			break
		case 2:
			draw_text(width/2, height/2, "Key Items")
			break
	}
}