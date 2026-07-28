with(other){
	hp -= other.dmg;
	flash = hit_invuln;
}
o_player.fright += 30;
instance_destroy();