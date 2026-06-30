event_inherited();

if (place_meeting(x,y,o_player) and o_player.key_interact){
	var peck = new o_ability_manager.ability(self.object_index, self.sprite_index, PLAYERSTATE.ATTACK_PECK, cooldown)
	array_set(o_ability_manager.ability_list,0,peck);
	o_player.key_interact = false;
	instance_destroy();
}