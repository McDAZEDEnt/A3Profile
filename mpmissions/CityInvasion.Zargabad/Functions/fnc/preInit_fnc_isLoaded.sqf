addMissionEventHandler ["Loaded", 
{
	params ["_saveType"];
	missionNamespace setVariable ["isLoaded", true]; // same as: StringVariable = "myString";
}];