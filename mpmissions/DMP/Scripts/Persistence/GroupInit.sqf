private["_groupInfo","_groupVehicleInfo","_groupManInfo","_manInfo","_id","_status","_loadout","_vars","_name","_type","_side","_rank","_face","_speaker","_pitch","_pos","_dir","_uPos","_dam","_AItype","_sideTrue","_group","_man","_vehicle","_role"];
_group=_this;
sleep 1;
if(dmpDebug)then{[_group,_AItype]execVM"DMP\Scripts\AI\Track.sqf"};
if(isNil{(leader _group)getVariable"dmpAItype"})then{
	{_x setVariable["dmpAItype","Patrol",TRUE]}forEach(units _group);
};