function PlayerState_Roll(){
	sprite_index = s_Kevin_Roll;
	
	//Movement

	hsp = image_xscale*9;
	invuln = true;
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
		invuln = false;
		state = PLAYERSTATE.FREE;
	}
}