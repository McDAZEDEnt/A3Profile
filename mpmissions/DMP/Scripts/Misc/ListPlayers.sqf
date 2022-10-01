private["_players"];
_players=call BIS_fnc_ListPlayers;
_players=_players-(entities"HeadlessClient_F");
{if!(alive _x)then{_players=_players-[_x]}}forEach _players;
_players