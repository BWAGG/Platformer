function SnakeState_Patrol(){
vsp = vsp + grv;
//Horizontal Collision
if (place_meeting(x+hsp, y, o_wall) or (!place_meeting(x+30*hsp, y+1, o_wall) and place_meeting(x, y+1, o_wall))){
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
		sprite_index = s_snake_idle;
	}
}
else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = s_snake_idle;
		stopped = true;
	}
	else {
		if (stopped){
			image_index = 0;
			image_speed = 1;
			sprite_index = s_snake_start_move;
			stopped = false;
		}
		else if (animation_end()){
			image_index = 0;
			image_speed = 1;
			sprite_index = s_snake_move;
		}
	}
}
if (hsp != 0) image_xscale = sign(hsp)*-1;
//and collision_line(x, y, o_player.x, o_player.y, o_wall, false, true) == noone
if (distance_to_object(o_player) < 300){
	state = SnakeSTATE.PURSUE; 
}
}
