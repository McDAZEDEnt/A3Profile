// spawn in a new group. Then you can join it if you want to
private["_c","_vehicle","_side","_vehicleGroup","_spawnInfo","_factionName","_side","_useAI","_chanceGroupDead","_scriptMen","_scriptVehicles","_squadSize","_vehicleSize","_passengerChance","_passengerCountA","_passengerCount","_joinGroup","_unitTypes","_typesLeader","_typesSquadLeader","_typesInfantry","_typesCrew","_typesVehicles","_typesStatic","_typesPilot","_typesHelo","_typesPlane","_typesDrone","_pos","_group"];

_c=0;
_vehicle=_this select _c;_c=_c+1;
_side=_this select _c;_c=_c+1;
_vehicleGroup=_this select _c;_c=_c+1;
_spawnInfo=_this select _c;_c=_c+1;

_c=0;
_factionName=_spawnInfo select _c;_c=_c+1;
_side=_spawnInfo select _c;_c=_c+1;
_useAI=_spawnInfo select _c;_c=_c+1;
_chanceGroupDead=_spawnInfo select _c;_c=_c+1;
_scriptMen=_spawnInfo select _c;_c=_c+1;
_scriptVehicles=_spawnInfo select _c;_c=_c+1;
_squadSize=_spawnInfo select _c;_c=_c+1;
_vehicleSize=_spawnInfo select _c;_c=_c+1;
_passengerChance=_spawnInfo select _c;_c=_c+1;
_passengerCountA=_spawnInfo select _c;_c=_c+1;
_passengerCount=0;
_passengerJoin=TRUE;
if((_spawnInfo select _c)=="FALSE")then{_passengerJoin=FALSE};_c=_c+1;

_unitTypes=_spawnInfo select((count _spawnInfo)-1);
_c=0;
_typesLeader=_unitTypes select _c;_c=_c+1;
_typesSquadLeader=_unitTypes select _c;_c=_c+1;
_typesInfantry=_unitTypes select _c;_c=_c+1;
_typesCrew=_unitTypes select _c;_c=_c+1;
_typesVehicles=_unitTypes select _c;_c=_c+1;
_typesStatic=_unitTypes select _c;_c=_c+1;
_typesPilot=_unitTypes select _c;_c=_c+1;
_typesHelo=_unitTypes select _c;_c=_c+1;
_typesPlane=_unitTypes select _c;_c=_c+1;
_typesDrone=_unitTypes select _c;_c=_c+1;

if((random 100)>_passengerChance)exitWith{};
if((_vehicle emptyPositions "Cargo")<1)exitWith{};
_passengerCount=_passengerCountA call BIS_fnc_RandomInt;
if(_passengerCount<1)exitWith{};

_pos=getPos _vehicle;
_group=createGroup _side;
(selectRandom _typesSquadLeader)createunit[_pos,_group,"",1,"SERGEANT"];
_passengerCount=_passengerCount-1;

while{_passengerCount>0}do{
	if((_vehicle emptyPositions "Cargo")<1)exitWith{};
	(selectRandom _typesInfantry)createunit[_pos,_group,"",1,"PRIVATE"];
	_passengerCount=_passengerCount-1;
	sleep .3;
	{
	if((vehicle _x)==_x)then{
		_x assignAsCargo _vehicle;
		sleep .3;
		_x moveInCargo _vehicle;
		sleep .3;
	};
	}forEach units _group;
};
{_x execVM"DMP\Scripts\Spawn\PrepMan.sqf"}forEach units _group;
sleep 1;

if(_passengerJoin)then{{[_x]join _vehicleGroup}forEach units _group};

{if((vehicle _x)==_x)then{deleteVehicle _x}}forEach units _group;
sleep 1;
{
_x setVariable["dmpAItype","Cargo",TRUE];
_x setVariable["dmpFaction",_factionName,TRUE];
if!(_scriptMen=="")then{_x execVM _scriptMen};
}forEach units _group;