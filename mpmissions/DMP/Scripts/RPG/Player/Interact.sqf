private["_object","_type","_pos","_animIn","_animOut"];
_object=cursorObject;
_type=toLower(typeOf _object);
_pos=[];
_animIn="AinvPknlMstpSnonWrflDnon_AinvPknlMstpSnonWrflDnon_medic";
_animOut="AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
if(dmpDebug)then{systemChat format["%1",typeOf _object]};
if(_type in["dmptent_v","fireplace_burning_f","land_sleeping_bag_f"])then{
	if((player distance _object)>3)exitWith{if(dmpDebug)then{hintSilent"Too far"}};
	if(_type=="dmpTent_v")exitWith{
		if(((count(itemCargo _object))+(count(weaponCargo _object))+(count(magazineCargo _object)))>0)exitWith{hintSilent"Tent contains items"};
		closeDialog 0;player playMove _animIn;sleep 3;//player playMove _animOut;sleep 2;
		_pos=getPosATL _object;
		deleteVehicle _object;
		//_object="dmpRPGTent_V"createVehicle _pos;
		sleep .3;
		_object=createVehicle["dmpTentbag_v",_pos,[],0,"none"];
	};
	if(_type=="firePlace_burning_f")exitWith{
		closeDialog 0;player playMove _animIn;sleep 3;//player playMove _animOut;sleep 2;
		deleteVehicle _object;
	};
	if(_type=="land_sleeping_bag_f")exitWith{
		closeDialog 0;player playMove _animIn;sleep 3;//player playMove _animOut;sleep 2;
		_pos=getPosATL _object;
		deleteVehicle _object;
		//_object="dmpRPGSleepingBag_V"createVehicle _pos;
		sleep .3;
		_object=createVehicle["dmpSleepingbag_v",_pos,[],0,"none"];
	};
};
if!(dmpScriptInteract=="")exitWith{execVM dmpScriptInteract};