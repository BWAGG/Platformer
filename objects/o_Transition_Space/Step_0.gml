if (trans_mode != TRANS_MODE.OFF){
	if(trans_mode == TRANS_MODE.INTRO)
	{
		trans_perc_comp = max(0,trans_perc_comp-max((trans_perc_comp/20), 0.01));
	}
	else
	{
		trans_perc_comp = min(1,trans_perc_comp+max((1-trans_perc_comp)/20, 0.01));
	}
	
	if (trans_perc_comp == 1) || (trans_perc_comp == 0)
	{
		switch(trans_mode)
		{
			case TRANS_MODE.INTRO:{
				trans_mode = TRANS_MODE.OFF; 
				break;
			}
			case TRANS_MODE.NEXT:{ 
				trans_mode = TRANS_MODE.INTRO; room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:{ 
				trans_mode = TRANS_MODE.INTRO;
				room_goto(target_level);
				break;
			}
			case TRANS_MODE.RESTART:{
				game_restart();
				break;
			}
			case TRANS_MODE.DIE:{
				trans_mode = TRANS_MODE.INTRO
				instance_create_layer(o_player.x,o_player.y,"Screens",o_DeathScreen);
				break;
			}
			case TRANS_MODE.RESPAWN:{
				trans_mode = TRANS_MODE.INTRO;
				o_player.hp = o_player.max_hp;
				o_player.x = o_respawn_point.x;
				o_player.y = o_respawn_point.y;
				o_player.state = PLAYERSTATE.FREE;
				layer_destroy_instances("Screens");
				break;
			}
			case TRANS_MODE.OFF:{break;}
		}
	}
}