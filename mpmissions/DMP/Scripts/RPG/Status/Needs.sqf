if!(local player)exitWith{};
private["_info","_c","_cycle"];
_cycle=_this;

//dmpScriptOpenInv="DMP\Scripts\RPG\Status\Display.sqf";
dmpScriptCloseInv="DMP\Scripts\RPG\Status\Hide.sqf";

while{TRUE}do{
	sleep _cycle;
	FALSE call dmp_fnc_NeedsUpdate;
};