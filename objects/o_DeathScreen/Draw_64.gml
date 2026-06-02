draw_set_font(Death_Font);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_sprite_stretched(s_deathBackGround,0,0,0,gui_w, gui_h);

for (var i = 0; i < menu_length; i++){
	var txt = menu_options[i];
	var col = c_grey;
	if (selected == i){
		txt = string_insert("> ", txt, 0);
		col = c_white;
	}
	else{
		col = c_grey;
	}
	var item_x = x_pos;
	var item_y = y_pos - (item_height * (i * 1.5));
	draw_text(item_x, item_y, txt);
}