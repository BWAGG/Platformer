if (place_meeting(x,y,o_player) and !Touched){
	layer_sequence_create("Sequences", x, y, seq_confetti);
	Touched = true;
}

if (Touched = true){
	nextLevel += 1;
	if (nextLevel == 200){
		scr_Transition(TRANS_MODE.GOTO, Level2);
	}
}