with(other){
	hp -= other.dmg;
	flash = 8;
	slow = new o_buff_manager.buff("slow", 200, "movespeed", 0.2);
	array_push(active_debuffs, slow);
}
o_player.fright -= 40;
instance_destroy();