event_inherited();

if (place_meeting(x,y,o_player) and o_player.key_interact){
	roll = new o_ability_manager.ability(self, PLAYERSTATE.ATTACK_SPIT, cooldown)
	array_set(o_ability_manager.ability_list,2,roll);
	o_gameManager.gameState = GAMESTATE.PAUSED;
	instance_destroy();
}