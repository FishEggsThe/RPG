if alarm[0] > -1 {
	var scale = power(setTransitionTime-alarm[0], 2)/4
	//var xCenter = camera_get_view_x(view_camera[0])
	//var yCenter = 0
	
	draw_set_color(c_red)
	draw_circle(xFade, yFade, scale, false)
} else {
	percent += 1/30
	if percent >= 1 {percent--}
	for(var i = 0; i < array_length(enemyList); i++) {
		var xPos = (room_width/2)//+animcurve_channel_evaluate(curves[i], percent)
		var yPos = (room_height/2)-animcurve_channel_evaluate(curves[i], percent)
		draw_sprite(enemyList[i].battleSprite, 0, xPos, yPos)
	}
}