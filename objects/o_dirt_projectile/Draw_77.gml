if(lifespan <= 0){
	var blob = instance_create_layer(x,y,"instances",o_temp_plat);
	instance_destroy();
}
else if (place_meeting(x,y+vsp, o_wall)){
	var blob = instance_create_layer(x,y,"instances",o_temp_plat);
	instance_destroy();
}
else if (place_meeting(x+hsp,y, o_wall)){
	var blob = instance_create_layer(x,y,"instances",o_temp_plat);
	//set image rotation
	with(blob){
		while(!place_meeting(x+sign(other.hsp),y, o_wall)){
			x = x + sign(other.hsp);
		}
	}
	instance_destroy();
}