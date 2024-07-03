#macro view view_camera[0]
camera_set_view_size(view, view_width, view_height)

if instance_exists(Obj_Player) {
	var halfViewWidth = camera_get_view_width(view) / 2;
	var halfViewHeight = camera_get_view_height(view) / 2;
	var xP = clamp(Obj_Player.x+32-halfViewWidth, 0, room_width)
	var yP = clamp(Obj_Player.y+32-halfViewHeight, 0, room_height)

	x = lerp(x, xP, 0.1);
	y = lerp(y, yP, 0.1);
	
	camera_set_view_pos(view, x, y)
}