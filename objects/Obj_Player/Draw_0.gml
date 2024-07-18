var sprFrame = 1 - floor((moveTimeSet - moveTime)/(moveTimeSet/2))
draw_sprite(leaderSprites[facing], sprFrame, x, y)

if global.debug {
	draw_set_color(c_red)
	draw_text(x, y, facing)
	draw_circle(drawXFace, drawYFace, 28, true)
}