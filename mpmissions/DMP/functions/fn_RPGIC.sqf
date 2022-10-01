private["_module","_units","_activated"];
sleep .3;
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if(_activated)then{
[
(_module getVariable"dmpSavePosition"),
(_module getVariable"dmpSaveInjuries"),
(_module getVariable"dmpSaveRadius"),
(_module getVariable"dmpPlayersCanEnd")
]execVM"DMP\Scripts\RPGIC\Start.sqf";
};
TRUE