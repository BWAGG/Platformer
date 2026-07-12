event_inherited();

lifespan--;
if (lifespan == 0){
	image_speed = 1;
}
if (animation_end()){
	instance_destroy();
}
var y_dif_p = o_player.y - y; //positive means player is below
var x_dif_p = o_player.x - x;
if (x_dif_p != 0 or y_dif_p != 0){
	if(place_meeting(x,y,o_player)){
		with(o_player){
			if (!place_meeting(x+5*sign(x_dif_p), y, o_terrain)){
					x += 5*sign(x_dif_p);
			}
			if (!place_meeting(x, y+5*sign(y_dif_p), o_terrain)){
					y += 5*sign(y_dif_p);
			}
		}
	}
}
var enemy_met = instance_place(x,y,o_Enemy);
if(enemy_met != noone){
	with(enemy_met){
		var y_dif_e = y - other.y; //positive means player is below
		var x_dif_e = x - other.x;
		if (x_dif_e != 0 or y_dif_e != 0){
			if (!place_meeting(x+10*sign(x_dif_e), y, o_terrain)){
					x += 10*sign(x_dif_e);
			}
			if (!place_meeting(x, y+10*sign(y_dif_e), o_terrain)){
					y += 10*sign(y_dif_e);
			}
		}
	}
}