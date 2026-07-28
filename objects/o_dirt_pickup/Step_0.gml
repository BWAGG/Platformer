event_inherited();

if (place_meeting(x,y,o_player) and o_player.key_interact){
	var dirt = new o_ability_manager.ability(self.object_index, self.sprite_index, PLAYERSTATE.ATTACK_TERRAIN, cooldown);
	var has_ability = array_contains(o_ability_manager.nest_list, dirt);
	if (!has_ability){
		array_set(o_ability_manager.nest_list, 2,dirt);
	}
	o_gameManager.pause_tag("pausable");
	o_Ability_Select.new_ability = dirt;
	o_Ability_Select.menu_open = true;
	o_player.key_interact = false;
	instance_destroy();
}