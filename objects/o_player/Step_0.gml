//Get Player Input
key_a2_chg = ord(ability_keys[2]);
key_a3_chg = ord(ability_keys[3]);
key_a4_chg = ord(ability_keys[4]);
key_a5_chg = ord(ability_keys[5]);
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check_pressed(ord("W"));
key_interact = keyboard_check_pressed(ord("I"));
key_ability0 = keyboard_check_pressed(vk_space);
key_ability1 = keyboard_check_pressed(vk_shift);
key_ability2 = keyboard_check_pressed(key_a2_chg);
key_ability3 = keyboard_check_pressed(key_a3_chg);
key_ability4 = keyboard_check_pressed(key_a4_chg);
key_ability5 = keyboard_check_pressed(key_a5_chg);
current_released = keyboard_check_released(current);
coyote--;

switch (state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	case PLAYERSTATE.ATTACK_SPIT: PlayerState_Spit(); break;
	case PLAYERSTATE.ATTACK_PECK: PlayerState_Peck(); break;
	case PLAYERSTATE.ATTACK_TERRAIN: PlayerState_Terrain(); break;
	case PLAYERSTATE.ATTACK_KICK: PlayerState_Kick(); break;
	case PLAYERSTATE.ROLL: PlayerState_Roll(); break;
	case PLAYERSTATE.DEAD: break;
}