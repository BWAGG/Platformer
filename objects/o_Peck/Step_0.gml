event_inherited();

if (place_meeting(x,y,o_player) and o_player.key_interact){
	peck = new o_ability_manager.ability(self, PLAYERSTATE.ATTACK_PECK, cooldown)
	array_set(o_ability_manager.ability_list,0,peck);
	o_gameManager.gameState = GAMESTATE.PAUSED;
	instance_destroy();
}