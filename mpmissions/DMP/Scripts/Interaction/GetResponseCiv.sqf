// Gets a response from a civ's variables and returns it
private["_man","_action","_text","_out","_manKnowledge","_c","_attitudes","_leaders","_HVT","_groups","_captives","_caches","_special","_index","_language"];
_man=_this select 0;
_action=_this select 1;
_action=toUpper _action;
_text="";
_out=selectRandom["I don't know anything.","Sorry, I don't know.","No idea.","I haven't seen anything.","I know nothing about that."];
if(isNil{_man getVariable"dmpInteractKnowledge"})then{_man setVariable["dmpInteractKnowledge",[],TRUE]};
_manKnowledge=_man getVariable"dmpInteractKnowledge";
if((count _manKnowledge)!=7)then{_man call DMP_fnc_InitCiv};
_c=0;
_attitudes=_manKnowledge select _c;_c=_c+1;
_leaders=_manKnowledge select _c;_c=_c+1;
_HVT=_manKnowledge select _c;_c=_c+1;
_groups=_manKnowledge select _c;_c=_c+1;
_captives=_manKnowledge select _c;_c=_c+1;
_caches=_manKnowledge select _c;_c=_c+1;
_special=_manKnowledge select _c;_c=_c+1;
_index=3;
if((side player)==WEST)then{_index=0};
if((side player)==EAST)then{_index=1};
if((side player)==RESISTANCE)then{_index=2};
if(_action=="BYE")then{closeDialog 0;_man forceSpeed -1};
// Doesn't want to talk;
if!(_attitudes select _index)then{_action="";_out=selectRandom["I don't know anything.","Sorry, I don't know.","No idea.","I haven't seen anything.","I know nothing about that."]};
_language=toUpper(dmpLanguages select _index);
if!(_language==dmpLanguageCivilian)then{
	if(player getVariable"dmpInterpreter")exitWith{};
	_out="(You don't understand this language)";
	_action="";
};
if(_action=="LEADER")then{
	if((count _leaders)<1)exitWith{_out};
	_out="There is a leader here.";
	_pos=getPos(_leaders select 0);
	[_pos,"LEADER"]execVM"DMP\Scripts\Interaction\Marker.sqf";
};
if(_action=="HVT")then{
	if((count _HVT)<1)exitWith{_out};
	_out="There is a HVT here.";
	_pos=getPos(_HVT select 0);
	[_pos,"HVT"]execVM"DMP\Scripts\Interaction\Marker.sqf";
};
if(_action=="TROOPS")then{
	if((count _groups)<1)exitWith{_out};
	_out="There are some soldiers here.";
	_pos=getPos(leader(_groups select 0));
	[_pos,"TROOPS"]execVM"DMP\Scripts\Interaction\Marker.sqf";
};
if(_action=="CAPTIVE")then{
	if((count _captives)<1)exitWith{_out};
	_out="There is a captive here.";
	_pos=getPos(_captives select 0);
	//_pos=getPos(selectRandom _captives};
	[_pos,"CAPTIVE"]execVM"DMP\Scripts\Interaction\Marker.sqf";
};
if(_action=="CACHE")then{
	if((count _caches)<1)exitWith{_out};
	_out="There is a cache here.";
	_pos=getPos(_caches select 0);
	[_pos,"CACHE"]execVM"DMP\Scripts\Interaction\Marker.sqf";
};
if(_action=="SPECIAL")then{
	if((count _special)<1)exitWith{_out};
	_text=(_special select 0)getVariable"dmpKnowledgeSpecial";
	_out=format["There is %1 here.",_text];
	_pos=getPos(_special select 0);
	[_pos,_text]execVM"DMP\Scripts\Interaction\Marker.sqf";
};
_out