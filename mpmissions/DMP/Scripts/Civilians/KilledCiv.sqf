private["_man","_killer","_side","_penalty"];
_man=_this select 0;
_killer=_this select 1;
_man remoteExec["removeAllActions",0,TRUE];
if!(isServer)exitWith{};
if(TIME<60)exitWith{};
dmpDeadCivs=dmpDeadCivs+1;
//dmpCivilianApproval=dmpCivilianApproval-dmpCivilianDeathCost;publicVariable"dmpCivilianApproval";
dmpCVP=dmpCVP-dmpCivilianDeathCost;
publicVariable"dmpCVP";
if((dmpReportCivDeaths)OR(dmpDebug))then{systemChat"Civilian killed"};
_side=side _killer;
_penalty=dmpCivKillPenalty;
if(_side==WEST)then{dmpCivAttitudeWest=dmpCivAttitudeWest-_penalty;publicVariable"dmpCivAttitudeWest"};
if(_side==EAST)then{dmpCivAttitudeEast=dmpCivAttitudeEast-_penalty;publicVariable"dmpCivAttitudeEast"};
if(_side==WEST)then{dmpCivAttitudeRes=dmpCivAttitudeRes-_penalty;publicVariable"dmpCivAttitudeRes"};