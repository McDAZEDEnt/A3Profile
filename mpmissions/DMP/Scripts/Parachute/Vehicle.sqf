private["_pos","_alt","_vehicle","_parachute"];
_pos=_this select 0;
_alt=_this select 1;
_vehicle=_this select 2;
if(_alt<100)then{_alt=100};
while{TRUE}do{
	if(((getPosATL _vehicle)select 2)<_alt)exitWith{};
	sleep .1;
};
	
if((getDammage _vehicle)>0.4)exitWith{};
_parachute="B_parachute_02_F"createVehicle[0,0,1000];
_parachute setPosATL(getPosATL _vehicle);
_vehicle attachTo[_parachute,[0,0,0]];

while{TRUE}do{
	if(((getPosATL _vehicle)select 2)<10)exitWith{};
	sleep .1;
};
detach _vehicle;