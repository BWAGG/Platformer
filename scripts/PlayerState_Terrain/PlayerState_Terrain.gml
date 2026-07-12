function PlayerState_Terrain(){
	if (keyboard_check_pressed(vk_escape)){
		o_gameManager.gameState = GAMESTATE.PAUSED;
	}
	o_ability_manager.decrement_cooldowns();
	//Calculate Movement
	var move = key_right - key_left;
	PlayerMovement(move);
	ability_sprite = s_Mole_Equipped;
	
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
	//Death Plane
	PlayerDeath();
	if (move != 0) image_xscale = move;
	
	if (current_released || ability_charge >= 90){
		var speed_mag = clamp(ability_charge*0.2, 4, 12);
		var dmg_charge = clamp(floor(ability_charge/40), 1,2);
		with(instance_create_layer(x+10*image_xscale,y,"Instances",o_dirt_projectile)){
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