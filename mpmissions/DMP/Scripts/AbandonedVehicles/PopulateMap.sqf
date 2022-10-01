private["_c","_info","_units","_countVehicles","_countHelos","_countPlanes","_damage","_fuel","_clearCargo","_addLoot","_script","_unitTypes","_index","_pos","_roads","_count","_tries","_chanceTown","_vehicle","_spawn","_description"];
if(dmpDebug)then{systemChat"Populate Map ABANDONED VEHICLES..."};
_info=_this select 0;
_units=_this select 1;

_countVehicles=0;
_countHelos=0;
_countPlanes=0;
_damage=[];
_fuel=[];
_clearCargo=FALSE;
_addLoot=FALSE;
_script="";

_c=0;

_a=(_info select _c)call dmp_fnc_ParseArray;_countVehicles=_a call BIS_fnc_RandomInt;_c=_c+1;
_a=(_info select _c)call dmp_fnc_ParseArray;_countHelos=_a call BIS_fnc_RandomInt;_c=_c+1;
_a=(_info select _c)call dmp_fnc_ParseArray;_countPlanes=_a call BIS_fnc_RandomInt;_c=_c+1;
_damage=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_fuel=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;

_clearCargo=TRUE;if((_info select _c)=="FALSE")then{_clearCargo=FALSE};_c=_c+1;
_addLoot=TRUE;if((_info select _c)=="FALSE")then{_addLoot=FALSE};_c=_c+1;
_script=_info select _c;_c=_c+1;

_unitTypes=[];
_index=0;
_pos=[];
_roads=[];
_count=0;
_tries=0;
_chanceTown=20;
_vehicle=objNull;
_spawn=TRUE;
_description="Vehicle";
while{TRUE}do{
	_unitTypes=_units select 0;_count=_countVehicles;
	if(_index==1)then{_unitTypes=_units select 1;_count=_countHelos;_description="Helo"};
	if(_index==2)then{_unitTypes=_units select 2;_count=_countPlanes;_description="Plane"};
	while{_count>0}do{
		sleep .1;
		_tries=5;
		_roads=[];
		_spawn=TRUE;
		while{_tries>0}do{
			_chanceTown=20;
			_pos=[];
			if((count dmpLocations)==0)then{_chanceTown=0};
			if((random 100)<_chanceTown)then{_pos=selectRandom dmpLocations}
			else{_pos=selectRandom dmpRemoteAreas};
			if(_index==0)then{
				_roads=_pos nearRoads 700;
				_tries=_tries-1;
				if((count _roads)>0)then{_tries=0};
			}else{_tries=0};
		};
		if!(_pos call dmp_fnc_BlacklistCheck)then{_spawn=FALSE};
		if(_spawn)then{
			if((count _roads)>0)then{_pos=getPos(selectRandom _roads)}else{_pos=[_pos,0,100,1,0,1,0]call BIS_fnc_findSafePos};
			_pos=[_pos select 0,_pos select 1,10];
			_vehicle=createVehicle[(selectRandom _unitTypes),_pos,[],0,"none"];
			_vehicle setDir(random 360);
			_vehicle setVehiclePosition[_pos,[],0,"none"];
			if((_damage select 1)>0)then{_vehicle setDammage(_damage call BIS_fnc_RandomNum)};
			_vehicle setFuel(_fuel call BIS_fnc_RandomNum);
			if(_clearCargo)then{clearItemCargoGlobal _vehicle;clearWeaponCargoGlobal _vehicle;clearMagazineCargoGlobal _vehicle;clearBackpackCargoGlobal _vehicle};
			if(_addLoot)then{_vehicle execVM"DMP\Scripts\AbandonedVehicles\AddLoot.sqf"};
			if!(_script=="")then{_vehicle execVM _script};
			_vehicle setVariable["dmpAItype",(format["Abandoned%1",_description]),TRUE];
			if(dmpDebug)then{[_pos,(format["Abandoned%1",_description])]execVM"DMP\Scripts\Misc\DebugMarker.sqf"};
		};
		_count=_count-1;
	};
	sleep .3;
	_index=_index+1;
	if(_index>2)exitWith{};
};