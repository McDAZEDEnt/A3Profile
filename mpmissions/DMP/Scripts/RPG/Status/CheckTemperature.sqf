// Increments a player's exposure/thirst based on the temperature, player clothes, fire and shelter
private["_sleep","_temp","_minSafeTemp","_maxSafeTemp","_temp","_fire","_inside","_tempBonus","_deficiency","_excess","_message"];
//_sleep=FALSE;if((count _this)>0)then{_sleep=_this};
_sleep=_this;
_temp=0;
_minSafeTemp=20;
_maxSafeTemp=30;
_temp=GF_Temperature_Sum_Air+((call dmp_fnc_ClothingWarmth)select 0);
_fire=call dmp_fnc_NearFire;
_inside=player call dmp_fnc_Inside;
_tempBonus=0;
if(_fire)then{_tempBonus=10};
if(_inside)then{_tempBonus=5};
if((_inside)AND(_fire))then{_tempBonus=20};
if(_sleep)then{
	if("dmpSleepingBag"call dmp_fnc_HasItem)then{_tempBonus=_tempBonus+10};
	if(call dmp_fnc_NearTent)then{_tempBonus=_tempBonus+10};
};
_temp=_temp+_tempBonus;
_deficiency=_minSafeTemp-_temp;
_excess=_temp-_maxSafeTemp;
_message="Comfortable";
if(_deficiency>0)then{
	dmpExposure=dmpExposure+(_deficiency/5);
	if(_deficiency<15)then{_message="Freezing"};
	if(_deficiency<10)then{_message="Very cold"};
	if(_deficiency<5)then{_message="Cold"};
	//if!(_message=="")then{systemChat _message};
};

if(_excess>0)then{
	//dmpThirst=dmpThirst+(_excess/5);
	//if(_excess<15)then{_message="Roasting"};
	if(_excess<10)then{_message="Very hot"};
	if(_excess<5)then{_message="Hot"};
	//if!(_message=="")then{systemChat _message};
};

if(_deficiency<0)then{
	dmpExposure=dmpExposure-(_deficiency/10);
	if(_excess>0)then{dmpExposure=0};
};

if(dmpExposure<0)then{dmpExposure=0};
dmpExposureMessage=_message;