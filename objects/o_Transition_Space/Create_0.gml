gui_w = display_get_gui_width();
gui_h = display_get_gui_height();
half_gui_h = gui_h / 2;

enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	RESPAWN,
	INTRO
}

trans_mode = TRANS_MODE.INTRO;
trans_perc_comp = 1;
target_level = Level1;