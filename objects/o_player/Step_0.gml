//Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check_pressed(ord("W"));
key_ability0 = keyboard_check_pressed(vk_space);

switch (state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	case PLAYERSTATE.ATTACK_JAB: PlayerState_Poke(); break;
	case PLAYERSTATE.ATTACK_PECK: PlayerState_Peck(); break;
	case PLAYERSTATE.DEAD: break;
}