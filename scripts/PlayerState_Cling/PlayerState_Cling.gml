function PlayerState_Cling(){
	if (keyboard_check_pressed(vk_escape)){
		o_gameManager.gameState = GAMESTATE.PAUSED;
	}
	ability_charge--;
	sprite_index = s_Kevin_Cling;
	if (animation_end()){
		image_speed = 0;
	}
	if (ability_charge == 0) state = PLAYERSTATE.FREE;
	mask_index = s_Kevin_Cling;
	if(!place_meeting(x,y,o_wall)){
		ability_charge=0;
		mask_index = S_Kevin_Stand;
		state = PLAYERSTATE.FREE;
	}
	mask_index = S_Kevin_Stand;
	if (key_up){
		vsp = -6;
		hsp = image_xscale*-3;
		ability_charge=0;
		double_jump = true;
		state = PLAYERSTATE.FREE;
	}
}