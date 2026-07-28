if(inventory_open){
	draw_set_alpha(.5);
	draw_set_color(c_black);
	draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(Ability_Select_Font);
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2, "Choose Ability To Remove");
	start_draw_x = display_get_gui_width()/2 - 1.5*box_width - box_gap;
	start_draw_y = display_get_gui_height()*ability_box_height_percent;
	for(var i = 2; i < array_length(o_ability_manager.ability_list); i++){
		if (selected = i && error <= 0){
			draw_set_color(c_white);
		}
		else if (selected = i && error > 0){
			draw_set_color(c_red);
		}
		else{
			draw_set_color(c_green);
		}
		var box_x_tl = start_draw_x + (i-2)*(box_width+box_gap);
		draw_rectangle(box_x_tl, start_draw_y,box_x_tl + box_width, start_draw_y+box_width,true);
		if(o_ability_manager.ability_list[i] != 0){
			draw_sprite(o_ability_manager.ability_list[i].ability_sprite, 0, box_x_tl+box_width/2, start_draw_y+box_width/2);
		}
		else{
			draw_text(box_x_tl+box_width/2, start_draw_y+box_width/2, "Empty")
		}
	}
}
else if(nest_open){
	draw_set_alpha(.5);
	draw_set_color(c_black);
	draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(Ability_Select_Font);
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2, "Choose Ability To Add");
	start_draw_x = display_get_gui_width()/2 - 3*box_width - 2.5*box_gap;
	start_draw_y = display_get_gui_height()*ability_box_height_percent;
	for(var i = 0; i < array_length(o_ability_manager.nest_list); i++){
		if (selected = i && error <= 0){
			draw_set_color(c_white);
		}
		else if (selected = i && error > 0){
			draw_set_color(c_red);
		}
		else{
			draw_set_color(c_green);
		}
		var box_x_tl = start_draw_x + (i)*(box_width+box_gap);
		draw_rectangle(box_x_tl, start_draw_y,box_x_tl + box_width, start_draw_y+box_width,true);
		if(o_ability_manager.nest_list[i] != 0){
			draw_sprite(o_ability_manager.nest_list[i].ability_sprite, 0, box_x_tl+box_width/2, start_draw_y+box_width/2);
		}
		else{
			draw_text(box_x_tl+box_width/2, start_draw_y+box_width/2, "Empty")
		}
	}
}
//add drawing of ability sprites in the 4 boxes on the screen (or zoomed in body of Kevin)
//if no ability write text of "empty slot" in the space
//draw ability sprite to add near the top?