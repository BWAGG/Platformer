vsp = 0;
grv = 0.15;
walksp = 2;
hsp = walksp;
attackdelay = 0;


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
	ATTACK
}