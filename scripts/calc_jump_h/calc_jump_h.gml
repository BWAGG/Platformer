function calc_jump_h(){
	var jumpy_speed = 0;
	if (o_player.y < y){
		var ydist = o_player.y - y;
		var game_fps = 60;
		var jump_frames = 6;
		var anim_fps = 10;
		var game_frames_jumping = jump_frames/anim_fps * game_fps;
		var bite_dist = ydist - 0.15*power(game_frames_jumping,2);
		jumpy_speed = clamp(bite_dist/game_frames_jumping,-6, 0);
	}
	else{
		jumpy_speed = 0;
	}
	return jumpy_speed;
}