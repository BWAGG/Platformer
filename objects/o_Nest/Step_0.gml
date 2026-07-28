if (place_meeting(x,y,o_player) and o_player.key_interact){
	o_gameManager.pause_tag("pausable");
	o_player.key_interact = false;
	o_Nest_Select.nest_open = true;
	o_respawn_point.x = x;
	o_respawn_point.y = y;
}