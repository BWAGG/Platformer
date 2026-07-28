var key_left = keyboard_check_pressed(ord("A"));
var key_right = keyboard_check_pressed(ord("D"));
var key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
if(instance_exists(o_player)){
	x = o_player.x;
	y = o_player.y;
}


if (menu_open == true){
	if (keyboard_check_pressed(vk_escape)){
		menu_open = false;
		o_gameManager.unpause_tag("pausable");
	}
	if (key_right){
		selected++;
		if (selected >= menu_length) selected = 2;
	}
	if (key_left){
		selected--;
		if (selected < 2) selected = menu_length - 1;
	}
	
	if (key_select){
		menu_open = false;
		o_gameManager.unpause_tag("pausable");
		if(!array_contains(o_ability_manager.ability_list, new_ability)){
			array_set(o_ability_manager.ability_list,selected,new_ability);
		}
	}
}

