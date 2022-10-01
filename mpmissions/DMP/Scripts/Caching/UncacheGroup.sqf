private["_group","_unit","_units"];
_group=_this;
_group setVariable["dmpCached",FALSE,TRUE];
_unit=objNull;
_units=units _group;
{
_unit=_x;
_unit hideObjectGlobal FALSE;
(vehicle _unit)hideObjectGlobal FALSE;
if(dmpCacheSimulation)then{
	_unit enableSimulationGlobal TRUE;
	(vehicle _unit)enableSimulationGlobal TRUE;
};
{_unit enableAI _x}forEach dmpAIlist;
}forEach _units;