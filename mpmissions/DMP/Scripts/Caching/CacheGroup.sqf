private["_group","_unit","_leader","_units","_dontCache"];
_group=_this;
_unit=objNull;
_leader=leader _group;
_units=units _group;
_group setVariable["dmpCached",TRUE,TRUE];
_dontCache=[_leader,vehicle _leader];
_dontCache=_dontCache+(crew(vehicle _leader));
_units=_units-_dontCache;
{
_unit=_x;
{_unit disableAI _x}forEach dmpAIlist;
_unit hideObjectGlobal TRUE;
(vehicle _unit)hideObjectGlobal TRUE;
if(dmpCacheSimulation)then{
	_unit enableSimulationGlobal FALSE;
	(vehicle _unit)enableSimulationGlobal FALSE;
};
}forEach _units;
// Leaders (don't cache)
{
_unit=_x;
_unit hideObjectGlobal FALSE;
(vehicle _unit)hideObjectGlobal FALSE;
if(dmpCacheSimulation)then{
	_unit enableSimulationGlobal TRUE;
	(vehicle _unit)enableSimulationGlobal TRUE;
};
{_unit enableAI _x}forEach dmpAIlist;
}forEach _dontCache;
