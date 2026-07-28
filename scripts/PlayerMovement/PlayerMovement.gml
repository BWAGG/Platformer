function PlayerMovement(move){
hac = move*walksp;
hsp += hac;
if ((hsp) > 5 and place_meeting(x, y+2*vsp+1, o_wall)){
	hsp = max(5, hsp - 1.2);
}
else if ((hsp) > 5){
	hsp = max(5, hsp - 0.6)
}
else if (hsp < -5 and place_meeting(x, y+2*vsp+1, o_wall)){
	hsp = min(-5, hsp + 1.2);
}
else if ((hsp) < -5){
	hsp = min(-5, hsp + 0.6)
}
else if (hsp > 0){
	hsp = max(0, hsp-0.25);
}
else if (hsp < 0){
	hsp = min(0, hsp+0.25);
}
hsp = clamp(hsp, -20, 20);
if (flash > 0){
	invuln = true;
}
else {
	invuln = false;
}
//Horizontal Collision
if (place_meeting(x+hsp, y, o_wall)){
	hsp = 0;
}

x=x+hsp;
//Jump Check
if (key_up and (place_meeting(x, y+2*vsp+1, o_wall) or double_jump or coyote>0)){
	if (!(place_meeting(x, y+2*vsp+1, o_wall)) and coyote<=0){
		double_jump = false;
	}
	vsp = -5.2;
}
if (vsp < 0){
	vsp += grv;
}
else{
	vsp += 2*grv;
}
//Vertical Collision
if (place_meeting(x, y+vsp, o_wall)){
	while (!place_meeting(x, y+sign(vsp), o_wall)){
		y=y+sign(vsp);
	}
	if (sign(vsp)>0){
		coyote = coyote_dur;
		double_jump = true;
	}
	vsp = 0;
}
vsp = clamp(vsp, -10, 10);

y=y+vsp;
}