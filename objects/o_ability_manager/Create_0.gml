gui_w = display_get_gui_width();
gui_h = display_get_gui_height();
bar_length = 0;
bar_offset_h = 120;
bar_offset_w = 20;
bar_height = 30;
item_width = 64;

function ability(_ability_obj, _state_Name, _cooldown) constructor {
	ability_object = _ability_obj;
	state_name = _state_Name;
	cooldown = _cooldown;
	current_cooldown = 0;
}

ability_list = array_create(4,0);



decrement_cooldowns = function(){
	for (i = 0; i < array_length(ability_list); i++){
		if (ability_list[i] != 0){
			ability_list[i].current_cooldown = max(0, ability_list[i].current_cooldown - 1);
		}
	}
}