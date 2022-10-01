// Calculate warmth of clothing (based on mass of uniform, vest and headgear)
private["_man","_out","_u","_v","_h","_g","_warmth","_exosure"];
_man=player;
//hint format ["%1",toLower(headGear _man)];
_out=[];
// Coverage of uniform, vest, headgear, goggles (often balaclavas)
_u=getNumber(configfile>>"CfgWeapons">>(uniform _man)>>"ItemInfo">>"mass");
// Reduce _v by armour value?
_v=getNumber(configfile>>"CfgWeapons">>(vest _man)>>"ItemInfo">>"mass");
_v=round(_v/10);
_h=getNumber(configfile>>"CfgWeapons">>(headgear _man)>>"ItemInfo">>"mass");
_g=getNumber(configfile>>"CfgWeapons">>(goggles _man)>>"ItemInfo">>"mass");
// Extra warmth for balaclavas and shemags
if(((toLower(headGear _man))find"bal")>-1)then{_h=_h*3};
if(((toLower(headGear _man))find"shem")>-1)then{_h=_h*3};
if(((toLower(goggles _man))find"bal")>-1)then{_g=_g*3};
if(((toLower(goggles _man))find"shem")>-1)then{_g=_g*3};
_warmth=(_u+_v+_h+_g);
// Need to add a final variation here that translates to body temp adjustment
[_warmth,[_u,_v,_h,_g]]