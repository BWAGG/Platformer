draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

for (var i = 0; i < 4; i++){
	if (ability_list[i] != 0){
		ability_object = ability_list[i].ability_object;
		var ability_sprite = ability_object.sprite_index;
		var col = c_white;
		if (ability_list[i].current_cooldown > 0){
			col = c_grey;
		}
		else{
			col = c_white;
		}
		var item_x = bar_offset_w + (item_width * i * 1.2);
		var item_y = gui_h - bar_offset_h;
		draw_sprite_stretched_ext(ability_sprite,0, item_x, item_y, 64, 64, col, 1);
	}
}