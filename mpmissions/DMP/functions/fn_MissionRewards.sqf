private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
if(dmpExit)exitWith{};
sleep 4;
if((count(entities"DMP_LimitStaticMissions"))>0)then{sleep 2};if(isNull _module)exitWith{};
if(_activated)then{
[
(_module getVariable"dmpDefault"),
(_module getVariable"dmpRecon"),
(_module getVariable"dmpKill"),
(_module getVariable"dmpDestroySquad"),
(_module getVariable"dmpDestroyVehicles"),
(_module getVariable"dmpClear"),
(_module getVariable"dmpSEAD"),
(_module getVariable"dmpRescue"),
(_module getVariable"dmpInterdict"),
(_module getVariable"dmpDestroyStructure"),
(_module getVariable"dmpDestroyShips"),
(_module getVariable"dmpDestroyAircraft"),
(_module getVariable"dmpDeliver"),
(_module getVariable"dmpAerialRecon"),
(_module getVariable"dmpClearMines"),
(_module getVariable"dmpFindCache"),
(_module getVariable"dmpMeetLeader")
]execVM"DMP\Scripts\Missions\SetRewards.sqf";
};
true