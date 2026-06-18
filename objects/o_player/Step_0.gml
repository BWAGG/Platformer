//Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check_pressed(ord("W"));
key_interact = keyboard_check_pressed(ord("I"));
key_ability0 = keyboard_check_pressed(vk_space);
key_ability1 = keyboard_check_pressed(vk_shift);
key_ability2 = keyboard_check_pressed(ord("J"));

switch (state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	case PLAYERSTATE.ATTACK_SPIT: PlayerState_Spit(); break;
	case PLAYERSTATE.ATTACK_PECK: PlayerState_Peck(); break;
	case PLAYERSTATE.ROLL: PlayerState_Roll(); break;
	case PLAYERSTATE.DEAD: break;
}