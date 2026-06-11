function GameState_Paused(){
	instance_deactivate_layer("Instances");
	instance_deactivate_layer("UI");
	if (keyboard_check_pressed(vk_escape)){
		instance_activate_all();
		gameState = GAMESTATE.FREE;
	}
}