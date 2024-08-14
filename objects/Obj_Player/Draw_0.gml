var sprFrame = (moveTime > 0 ? floor((moveTimeSet - moveTime)/(moveTimeSet/2)) : 1)

for(var i = partySize-1; i >= 0; i--) {
	draw_sprite(partySprites[i][partyPos[i][2]], sprFrame, 
				partyPos[i][0], partyPos[i][1])
}
draw_sprite(leaderSprites[facing], sprFrame, x, y)

if global.debug {
	draw_set_color(c_red)
	draw_text(x, y, facing)
	draw_text(x, y+20, moveTime)
	draw_text(x, y+40, (moveTimeSet - moveTime)/(moveTimeSet/2))
	draw_text(x, y+60, sprFrame)
	draw_circle(drawXFace, drawYFace, 28, true)
}