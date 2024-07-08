function DrawItemsText(){
	// idk
}

function DrawChoiceText(){
	// i'll do it later maybe
}

function LayerDescription(desc){
	var layeredDesc = desc
	if string_length(desc) > 33 {
		layeredDesc = ""; var stringPos = 1
		var splitDesc = string_split(desc, " ")
		
		for(var i = 0; i < array_length(splitDesc); i++) {
			//show_message(string_copy(layeredDesc, stringPos, 33))
			if string_length(string_copy(layeredDesc, stringPos, 33)+splitDesc[i]) > 33 {
				layeredDesc += "\n"
				stringPos += 35
			}
			layeredDesc += (splitDesc[i]+" ")
		}
	}
	return string_trim(layeredDesc)
}