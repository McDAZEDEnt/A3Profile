private["_allDown","_players"];
_allDown=TRUE;
if(dmpEndAllDown=="NO")exitWith{FALSE};
_players=call dmp_fnc_ListPlayers;
_players=_players-(entities"HeadlessClient_F");
{if!(alive _x)then{_players=_players-[_x]}}forEach _players;
if(dmpEndAllDown=="INCAP")then{
	{if((lifeState _x)=="INCAPACITATED")then{_players=_players-[_x]}}forEach _players;
};
if((count _players)>0)then{_allDown=FALSE};
_allDown