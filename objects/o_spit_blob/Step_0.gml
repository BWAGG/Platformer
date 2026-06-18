lifespan--;

if(place_meeting(x,y,o_player)){
	var y_dif = o_player.y - y; //positive means player is below
	var x_dif = o_player.x - x; //positive means player to right
	o_player.vsp = 8*sign(y_dif);
	o_player.hsp = 4*sign(x_dif); //negative hsp means approaching from the right
	while(place_meeting(x,y,o_player)){
		with(o_player){
		    if (!place_meeting(x+hsp, y, o_wall)){
				x += sign(hsp);
			}
			if (!place_meeting(x, y+vsp, o_wall)){
				y += sign(vsp);
			}
		}
	}
	o_player.double_jump = true;
}

if (lifespan == 0) instance_destroy();