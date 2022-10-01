// Delete men
{
if(_x call DMP_fnc_DoSave)then{
	if(isPlayer _x)exitWith{};
	if((side _x)in dmpSaveSides)then{
		//systemChat format["deleting: %1",typeOf _x];
		deleteVehicle _x;
	}else{systemChat"NO DELETE"};
};
}forEach allUnits;
// Delete existing objects/vehicles
if(dmpSaveObjects)then{
	{
		if(_x call DMP_fnc_DoSave)then{
			//systemChat format["deleting: %1",typeOf _x];
			deleteVehicle _x;
		};
	}forEach vehicles
};
TRUE