if (trans_mode != TRANS_MODE.OFF)
{
	draw_set_colour(c_black);
	draw_rectangle(0,0,gui_w,trans_perc_comp*half_gui_h, false);
	draw_rectangle(0,gui_h,gui_w,gui_h - (trans_perc_comp*half_gui_h), false);
}
