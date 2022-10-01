private["_target","_target2","_HVTs","_text","_approval"];
_target=cursorObject;
if(([(side player),(side _target)]call BIS_fnc_sideIsEnemy)AND(_target isKindOf"MAN"))exitWith{
	if((player distance _target)>10)exitWith{};
	_target execVM"DMP\Scripts\Player\Freeze.sqf";
};

_target2=objNull;
_HVTs=[];
if(dmpCampaignMode)then{systemChat format["Campaign status: %1/%2",round dmpCVP,round dmpCVPtarget]};
_text="very low";
_approval=0;
if(dmpHVThunt)then{
	if((side player)==WEST)then{_approval=dmpCivAttitudeWest};
	if((side player)==EAST)then{_approval=dmpCivAttitudeEast};
	if((side player)==RESISTANCE)then{_approval=dmpCivAttitudeRes};
	if(_approval>20)then{_text="low"};
	if(_approval>40)then{_text="moderate"};
	if(_approval>40)then{_text="high"};
	if(_approval>80)then{_text="very high"};
	if(dmpHVThunt)then{hint format["Civilian approval is %1\n\n%2 HVTs remain",_text,count([dmpCenter,dmpEnemySide]call dmp_fnc_GetHVTs)]};
};
if(dmpDebug)then{systemChat format["Interact:  %1  (%2)",(typeOf _target)call dmp_fnc_GetDisplayName,typeOf _target]};
if!(isNil{_target getVariable"dmpMissionGiver"})exitWith{
	if!(alive _target)exitWith{};
	if((player distance _target)>5)exitWith{};
	if(_target getVariable"dmpMissionGiver")then{execVM"DMP\Scripts\Missions\SingleMission.sqf"};
};
if(_target isKindOf"MAN")exitWith{
	if((player distance _target)>5)exitWith{};
	if!(isNil{_target getVariable"dmpTraderInfo"})exitWith{
		if!([side player,side _target]call BIS_fnc_sideIsEnemy)then{
			if!(weaponLowered player)exitWith{_target globalChat"Get that gun out of my face!"};
			dmpCurrentTrader=_target;
			//_target doWatch player;
			execVM"DMP\Scripts\Trade\Dialog.sqf";
		};
	};
	//if((side _target)==CIVILIAN)exitWith{[_target]execVM"DMP\Scripts\Interaction\InteractCiv.sqf"};
	if((_target call DMP_fnc_GetSide)==CIVILIAN)exitWith{[_target]execVM"DMP\Scripts\Interaction\InteractCiv.sqf"};
	//if([(side player),(side _target)]call BIS_fnc_sideIsEnemy)exitWith{_target execVM"DMP\Scripts\Player\Freeze.sqf"};
};