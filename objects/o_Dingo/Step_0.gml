event_inherited();

switch (state)
{
	case DingoSTATE.FREE: DingoState_Patrol(); break;
	case DingoSTATE.PURSUE: DingoState_Pursue(); break;
	case DingoSTATE.ATTACK: DingoState_Attack(); break;
	case DingoSTATE.WAIT: DingoState_Wait(); break;
	case DingoSTATE.TIRED: DingoState_Tired(); break;
}