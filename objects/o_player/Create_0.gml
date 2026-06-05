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

state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();

enum PLAYERSTATE
{
	FREE,
	ATTACK_PECK,
	ATTACK_JAB,
	ROLL,
	DEAD
}