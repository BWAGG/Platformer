function PlayerState_Terrain(){
	if (keyboard_check_pressed(vk_escape)){
		o_gameManager.gameState = GAMESTATE.PAUSED;
	}
	o_ability_manager.decrement_cooldowns();
	//Calculate Movement
	var move = key_right - key_left;
	ability_sprite = s_Mole_Equipped;
	hac = move*walksp;
	hsp += hac;
	if ((hsp) > 4 and place_meeting(x, y+2*vsp+1, o_wall)){
		hsp = max(4, hsp - 1.2);
	}
	else if ((hsp) > 4){
		hsp = max(4, hsp - 0.6)
	}
	else if (hsp < -4 and place_meeting(x, y+2*vsp+1, o_wall)){
		hsp = min(-4, hsp + 1.2);
	}
	else if ((hsp) < -4){
		hsp = min(4, hsp + 0.6)
	}
	else if (hsp > 0){
		hsp = max(0, hsp-0.25);
	}
	else if (hsp < 0){
		hsp = min(0, hsp+0.25);
	}
	hsp = clamp(hsp, -20, 20);
	if (flash > 0){
		invuln = true;
	}
	else {
		invuln = false;
	}
	//Horizontal Collision
	if (place_meeting(x+hsp, y, o_wall)){
		hsp = 0;
	}

	x=x+hsp;
	//Jump Check
	hsp = clamp(hsp, -20, 20);
	if (key_up and (place_meeting(x, y+2*vsp+1, o_wall) or double_jump)){
		if (!(place_meeting(x, y+2*vsp+1, o_wall))){
			double_jump = false;
		}
		vsp = -5.2;
	}
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
	vsp = clamp(vsp, -10, 10);
	
		if (!place_meeting(x, y+1, o_wall)){
		if (sign(vsp)>0){
			sprite_index = s_Kevin_Descending;
		}
		else{
			sprite_index = s_Kevin_Ascending;
			image_speed = 1;
		}
	}

	else{
		image_speed = 1;
		if (hsp == 0){
			sprite_index = S_Kevin_Stand;
		}
		else {
			sprite_index = S_Kevin_Running;
		}
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
	if (move != 0) image_xscale = move;
	
	if (current_released || ability_charge >= 90){
		var speed_mag = clamp(ability_charge*0.2, 4, 12);
		var dmg_charge = clamp(floor(ability_charge/40), 1,2);
		with(instance_create_layer(x,y,"Instances",o_dirt_projectile)){
			hsp = other.hsp + speed_mag*other.image_xscale;
			vsp = other.vsp - 3;
			dmg = dmg_charge;
		}
		ability_charge=0;
		ability_sprite=0;
		state = PLAYERSTATE.FREE;
	}
	else{
		ability_charge += 1;
	}
}