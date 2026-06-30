if (place_meeting(x,y+vsp, o_wall)){
	var blob = instance_create_layer(x,y,"instances",o_spit_blob);
	if(sign(vsp) == -1){
		blob.image_angle = 180;
	}
	else{
		blob.image_angle = 0;
	}
	with(blob){
		while(!place_meeting(x,y+sign(other.vsp), o_wall)){
			y = y + sign(other.vsp);
		}
	}
	instance_destroy();
}
else if (place_meeting(x+hsp,y, o_wall)){
	var blob = instance_create_layer(x,y,"instances",o_spit_blob);
	//set image rotation
	if(sign(hsp) == -1){
		blob.image_angle = 270;
	}
	else{
		blob.image_angle = 90;
	}
	with(blob){
		while(!place_meeting(x+sign(other.hsp),y, o_wall)){
			x = x + sign(other.hsp);
		}
	}
	instance_destroy();
}