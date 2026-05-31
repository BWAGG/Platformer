draw_set_colour(c_red);
draw_rectangle(bar_offset_w,gui_h - bar_offset_h,bar_offset_w + o_player.hp*30,gui_h - bar_offset_h - bar_height, false);
draw_set_colour(c_white);
draw_rectangle(bar_offset_w,gui_h - bar_offset_h,bar_offset_w + o_player.max_hp*30, gui_h - bar_offset_h - bar_height, true);