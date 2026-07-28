draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

for (var i = 0; i < 5; i++){
	if (ability_list[i] != 0){
		var ability_sprite = ability_list[i].ability_sprite;
		var col = c_white;
		if (ability_list[i].current_cooldown > 0){
			col = c_grey;
		}
		else{
			col = c_white;
		}
		var item_x = bar_offset_w + (item_width + item_gap) * i;
		var item_y = gui_h - bar_offset_h;
		var shake_x = 0;
		var shake_y = 0;
		if (o_player.fright > o_player.scared_threshold and i>1){
			shake_x = floor(random_range(-3,3))
			shake_y = floor(random_range(-3,3))
		}
		draw_sprite_stretched_ext(ability_sprite,0, item_x+shake_x, item_y+shake_y, 64, 64, col, 1);
		draw_set_font(Hotkey_Font);
		draw_set_colour(c_green);
		draw_text(item_x + 32, item_y, o_player.ability_keys[i]);
	}
}