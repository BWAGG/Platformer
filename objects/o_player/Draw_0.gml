draw_self();
if (flash > 0){
	shader_set(sh_Flash_White);
	draw_self();
	shader_reset();
	flash--;
}
if (ability_sprite != 0){
	var charge_colour = make_colour_rgb(255, 255-(2.5*ability_charge), 255-(2.5*ability_charge));
	draw_sprite_ext(ability_sprite, 0, x-10*image_xscale,y, image_xscale, image_yscale, 0, charge_colour, 1);
}