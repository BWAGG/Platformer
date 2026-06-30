function buff(_name, _duration, _effect, _value) constructor{
	name = _name;
	duration = _duration;
	effect = _effect;
	value = _value;
}

apply_buffs = function(_array_buffs){
	for( var i = 0; i < array_length(_array_buffs) -1; i++){
		_array_buffs[i].duration--;
		if(_array_buffs[i].effect == "movespeed"){
			id.walksp *= value;
		}
		if (_array_buffs[i].duration <= 0){
			array_delete(_array_buffs, i, 1);
		}
	}
}