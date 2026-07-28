function DingoState_Pursue(){
	vsp = vsp + grv;
	o_player.fright += 5;
	if (instance_exists(o_player)){
		//Look for player
		if (distance_to_object(o_player) > 500){
			state = DingoSTATE.FREE; 
		}
		if (distance_to_object(o_player) < 200 and abs(o_player.x - x) > 60){
			image_index = 0;
			image_speed = 1;
			hsp=0;
			ds_list_clear(hitByAttack);
			state = DingoSTATE.ATTACK;
		}
		//pathfinding to player
		else if(!knocked){
			if (distance_to_object(o_player) > 30){
				hsp = curr_speed*sign(o_player.x - x);
			}
			else{
				hsp = curr_speed*image_xscale;
			}
		}
	if (hsp != 0) image_xscale = sign(hsp);
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
		sprite_index = s_Dingo_Stand;
	}
	else{
		image_speed = 1;
		sprite_index = s_Dingo_Trot;
		if (hsp == 0){
			image_index = 0;
			sprite_index = s_Dingo_Stand;
			stopped = true;
		}
	}
}