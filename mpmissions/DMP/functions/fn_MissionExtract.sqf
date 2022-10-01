private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 1;
waitUntil{!(isNil"dmpExtractionPoints")};
dmpExtractionPoints pushBack(getPos _module);
dmpGenerateExtractPoint=FALSE;
if((_module getVariable"dmpMissionExtractRandom")=="TRUE")then{dmpGenerateExtractPoint=TRUE};
dmpGenerateExtractDistance=(_module getVariable"dmpMissionExtractDistance");
dmpGenerateExtractDistanceComplete=(_module getVariable"dmpMissionExtractDistanceComplete");
TRUE