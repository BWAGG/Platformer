function scr_Transition(){
	with (o_Transition_Space){
		trans_mode = argument[0];
		if (argument_count > 1){
			target_level = argument[1];
		}
	}
}