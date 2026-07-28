//movement variables
hsp = 0;
vsp = 0;
grv = 0.15;
walksp = 0.5;
init_speed = 0;
double_jump=true;
//key variables

ability_keys = ["SPC", "SHI", "J", "K", "L"];

//coyote time variables
coyote_dur = 10;
coyote = coyote_dur;

//hit variables
hit_invuln = 60;
flash_interval = 20;
flash_duration= 10;
attackdelay = 0;
max_hp = 10;
hp = 10;
flash = 0;
invuln = false;
hitByAttack = ds_list_create();

//Fear Variables
fright = 0;
scared_threshold = 1000;
max_fright = 1500;

//charge variables
ability_charge = 0;
current_released = false;
current = 0;

//ability drawing variables
ability_sprite = 0;

//buffer variables
jump_buffer = false;

//state setter
state = PLAYERSTATE.FREE;

enum PLAYERSTATE
{
	FREE,
	ATTACK_PECK,
	ATTACK_SPIT,
	ATTACK_TERRAIN,
	ATTACK_KICK,
	ATTACK_STAB,
	WALL_CLING,
	ROLL,
	DEAD,
	PAUSED
}