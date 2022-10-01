private["_item","_price","_mass","_text","_side"];
_item=_this;
_price=30;
_mass=0;
_text=getText(configFile>>"cfgWeapons">>_item>>"ItemInfo">>"uniformClass");
_side=getNumber(configfile>>"CfgVehicles">>_text>>"side");
_mass=getNumber(configfile>>"CfgWeapons">>_item>>"ItemInfo">>"mass");
_price=_mass;
if!(_side==3)then{_price=_price*2};
//configfile >> "CfgWeapons" >> "U_C_CBRN_Suit_01_Blue_F" >> "ItemInfo" >> "mass"
//configfile >> "CfgVehicles" >> "O_Soldier_F" >> "HitPoints"
ceil _price