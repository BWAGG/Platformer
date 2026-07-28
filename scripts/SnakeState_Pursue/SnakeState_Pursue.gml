function SnakeState_Pursue(){
	vsp = vsp + grv;
	o_player.fright += 5;
	attackdelay--;
	swap_count--;
	image_xscale = -1*sign(o_player.x - x);
	if (instance_exists(o_player)){
		//Look for player
		if (distance_to_object(o_player) > 500){
			state = SnakeSTATE.FREE; 
		}
		if (distance_to_object(o_player) < 40 and attackdelay < 0){
			image_index = 0;
			image_speed = 1;
			hsp=0;
			ds_list_clear(hitByAttack);
			state = SnakeSTATE.ATTACK;
		}
		//pathfinding to player
		else if(!knocked){
			hsp = curr_speed*sign(o_player.x - x);
		}
	//Horizontal Collision
	}
	if (place_meeting(x+hsp, y, o_wall)){
		hsp = 0;
		if (place_meeting(x, y+1, o_wall) and o_player.y - y < 0){
			vsp = -6;
		}
	}
	x=x+hsp;
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
	if (hp <= 0){
		instance_destroy();
	}
	//Animations
	if (!place_meeting(x, y+1, o_wall)){
		sprite_index = s_snake_idle;
	}
	else{
		image_speed = 1;
		if (hsp == 0){
			image_index = 0;
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
	if (swap_count <= 0){
		swap_count = max_swap_count;
		switch_marker = 4;
		state = SnakeSTATE.FREE;
	}
}