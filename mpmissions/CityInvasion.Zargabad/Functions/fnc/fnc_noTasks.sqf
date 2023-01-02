params ["_thisVeh"];
_thisVeh = (_this select 0);
_crew = fullCrew _thisVeh;

noTasks synchronizeObjectsAdd [_thisVeh];

{
	noTasks synchronizeObjectsAdd [_x];
} forEach fullCrew _crew;
