private["_info","_c","_sideT","_side","_faction","_level","_delay","_base","_aimingAccuracy","_aimingSpeed","_commanding","_courage","_general","_reloadSpeed","_spotDistance","_spotTime","_aimingShake","_units","_process","_registered"];
if!(isServer)exitWith{};
_info=_this;
if(TIME<15)then{sleep 30};

_c=0;
_sideT=_info select _c;_c=_c+1;
_side=WEST;
if(_sideT=="EAST")then{_side=EAST};if(_sideT=="RESISTANCE")then{_side=RESISTANCE};

_faction=_info select _c;_c=_c+1;
_level=_info select _c;_c=_c+1;
_delay=_info select _c;_c=_c+1;_delay=_delay*60;
_base=_info select _c;_c=_c+1;
_aimingAccuracy=_info select _c;_c=_c+1;
_aimingSpeed=_info select _c;_c=_c+1;
_commanding=_info select _c;_c=_c+1;
_courage=_info select _c;_c=_c+1;
_general=_info select _c;_c=_c+1;
_reloadSpeed=_info select _c;_c=_c+1;
_spotDistance=_info select _c;_c=_c+1;
_spotTime=_info select _c;_c=_c+1;
_aimingShake=_info select _c;_c=_c+1;

if(_level=="VERYLOW")then{
	_base=.1;
	_aimingAccuracy=.001;
	_aimingSpeed=.1;
	_commanding=1;
	_courage=.1;
	_general=.1;
	_reloadSpeed=.1;
	_spotDistance=.1;
	_spotTime=.1;
	_aimingShake=.001;
};

if(_level=="LOW")then{
	_base=.1;
	_aimingAccuracy=.01;
	_aimingSpeed=.1;
	_commanding=1;
	_courage=.1;
	_general=.1;
	_reloadSpeed=.1;
	_spotDistance=.1;
	_spotTime=.1;
	_aimingShake=.1;
};

if(_level=="MEDIUM")then{
	_base=.3;
	_aimingAccuracy=.01;
	_aimingSpeed=.1;
	_commanding=.8;
	_courage=.7;
	_general=.5;
	_reloadSpeed=.3;
	_spotDistance=.3;
	_spotTime=1;
	_aimingShake=.1;
};

if(_level=="HIGH")then{
	_base=.5;
	_aimingAccuracy=.1;
	_aimingSpeed=1;
	_commanding=1;
	_courage=1;
	_general=1;
	_reloadSpeed=1;
	_spotDistance=1;
	_spotTime=.4;
	_aimingShake=.2;
};

if(_level=="VERYHIGH")then{
	_base=1;
	_aimingAccuracy=.1;
	_aimingSpeed=1;
	_commanding=1;
	_courage=1;
	_general=1;
	_reloadSpeed=1;
	_spotDistance=1;
	_spotTime=1;
	_aimingShake=1;
};

if(_level=="LOWACC")then{
	_base=1;
	_aimingAccuracy=.0001;
	_aimingSpeed=.1;
	_commanding=1;
	_courage=1;
	_general=1;
	_reloadSpeed=1;
	_spotDistance=1;
	_spotTime=1;
	_aimingShake=.0001;
};

_units=[];
_process=[];
_registered=[];
while{TRUE}do{
	_units=allUnits;
	_units=_units-_registered;
	_process=[];
	{
	if(_sideT="FACTION")then{
		if!(isNil{_x getVariable"dmpFaction"})then{if((_x getVariable"dmpFaction")==_faction)then{_process pushBack _x}};
	}else{if((side _x)==_side)then{_process pushBack _x}};
	{
	_x setSkill _base;
	_x setSkill["aimingAccuracy",_aimingAccuracy];
	_x setSkill["aimingSpeed",_aimingSpeed];
	_x setSkill["commanding",_commanding];
	_x setSkill["courage",_courage];
	_x setSkill["general",_general];
	_x setSkill["reloadSpeed",_reloadSpeed];
	_x setSkill["spotDistance",_spotDistance];
	_x setSkill["spotTime",_spotTime];
	_x setSkill["aimingShake",_aimingShake];
	_registered pushBack _x;
	}forEach _process;
	sleep _delay;
};