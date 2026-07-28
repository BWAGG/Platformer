var key_left = keyboard_check_pressed(ord("A"));
var key_right = keyboard_check_pressed(ord("D"));
var key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
error--;
if(instance_exists(o_player)){
	x = o_player.x;
	y = o_player.y;
}


if (nest_open == true){
	if (keyboard_check_pressed(vk_escape)){
		nest_open = false;
		o_gameManager.unpause_tag("pausable");
	}
	if (key_left){
		selected--;
		if (selected < 0) selected = nest_length;
	}
	if (key_right){
		selected++;
		if (selected > nest_length) selected = 0;
	}
	
	if (key_select){
		if (o_ability_manager.nest_list[selected] != 0){
			new_ability = o_ability_manager.nest_list[selected];
			nest_open = false;
			key_select = false;
			selected = 2;
			inventory_open = true;
		}
		else{
			error = 10;
		}
	}
}

if (inventory_open == true){
	if (keyboard_check_pressed(vk_escape)){
		nest_open = true;
		inventory_open = false;
		new_ability = 0;
	}
	if (key_right){
		selected++;
		if (selected >= inventory_length) selected = 2;
	}
	if (key_left){
		selected--;
		if (selected < 2) selected = inventory_length - 1;
	}
	
	if (key_select){
		if (!array_contains(o_ability_manager.ability_list, new_ability)){
			array_set(o_ability_manager.ability_list,selected,new_ability);
			inventory_open = false;
			o_gameManager.unpause_tag("pausable");
		}
		else{
			error = 10;
		}
	}
}

