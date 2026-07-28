event_inherited();

vsp = 0;
grv = 0.15;
base_speed = 2;
curr_speed = base_speed;
hsp = curr_speed;
attackdelay = 0;
spit_hspeed = 0;
spit_vspeed = 0;
shotcount = 0;
max_swap_count = 240;
swap_count = 240;
switch_marker = 5;


hp = 8;
flash = 0;
invuln = 0;
stopped = true;
hitByAttack = ds_list_create();

state = SnakeSTATE.FREE;

enum SnakeSTATE
{
	FREE,
	PURSUE,
	ATTACK,
	EVADE,
	SPIT
}