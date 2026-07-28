function PlayerState_Free(){
if (keyboard_check_pressed(vk_escape)){
	o_gameManager.gameState = GAMESTATE.PAUSED;
}
var move = key_right-key_left;
PlayerMovement(move);
//Death Plane
PlayerDeath();
//Animations
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


if (move != 0) image_xscale = move;
if (key_ability0 && o_ability_manager.ability_list[0] != 0 && o_ability_manager.ability_list[0].current_cooldown == 0) {
	image_index = 0;
	image_speed = 1;
	ds_list_clear(hitByAttack);
	o_ability_manager.ability_list[0].current_cooldown = o_ability_manager.ability_list[0].cooldown;
	state = o_ability_manager.ability_list[0].state_name; 
}
else if (key_ability1 && o_ability_manager.ability_list[1] != 0 && o_ability_manager.ability_list[1].current_cooldown == 0) {
	image_index = 0;
	image_speed = 1;
	if (move != 0){
		image_xscale = move;
		init_mag = max(abs(move*6), abs(hsp + move*2));
		init_speed = move * init_mag;
	}
	else{
		init_mag = max(abs(image_xscale*6), abs(hsp + image_xscale*2));
		init_speed = image_xscale * init_mag;
	}
	vsp = -4;
	o_ability_manager.ability_list[1].current_cooldown = o_ability_manager.ability_list[1].cooldown;
	state = o_ability_manager.ability_list[1].state_name; 
}
else if (key_ability2 && o_ability_manager.ability_list[2] != 0 && o_ability_manager.ability_list[2].current_cooldown == 0){
	image_index = 0;
	image_speed = 1;
	ds_list_clear(hitByAttack);
	o_ability_manager.ability_list[2].current_cooldown = o_ability_manager.ability_list[2].cooldown;
	current = key_a2_chg;
	state = o_ability_manager.ability_list[2].state_name;
}
else if (key_ability3 && o_ability_manager.ability_list[3] != 0 && o_ability_manager.ability_list[3].current_cooldown == 0){
	image_index = 0;
	image_speed = 1;
	ds_list_clear(hitByAttack);
	o_ability_manager.ability_list[3].current_cooldown = o_ability_manager.ability_list[3].cooldown;
	current = key_a3_chg;
	state = o_ability_manager.ability_list[3].state_name;
}
else if (key_ability4 && o_ability_manager.ability_list[4] != 0 && o_ability_manager.ability_list[4].current_cooldown == 0){
	image_index = 0;
	image_speed = 1;
	ds_list_clear(hitByAttack);
	o_ability_manager.ability_list[4].current_cooldown = o_ability_manager.ability_list[4].cooldown;
	current = key_a4_chg;
	state = o_ability_manager.ability_list[4].state_name;
}
}
