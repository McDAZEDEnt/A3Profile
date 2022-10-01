private["_pos","_man","_parachute"];
_man=_this;
if!(_man isKindOf"Man")exitWith{};
while{TRUE}do{
	if!(alive _man)exitWith{};
	if!((vehicle _man)==_man)exitWith{};
	if(((getPosATL _man)select 2)<100)exitWith{};
	sleep .3;
};
if!(alive _man)exitWith{};
if!((vehicle _man)==_man)exitWith{};
if(dmpDebug)then{systemChat format["%1 deploying chute (%2)",_man,vehicle _man]};
sleep(random 1);
_pos=getPosATL _man;
_parachute="Steerable_Parachute_F"createVehicle _pos;
_parachute setPosATL _pos;
_man assignAsDriver _parachute;
_man moveInDriver _parachute;