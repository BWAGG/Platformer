draw_set_colour(c_red);
var current_length = o_player.hp*30;
draw_rectangle(bar_offset_w,gui_h - bar_offset_h,bar_offset_w + current_length,gui_h - bar_offset_h - bar_height, false);
draw_set_colour(c_white);
draw_rectangle(bar_offset_w,gui_h - bar_offset_h,bar_offset_w + bar_length, gui_h - bar_offset_h - bar_height, true);