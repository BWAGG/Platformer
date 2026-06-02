draw_set_font(Death_Font);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_length; i++){
	var txt = menu_options[i];
	if (selected == i){
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	}
	else
	{
		var col = c_gray;
	}
	var item_x = x_pos;
	var item_y = y_pos - (item_height * (i * 1.5));
	draw_text(item_x, item_y, txt);
}