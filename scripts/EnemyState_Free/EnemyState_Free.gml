function EnemyState_Free(){
vsp = vsp + grv;
hsp = sign(hsp)*curr_speed;
//Horizontal Collision
if (place_meeting(x+hsp, y, o_wall)){
	hsp = hsp*-1;
}
x=x+hsp;
//Jump Check
//Vertical Collision
if (place_meeting(x, y+vsp, o_wall)){
	while (!place_meeting(x, y+sign(vsp), o_wall)){
		y=y+sign(vsp);
	}
	vsp = 0;
}

y=y+vsp;
//Death Plane

if (place_meeting(x+hsp, y, o_death)){
	instance_destroy();
}
if (hp = 0){
	instance_destroy();
}
//Animations
if (!place_meeting(x, y+1, o_wall)){
	if (sign(vsp)>0){
		sprite_index = s_stoat_falling;
	}
}

else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = s_stoat_idle;
	}
	else {
		sprite_index = s_stoat_move;
	}
}


if (hsp != 0) image_xscale = sign(hsp);
}
