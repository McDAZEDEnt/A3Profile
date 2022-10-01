private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpMissionsReady")};
waitUntil{dmpMissionsReady};
sleep 1;

if(_activated)then{
[
_units,
(_module getVariable"dmpCampaignReportText")
]execVM"DMP\Scripts\Missions\zzzCampaignReport.sqf";
};
TRUE