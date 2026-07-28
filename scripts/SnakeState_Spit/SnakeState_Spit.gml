function SnakeState_Spit(){
	sprite_index = s_Snake_Spit;
	stopped = true;
	attackdelay = 90;
	o_player.fright += 2;
	//Switch to attack and check for hits
	if (floor(image_index) >= 9 and shotcount < 3){
		shotcount++;
		var speed_mag = spit_hspeed_calc();
		with(instance_create_layer(x,y,"Instances",o_Snake_Spit)){
			hsp = speed_mag - 0.75*sign(speed_mag) + 0.75*sign(speed_mag)*(other.shotcount-1);
			vsp = -5;
			dmg = 1;
		}
	}
	//Horizontal Collision
	if (place_meeting(x+hsp, y, o_wall)){
		while (!place_meeting(x+sign(hsp), y, o_wall)){
			x=x+sign(hsp);
		}
		hsp = 0;
	}
	
	x=x+hsp;
	
	vsp+=grv;
	//Vertical Collision
	if (place_meeting(x, y+vsp, o_wall)){
		while (!place_meeting(x, y+sign(vsp), o_wall)){
			y=y+sign(vsp);
		}
		vsp = 0;
	}
	y=y+vsp;
	
	if (place_meeting(x+hsp, y, o_death)){
		instance_destroy();
	}
	if (hp = 0){
		instance_destroy();
	}
	
	if (animation_end()){
		swap_count = max_swap_count;
		switch_marker = 6;
		shotcount = 0;
		state = SnakeSTATE.FREE;
	}
}