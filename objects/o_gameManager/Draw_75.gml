for (var i = 0; i<array_length(pause_queue); i++){
	with(pause_queue[i]){
		array_push(other.paused_elements, id);
	}
}
pause_queue = [];

for (var i = 0; i < array_length(unpause_queue); i++){
	with(unpause_queue[i]){
		var index = array_get_index(other.paused_elements, id);
		if (index != -1){
			array_delete(other.paused_elements, index, 1);
		}
	}
}
unpause_queue = [];

for(var i = 0; i < array_length(paused_elements); i++){
	instance_deactivate_object(paused_elements[i]);
}