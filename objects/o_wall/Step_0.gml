var player_inside = rectangle_in_rectangle(o_player.bbox_left, o_player.bbox_top, 
o_player.bbox_right, o_player.bbox_bottom, bbox_left, bbox_top, bbox_right, bbox_bottom)

if (player_inside == 1 and !o_player.invuln){
	o_player.hp--;
	o_player.flash = o_player.hit_invuln;
}