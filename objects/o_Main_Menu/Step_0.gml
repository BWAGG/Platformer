var key_up = keyboard_check_pressed(ord("W"));
var key_down = keyboard_check_pressed(ord("S"));
var key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

if (menu_control == true){
	if (key_up){
		selected++;
		if (selected >= menu_length) selected = 0;
	}
	if (key_down){
		selected--;
		if (selected < 0) selected = menu_length - 1;
	}
	
	if (key_select){
		if (selected == 0){
			game_end();
		}
		if (selected == 1){
			scr_Transition(TRANS_MODE.GOTO, Level1);
		}
	}
	
}