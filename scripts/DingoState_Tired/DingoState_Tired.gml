function DingoState_Tired(){
	vsp = vsp + grv;
	tired_dur--;
	sprite_index = s_Dingo_Tired;
	//Horizontal Collision
	hsp = 0;
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
	if (tired_dur < 0){
		tired_dur = 120;
		image_xscale = sign(o_player.x - x);
		state = DingoSTATE.FREE;
	}
}