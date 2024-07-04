var width = display_get_gui_width()
var height = display_get_gui_height()

if inventoryUp {
	draw_set_color(c_black)
	draw_rectangle(width/8, height/6, width*7/8, height*5/6, false)
	
	var acceptInput = input_check_pressed("accept")
	var cancelInput = input_check_pressed("cancel")
	
	var horiInput = input_check_pressed("right") - input_check_pressed("left")
	var vertInput = input_check_pressed("down") - input_check_pressed("up")
	var textSize = 3
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(20+width/8, 20+height/6, string(inventorySpot) + " " + string(inventoryIndex))
	
	
	switch(inventorySpot) {
		case 0:
			for(var i = 0; i < array_length(menuOptions); i++) {
				var offset = (width/4)+i*(width/2)
				draw_text_transformed(offset, height/2, menuOptions[i], textSize, textSize, 0)
				if inventoryIndex == i {
					var lineWidthHalf = textSize*string_width(menuOptions[i])/2
					var lineFloor = (height+(textSize*string_height(menuOptions[i]))/2)
					draw_line(offset-lineWidthHalf, lineFloor, offset+lineWidthHalf, lineFloor)
				}
			}
			break
			
		case 1:
			var arraySize = array_length(inventory)
			for(var i = 0; i < array_length(inventory); i++) {
				var xPos = (width*2/5)+floor((i/(arraySize/2)))*(width*2/5)
				var yPos = (height/6)+(i%(arraySize/2))*(height/6)+(height/6)
				
				var invName = (inventory[i] == noone ? "-" : inventory[i].name)
				draw_text_transformed(xPos, yPos, invName, textSize, textSize, 0)
				if inventoryIndex == i {
					var lineWidthHalf = textSize*string_width(invName)/2
					var lineFloor = (yPos+(textSize*string_height(invName))/2)
					draw_line(xPos-lineWidthHalf, lineFloor, xPos+lineWidthHalf, lineFloor)
				}
			}
			break
			
		case 2:
			draw_text_transformed(width/2, height/2, "Key Items", textSize, textSize, 0)
			break
	}
}