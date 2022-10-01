// List all items including DRPG stuff
private["_unit","_items"];
_unit=_this select 0;
_type=_this select 1;
_out=[];
_items=items _unit;
_items=_items+(assignedItems _unit);
if((_type)=="Uniforms")then{
	{if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==801)then{_out pushBack _x}}forEach _items;
};
if((_type)=="Vests")then{
	{if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==701)then{_out pushBack _x}}forEach _items;
};
if((_type)=="Headgear")then{
	{if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==605)then{_out pushBack _x}}forEach _items;
};
if((_type)=="Attachments")then{
	{
	if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==201)then{_out pushBack _x};
	if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==301)then{_out pushBack _x};
	}forEach _items;
};
if((_type)=="Other")then{};
_out