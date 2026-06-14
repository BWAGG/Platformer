gameState = GAMESTATE.FREE;
pause_queue = [];
unpause_queue = [];
paused_elements = [];
ObjectsPaused = false;

pause_object = function(_obj_or_id){
	array_push(pause_queue, _obj_or_id);
}
unpause_object = function(_obj_or_id){
	array_push(unpause_queue, _obj_or_id);
}

pause_tag = function(_tag_or_tags){
	var assets = tag_get_asset_ids(_tag_or_tags, asset_object);
	for(var i = 0; i < array_length(assets); i++){
		pause_object(assets[i]);
	}
}
unpause_tag = function(_tag_or_tags){
	var assets = tag_get_asset_ids(_tag_or_tags, asset_object);
	for(var i = 0; i < array_length(assets); i++){
		unpause_object(assets[i]);
	}
}

enum GAMESTATE
{
	FREE,
	PAUSED
}