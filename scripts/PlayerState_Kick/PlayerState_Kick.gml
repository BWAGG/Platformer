function PlayerState_Kick(){
	if (keyboard_check_pressed(vk_escape)){
		o_gameManager.gameState = GAMESTATE.PAUSED;
	}
	if (key_up and image_index > 5){
		jump_buffer = true;
	}
	sprite_index = s_Kevin_Kick;
	//Switch to attack and check for hits
	mask_index = s_Kevin_Kick_HB;
	var kick_direction = image_xscale;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y, o_Enemy, hitByAttackNow, false);
	if (hits > 0){
		for (var i = 0; i < hits; i++){
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					knock = new o_buff_manager.buff("kick", 20, "knockback", 5*kick_direction);
					array_push(active_debuffs, knock);
					vsp -= 1; 
					hp--;
					flash = 8;
				}
			}
		}
	}
	//Movement
	mask_index = S_Kevin_Stand;
	hac = image_xscale*-0.1;
	if (image_index == 5){
		hsp -= image_xscale*8;
	}
	hsp += hac;

	//Horizontal Collision
	if (place_meeting(x+hsp, y, o_wall)){
		while (!place_meeting(x+sign(hsp), y, o_wall)){
			x=x+sign(hsp);
		}
		hsp = 0;
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
			coyote = 20;
		}
		vsp = 0;
	}
	y=y+vsp;

	//Death Plane

if (place_meeting(x+hsp, y, o_death)){
	state = PLAYERSTATE.DEAD;
	scr_Transition(TRANS_MODE.DIE);
	o_flag.Touched = false;
}
if (hp <= 0){
	state = PLAYERSTATE.DEAD;
	scr_Transition(TRANS_MODE.DIE);
	o_flag.Touched = false;
}
	
if (animation_end()){
	mask_index = S_Kevin_Stand;
	if (jump_buffer and ((place_meeting(x, y+2*vsp+1, o_wall) or double_jump or coyote>0))){
			if (!(place_meeting(x, y+2*vsp+1, o_wall)) and coyote<=0){
				double_jump = false;
			}
			vsp = -5.2;
			jump_buffer = false;
	}
	state = PLAYERSTATE.FREE;
}
}