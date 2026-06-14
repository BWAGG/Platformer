function PlayerState_Peck(){
	if (keyboard_check_pressed(vk_escape)){
		o_gameManager.gameState = GAMESTATE.PAUSED;
	}
	sprite_index = s_Kevin_Peck_2;
	
	//Switch to attack and check for hits
	mask_index = s_Kevin_Peck_HB;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y, o_Enemy, hitByAttackNow, false);
	if (hits > 0){
		for (var i = 0; i < hits; i++){
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					hp--;
					flash = 8;
				}
			}
		}
	}
	//Movement
	mask_index = S_Kevin_Stand;
	hac = image_xscale*0.2;
	if (image_index == 1){
		hsp += image_xscale*4;
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
		}
		vsp = 0;
	}
	y=y+vsp;

	//Death Plane

if (place_meeting(x+hsp, y, o_death)){
	scr_Transition(TRANS_MODE.RESPAWN);
	o_flag.Touched = false;
}
if (hp <= 0){
	scr_Transition(TRANS_MODE.RESPAWN);
	hp = max_hp;
	o_flag.Touched = false;
	
	
}
	
	if (animation_end()){
		mask_index = S_Kevin_Stand;
		state = PLAYERSTATE.FREE;
	}
}
