private["_item","_price","_type"];
_item=_this;
_price=-1;
_type=_item call dmp_fnc_ItemType2;
if(_type=="Weapon")then{_price=_item call dmp_fnc_GetPriceWeapon};
if(_type=="Uniform")then{_price=_item call dmp_fnc_GetPriceUniform};
if(_type=="Vest")then{_price=5+(_item call dmp_fnc_GetPriceVest)};
if(_type=="Headgear")then{_price=5+(_item call dmp_fnc_GetPriceHeadgear)};
if(_type=="Backpack")then{_price=_item call dmp_fnc_GetPriceBackpack};
if(_type=="Glasses")then{_price=3};
if(_type=="Item")then{_price=_item call dmp_fnc_GetPriceItem};
if(_type=="Attachments")then{_price=_item call dmp_fnc_GetPriceAttachment};
if(_type=="Magazines")then{_price=1};
if(_price<0)then{_price=1;if(dmpDebug)then{hintSilent format["GetPrice: %1 has no entry",_item]}};
ceil _price