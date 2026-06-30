hsp = 0;
vsp = 0;
grv = 0.15;
walksp = 0.5;
double_jump = true;
attackdelay = 0;
max_hp = 10;
hp = 10;
flash = 0;
invuln = false;
init_speed = 0;
ability_charge = 0;
ability_keys = ["SPC", "SHI", "H", "J", "K", "L"];

state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();
current_released = false;
current = 0;
ability_sprite = 0;

enum PLAYERSTATE
{
	FREE,
	ATTACK_PECK,
	ATTACK_SPIT,
	ATTACK_TERRAIN,
	ROLL,
	DEAD,
	PAUSED
}