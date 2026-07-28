function DingoState_Attack(){
	sprite_index = s_Dingo_Bite;
	o_player.fright += 2;
	//Switch to attack and check for hits
	mask_index = s_Dingo_Bite_HB;
	var hitByAttackNow = ds_list_create();
	if (instance_exists(o_player)){
		var hits = instance_place_list(x,y, o_player, hitByAttackNow, false);
		if (hits > 0){
			for (var i = 0; i < hits; i++){
				var hitID = hitByAttackNow[| i];
				if (ds_list_find_index(hitByAttack, hitID) == -1 and hitID.invuln == false){
					ds_list_add(hitByAttack, hitID);
					var dir = sign(hitID.x - x);
					with (hitID)
					{
						hp -= 2;
						flash = hit_invuln;
						fright += 240;
						hsp = dir * 10;
						vsp = -1;
					}
				}
			}
		}
	}
	mask_index = s_Dingo_Stand;
	if (image_index == 1){
		jump_speed = calc_jump();
		vsp = calc_jump_h();
	}
	if (image_index == 3){
		hsp = jump_speed*image_xscale;
	}
	else if (image_index > 9){
		hsp = 0;
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
	
	if (animation_end() and attacks < 3){
		attacks++;
		attackdelay = 10;
		sprite_index = s_Dingo_Trot;
		state = DingoSTATE.WAIT;
	}
	else if(animation_end() and attacks = 3){
		attacks = 0;
		image_index = 0;
		image_speed = 1;
		state = DingoSTATE.TIRED;
	}
}