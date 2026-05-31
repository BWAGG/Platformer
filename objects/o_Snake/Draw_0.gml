draw_self();
if (flash > 0){
	shader_set(sh_Flash_White);
	draw_self();
	shader_reset();
	flash--;
}