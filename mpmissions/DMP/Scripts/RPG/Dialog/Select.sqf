private["_index","_action"];
disableSerialization;
if!(_this)exitWith{};
_index=lbCurSel 10000;
_action=lbData[10000,_index];
_action execVM"DMP\Scripts\RPG\Actions\Actions.sqf";