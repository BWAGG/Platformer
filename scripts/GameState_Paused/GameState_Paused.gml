function GameState_Paused(){
	if (ObjectsPaused == false){
		pause_tag("pausable");
		ObjectsPaused = true;
	}
	if (keyboard_check_pressed(vk_escape)){
		unpause_tag("pausable");
		gameState = GAMESTATE.FREE;
		ObjectsPaused = false;
	}
}