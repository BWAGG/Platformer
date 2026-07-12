function PlayerState_Roll(){
	if (keyboard_check_pressed(vk_escape)){
		o_gameManager.gameState = GAMESTATE.PAUSED;
	}
	if (key_up and image_index > 4){
		jump_buffer = true;
	}
	sprite_index = s_Kevin_Roll;
	var move = key_right - key_left;
	//Movement
	invuln = true;
	//Horizontal Collision
	if (place_meeting(x+hsp, y, o_wall)){
		hsp = 0;
	}
	else if (!place_meeting(x+init_speed, y, o_wall)){
		hsp = init_speed;
	}
	x=x+hsp;
	
	if (vsp < 0){
		vsp += grv;
	}
	else{
		vsp += 2*grv;
	}
	//Vertical Collision
	if (place_meeting(x, y+vsp, o_wall)){
		while (!place_meeting(x, y+sign(vsp), o_wall)){
			y=y+sign(vsp);
		}
		if (sign(vsp)>0){
			double_jump = true;
		}
		vsp = 0;
	}
	y=y+vsp;

	//Death Plane
	PlayerDeath();
	if (animation_end()){
		mask_index = S_Kevin_Stand;
		if (jump_buffer and ((place_meeting(x, y+2*vsp+1, o_wall) or double_jump or coyote>0))){
			if (!(place_meeting(x, y+2*vsp+1, o_wall)) and coyote<=0){
				double_jump = false;
			}
			vsp = -5.2;
			jump_buffer = false;
		}
		invuln = false;
		state = PLAYERSTATE.FREE;
	}
}