// Saves all objects and empty vehicles near players and dmpTents
private["_type","_pos","_dir","_dam","_fuel","_cargo","_vehicles","_radius"];
dmpRPGsavedObjects=[]; // objects that have been saved
dmpRPGsavedObjectInfo=[]; // virtual information of saved objects

_positions=[];
{_positions pushBackUnique(getPosASL _x)}forEach(allMissionObjects"dmpTent_v");
_players=call BIS_fnc_ListPlayers;
_players=_players-(entities"HeadlessClient_F");
{_positions pushBackUnique(getPosASL _x)}forEach(_players);

{[_x,dmpRPGsaveRadius]call dmp_fnc_RPGsaveobjects}forEach _positions;
systemChat"Objects saved";
sleep 1;
profileNamespace setVariable[dmpSaveNameRPGIC,[dmpRPGsavedObjectInfo]];