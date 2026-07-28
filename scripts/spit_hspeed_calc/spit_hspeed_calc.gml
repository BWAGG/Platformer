function spit_hspeed_calc(){
	var xdist = (o_player.x + o_player.hsp * 20) - x;
	var ydist = o_player.y-y;
	var yspeedinit = -5;
	var uptime = -1*yspeedinit/grv;
	var downtime = sqrt(abs(2*(yspeedinit - 0.5*grv*power(uptime,2) - ydist))/grv);
	var time_to_target = uptime + downtime;
	var xspeed = xdist/time_to_target;
	return xspeed; 
}