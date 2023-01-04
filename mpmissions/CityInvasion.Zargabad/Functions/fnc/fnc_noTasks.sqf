params ["_thisVeh"];
_thisVeh = (_this select 0);

noTasks synchronizeObjectsAdd [_thisVeh];

{
	noTasks synchronizeObjectsAdd [_x];
} forEach fullCrew _thisVeh;
