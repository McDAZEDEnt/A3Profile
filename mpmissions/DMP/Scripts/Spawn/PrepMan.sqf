if(dmpCVPman==0)exitWith{};
if!(isServer)exitWith{};
private["_man"];
_man=_this;
if!((side _man)==dmpEnemySide)exitWith{};
_man addMPEventHandler["mpKilled",{_this execVM"DMP\Scripts\Spawn\KilledMan.sqf"}];