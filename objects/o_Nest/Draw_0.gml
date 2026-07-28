draw_self();

if (place_meeting(x,y,o_player)){
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(Pickup_Font);
	draw_set_color(c_yellow);
	var offset_y = 5;
	draw_text(x, bbox_top - offset_y, "Press I to Interact");
}