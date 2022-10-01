private["_man","_dam"];
_man=_this select 0;
_dam=_this select 2;
//if!(alive _man)then{_man setDammage 0;_man allowDamage FALSE;execVM"DMP\Scripts\RPG\Player\Killed.sqf"};
if!(alive _man)then{execVM"DMP\Scripts\RPG\Player\Killed.sqf"};
if(_dam>.3)then{dmpDebuffs pushBackUnique"Bleeding";systemChat"Bleeding"};