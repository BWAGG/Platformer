event_inherited();

vsp = 0;
grv = 0.15;
base_speed = 4;
curr_speed = base_speed;
hsp = curr_speed;

attacks = 0;
attackdelay = 0;
tired_dur = 120;
jump_speed = 0;


hp = 8;
flash = 0;
invuln = 0;
stopped = true;
hitByAttack = ds_list_create();

state = DingoSTATE.FREE;

enum DingoSTATE
{
	FREE,
	PURSUE,
	ATTACK,
	WAIT,
	TIRED
}