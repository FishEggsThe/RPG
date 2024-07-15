draw_self()
if global.debug {
	draw_set_color(c_red)
	draw_text(x, y, facing)
	draw_circle(drawXFace, drawYFace, 28, true)
}