private["_group"];
_group=_this;
(leader _group)setVariable["dmpHVT",TRUE,TRUE];
//(leader _group)setRank"COLONEL";
_group setVariable["Vcm_Disable",TRUE];
[_group,200]execVM"DMP\Scripts\AI\Garrison.sqf";
dmpHVTgroups pushBack _group;