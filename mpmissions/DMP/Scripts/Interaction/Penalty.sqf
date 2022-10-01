private["_side","_man","_penalty"];
_side=_this select 0;
_man=_this select 1;
_penalty=dmpCivDetainPenalty;
if(_man getVariable"dmpCivilianLeader")then{_penalty=dmpCivDetainPenaltyL};
if(_side==WEST)then{dmpCivAttitudeWest=dmpCivAttitudeWest-_penalty;publicVariable"dmpCivAttitudeWest"};
if(_side==EAST)then{dmpCivAttitudeEast=dmpCivAttitudeEast-_penalty;publicVariable"dmpCivAttitudeEast"};
if(_side==WEST)then{dmpCivAttitudeRes=dmpCivAttitudeRes-_penalty;publicVariable"dmpCivAttitudeRes"};
_penalty