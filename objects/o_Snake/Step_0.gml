event_inherited();

switch (state)
{
	case SnakeSTATE.FREE: SnakeState_Patrol(); break;
	case SnakeSTATE.PURSUE: SnakeState_Pursue(); break;
	case SnakeSTATE.ATTACK: SnakeState_Attack(); break;
}