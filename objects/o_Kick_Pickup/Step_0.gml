event_inherited();

if (place_meeting(x,y,o_player) and o_player.key_interact){
	var kick = new o_ability_manager.ability(self.object_index, self.sprite_index, PLAYERSTATE.ATTACK_KICK, cooldown)
	o_gameManager.pause_tag("pausable");
	o_Ability_Select.new_ability = kick;
	o_Ability_Select.menu_open = true;
	o_player.key_interact = false;
	instance_destroy();
}