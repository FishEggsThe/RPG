if instance_number(Obj_Camera) > 1 {instance_destroy()}
else {
	view_width = 640
	view_height = 640
	window_scale = 2

	window_set_size(view_width*window_scale, view_height*window_scale)
	alarm[0] = 0

	surface_resize(application_surface, view_width*window_scale, view_height*window_scale)
}