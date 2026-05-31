if (place_meeting(x,y,o_player)){
	peck = new o_ability_manager.ability(self, PLAYERSTATE.ATTACK_PECK, cooldown)
	array_set(o_ability_manager.ability_list,0,peck);
	instance_destroy();
}