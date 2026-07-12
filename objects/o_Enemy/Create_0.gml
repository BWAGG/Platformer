base_speed = 2;
curr_speed = 2;
hsp = 0;
knocked = false;
active_debuffs = [];

function apply_buffs(_array_buffs){
	curr_speed = base_speed;
	for( var i = 0; i < array_length(_array_buffs); i++){
		_array_buffs[i].duration--;
		if(_array_buffs[i].effect == "movespeed"){
			curr_speed = base_speed*_array_buffs[i].value;
			hsp = sign(hsp)*curr_speed;
		}
		if(_array_buffs[i].effect == "knockback"){
			curr_speed = abs(_array_buffs[i].value);
			hsp = _array_buffs[i].value;
			knocked = true;
			if (_array_buffs[i].duration == 0){
				curr_speed = 0;
				hsp = 0;
				knocked = false;
			}
		}
		if (_array_buffs[i].duration <= 0){
			array_delete(_array_buffs, i, 1);
		}
	}
}