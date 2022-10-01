private["_info","_c","_skipTime","_a"];
if!(isServer)exitWith{};
_info=_this;
_c=0;
_skipTime=_info select _c;_c=_c+1;
_skipTime=random _skipTime;_skipTime remoteExec["skipTime"];
_a=(_info select _c)call dmp_fnc_ParseArray;dmpRain=_a call BIS_fnc_randomNum;_c=_c+1;
_a=(_info select _c)call dmp_fnc_ParseArray;dmpOvercast=_a call BIS_fnc_randomNum;_c=_c+1;
if(worldName=="Tanoa")then{
	if(dmpOvercast>.15)then{dmpOvercast=(random .15)};
};
//dmpRain=_info select _c;_c=_c+1;
publicVariable"dmpOvercast";
publicVariable"dmpRain";
sleep 2;
if((dmpRain+dmpOvercast)==0)exitWith{};
"DMP\Scripts\Weather\Update.sqf"remoteExec["execVM"];