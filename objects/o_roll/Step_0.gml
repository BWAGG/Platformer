event_inherited();

if (place_meeting(x,y,o_player) and o_player.key_interact){
	var roll = new o_ability_manager.ability(self.object_index, self.sprite_index, PLAYERSTATE.ROLL, cooldown)
	array_set(o_ability_manager.ability_list,1,roll);
	o_player.key_interact = false;
	instance_destroy();
}
