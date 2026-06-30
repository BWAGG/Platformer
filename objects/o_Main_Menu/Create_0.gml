gui_w = display_get_gui_width();
gui_h = display_get_gui_height();
selected = 1;

x_pos = gui_w / 2;
y_pos = gui_h - 32;

menu_font = Menu_Font;
item_height = font_get_size(Menu_Font);
menu_control = true;

menu_options = ["Quit", "Start Game"];
menu_length = array_length(menu_options);