if!(isServer)exitWith{};
private["_man"];
_man=_this;
_man disableAI"RADIOPROTOCOL";
_man addMPEventHandler["mpKilled",{_this execVM"DMP\Scripts\Civilians\KilledCiv.sqf"}];
_man call DMP_fnc_InitCiv;