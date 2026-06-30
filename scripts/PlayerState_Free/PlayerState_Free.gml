function PlayerState_Free(){
if (keyboard_check_pressed(vk_escape)){
	o_gameManager.gameState = GAMESTATE.PAUSED;
}
o_ability_manager.decrement_cooldowns();
//Calculate Movement
var move = key_right - key_left;

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
if (key_ability1 && o_ability_manager.ability_list[1] != 0 && o_ability_manager.ability_list[1].current_cooldown == 0) {
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
if (key_ability2 && o_ability_manager.ability_list[2] != 0 && o_ability_manager.ability_list[2].current_cooldown == 0){
	o_ability_manager.ability_list[2].current_cooldown = o_ability_manager.ability_list[2].cooldown;
	current = key_a2_chg;
	state = o_ability_manager.ability_list[2].state_name;
}
if (key_ability3 && o_ability_manager.ability_list[3] != 0 && o_ability_manager.ability_list[3].current_cooldown == 0){
	key_held = true;
	o_ability_manager.ability_list[3].current_cooldown = o_ability_manager.ability_list[3].cooldown;
	current = key_a3_chg;
	state = o_ability_manager.ability_list[3].state_name;
}
if (key_ability4 && o_ability_manager.ability_list[4] != 0 && o_ability_manager.ability_list[4].current_cooldown == 0){
	key_held = true;
	o_ability_manager.ability_list[4].current_cooldown = o_ability_manager.ability_list[4].cooldown;
	current = key_a4_chg;
	state = o_ability_manager.ability_list[4].state_name;
}
if (key_ability5 && o_ability_manager.ability_list[5] != 0 && o_ability_manager.ability_list[5].current_cooldown == 0){
	key_held = true;
	o_ability_manager.ability_list[5].current_cooldown = o_ability_manager.ability_list[5].cooldown;
	current = key_a5_chg;
	state = o_ability_manager.ability_list[5].state_name;
}
}
