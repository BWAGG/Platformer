//Update Camera
if (instance_exists(follow)){
	xTo = follow.x + (follow.image_xscale * 15) + follow.hsp*6;
	yTo = follow.y + (follow.vsp * 10.5) - 10;
	x += (xTo - x) / 10;
	y += (yTo - y) / 10;
}

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

//Update Camera view position
camera_set_view_pos(cam, x-view_w_half, y- view_h_half);
