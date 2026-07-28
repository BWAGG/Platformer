function DingoState_Wait(){
	vsp = vsp + grv;
	attackdelay--;
	//Horizontal Collision
	hsp = 0.001*sign(o_player.x - x);
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
			sprite_index = s_Dingo_Stand;
		}
	}
	else{
		image_speed = 1;
		if (hsp == 0){
			sprite_index = s_Dingo_Stand;
			stopped = true;
		}
		else {
			image_index = 0;
			image_speed = 1;
			sprite_index = s_Dingo_Stand;
		}
	}
	if (hsp != 0) image_xscale = sign(hsp);
	if (attackdelay < 0){
		state = DingoSTATE.PURSUE;
	}
	//and collision_line(x, y, o_player.x, o_player.y, o_wall, false, true) == noone
}