function calc_jump(){
	var xdist = abs(o_player.x - x);
	var bite_dist = xdist - 40;
	var game_fps = 60;
	var jump_frames = 6;
	var anim_fps = 10;
	var game_frames_jumping = jump_frames/anim_fps * game_fps;
	var jumpx_speed = bite_dist/game_frames_jumping;
	return jumpx_speed;
}