if alarm[0] > -1 {
	var scale = power(setTransitionTime-alarm[0], 2)/4
	//var xCenter = camera_get_view_x(view_camera[0])
	//var yCenter = 0
	
	draw_set_color(c_red)
	draw_circle(xFade, yFade, scale, false)
}