private["_class","_name"];
_class=_this;
_name="";
_name=getText(configFile>>"CfgVehicles">>_class>>"displayName");
if(_name=="")then{_name=getText(configFile>>"CfgWeapons">>_class>>"displayName")};
if(_name=="")then{_name=getText(configFile>>"CfgMagazines">>_class>>"displayName")};
if(_name=="")then{_name=getText(configFile>>"CfgGlasses">>_class>>"displayName")};
if(_name=="")then{_name=getText(configFile>>"CfgAmmo">>_class>>"displayName")};
if(_name=="")then{if(dmpDebug)then{systemChat format["Couldn't get display name of %1",_class]}};
_name