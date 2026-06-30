lifespan--;

if(place_meeting(x,y,o_player)){
	var y_dif = o_player.y - y; //positive means player is below
	var x_dif = o_player.x - x; //positive means player to right
	o_player.vsp = 6*sign(y_dif);
	o_player.hsp = 4*sign(x_dif); //negative hsp means approaching from the right
	if(place_meeting(x,y,o_player)){
		with(o_player){
		    if (!place_meeting(x+sign(x_dif), y, o_wall)){
				x += sign(x_dif);
			}
			if (!place_meeting(x, y+sign(y_dif), o_wall)){
				y += sign(y_dif);
			}
		}
	}
	o_player.double_jump = true;
}
if (image_angle == 0 && !place_meeting(x,y+1, o_wall)) instance_destroy();
else if (image_angle == 90 && !place_meeting(x+1,y, o_wall)) instance_destroy();
else if (image_angle == 180 && !place_meeting(x,y-1, o_wall)) instance_destroy();
else if (image_angle == 270 && !place_meeting(x-1,y, o_wall)) instance_destroy();
if (lifespan == 0) instance_destroy();