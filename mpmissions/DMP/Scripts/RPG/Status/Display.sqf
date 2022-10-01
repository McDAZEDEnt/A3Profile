private["_green","_yellow","_orange","_red","_white","_colour1","_colour2","_colour3","_colour4","_colourT","_colourD","_colourE","_colourDe","_sText",
"_debuffs","_clothesText","_clothesTotal","_clothes","_hint"];
// https://www.rapidtables.com/web/color/html-color-codes.html
_green='#008744';
_yellow='#FFFF00';
_orange='#FFA700';
_red="#ff0000";
_white='#ffffff';
_colour1=_green;
_colour2=_green;
_colour3=_green;
_colour4=_green;
_colourT=_green;
_colourD=_white;
_colourE=_green;
_colourDe=_red;
if(dmpHunger>6)then{_colour1=_yellow};
if(dmpThirst>6)then{_colour2=_yellow};
if(dmpFatigue>6)then{_colour3=_yellow};
if(dmpExposure>6)then{_colour4=_yellow};
if(dmpHunger>9)then{_colour1=_orange};
if(dmpThirst>9)then{_colour2=_orange};
if(dmpFatigue>9)then{_colour3=_orange};
if(dmpExposure>9)then{_colour4=_orange};
if(dmpHunger>14)then{_colour1=_red};
if(dmpThirst>14)then{_colour2=_red};
if(dmpFatigue>14)then{_colour3=_red};
if(dmpExposure>14)then{_colour4=_red};
if(GF_Temperature_Sum_Air<20)then{_colourT=_yellow};
if(GF_Temperature_Sum_Air<15)then{_colourT=_orange};
if(GF_Temperature_Sum_Air<10)then{_colourT=_red};
if(GF_Temperature_Sum_Air>30)then{_colourT=_yellow};
if(GF_Temperature_Sum_Air>35)then{_colourT=_orange};
if(GF_Temperature_Sum_Air>35)then{_colourT=_red};
if(dmpExposureMessage=="Freezing")then{_colourE=_red};
if(dmpExposureMessage=="Very cold")then{_colourE=_orange};
if(dmpExposureMessage=="Cold")then{_colourE=_yellow};
if(dmpExposureMessage=="Very hot")then{_colourE=_orange};
if(dmpExposureMessage=="Hot")then{_colourE=_yellow};

if(dmpRPGmuted)then{
	_colour1=_white;
	_colour2=_white;
	_colour3=_white;
	_colour4=_white;
	_colourT=_white;
	_colourD=_white;
	_colourE=_white;
	_colourDe=_white;
};

_debuffs="";
{_debuffs=format["<br/>%1 <br/>%2 ",_debuffs,_x]}forEach dmpDebuffs;
_debuffs=parseText _debuffs;
_clothesText="";
_clothesTotal=((call dmp_fnc_ClothingWarmth)select 0);
_clothes=((call dmp_fnc_ClothingWarmth)select 1);
_clothesText=format["Clothes: %1 (U:%2/V:%3/H:%4/G:%5)",_clothesTotal,_clothes select 0,_clothes select 1,_clothes select 2,_clothes select 3];

_hint="";
if(dmpHint)then{_hint="Double-click the uniform slot to see your character menu"};
_sText=parseText format["<t size='1' color='%1'>Hunger: %2</t><br/><t size='1' color='%3'>Thirst: %4</t><br/><t size='1' color='%5'>Fatigue: %6</t><br/><t size='1' color='%7'>Exposure: %8</t><br/><br/><t size='1' color='%9'>Air temp: %10c</t><br/><t size='1' color='%11'>%12</t><br/><t size='1' color='%13'>%14</t><br/><br/><t size='1' color='%15'>%16</t><br/><br/><t size='1' color='#ffffff'>%17</t>",_colour1,round dmpHunger,_colour2,round dmpThirst,_colour3,round dmpFatigue,_colour4,round dmpExposure,_colourT,GF_Temperature_Sum_Air,_colourE,dmpExposureMessage,_white,_clothesText,_colourDe,_debuffs,_hint];

hintSilent _sText;
sleep .5;
if(dialog)then{execVM"DMP\Scripts\RPG\Status\Display.sqf"}else{hintSilent""};