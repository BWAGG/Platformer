var opacity = clamp((o_player.fright/o_player.scared_threshold), 0, 0.4);
var brightness = (o_player.fright - o_player.scared_threshold) * 255;
brightness = clamp(brightness, 100, 255);
var colour = make_colour_rgb(brightness, 0,0);
draw_sprite_stretched_ext(s_Fear_Bar, 0, 0,0,display_get_gui_width(), display_get_gui_height(),colour, opacity);