params ["_player", "_didJIP"];

[_player,""] call BIS_fnc_setUnitInsignia;
[_player,"sf"] call BIS_fnc_setUnitInsignia;

// Event Handler to add the left shoulder patch again after players close the arsenal!
[missionNamespace, "arsenalClosed", {

  [player,""] call BIS_fnc_setUnitInsignia;
  [player,"sf"] call BIS_fnc_setUnitInsignia;

}] call BIS_fnc_addScriptedEventHandler;

uiSleep 60;
[] call BIS_fnc_showMissionStatus;
