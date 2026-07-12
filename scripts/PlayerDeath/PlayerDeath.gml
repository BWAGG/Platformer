function PlayerDeath(){
if (place_meeting(x+hsp, y, o_death)){
	state = PLAYERSTATE.DEAD;
	scr_Transition(TRANS_MODE.DIE);
	o_flag.Touched = false;
}
if (hp <= 0){
	state = PLAYERSTATE.DEAD;
	scr_Transition(TRANS_MODE.DIE);
	o_flag.Touched = false;
}
}