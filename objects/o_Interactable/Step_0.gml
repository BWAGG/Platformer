vsp += grv;

if (place_meeting(x, y+vsp, o_wall)){
	vsp = 0;
}

y=y+vsp;

if (place_meeting(x+hsp, y, o_wall)){
	hsp = 0;
}

x=x+hsp;
