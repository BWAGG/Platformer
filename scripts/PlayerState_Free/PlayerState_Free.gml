function PlayerState_Free(){
	
//Calculate Movement
var move = key_right - key_left;

hac = move*walksp;
hsp += hac;
hsp = clamp(hsp, -4, 4);

//Horizontal Collision
if (place_meeting(x+hsp, y, o_wall)){
	while (!place_meeting(x+sign(hsp), y, o_wall)){
		x=x+sign(hsp);
	}
	hsp = 0;
}

x=x+hsp;
hsp -= sign(hsp)*0.25;
//Jump Check

if (key_up and (place_meeting(x, y+2*vsp+1, o_wall) or double_jump)){
	if (!(place_meeting(x, y+2*vsp+1, o_wall))){
		double_jump = false;
	}
	vsp = -5;
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


if (hsp != 0) image_xscale = sign(hsp);
	if (key_ability0 && o_ability_manager.ability_list[0] != 0) {
		image_index = 0;
		image_speed = 1;
		ds_list_clear(hitByAttack);
		o_ability_manager.ability_list[0].current_cooldown = o_ability_manager.ability_list[0].cooldown;
		state = o_ability_manager.ability_list[0].state_name; 
	}
}
