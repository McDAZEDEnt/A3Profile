private["_item","_price"];
_item=_this;
if!(_item isEqualType"")then{if(dmpDebug)then{hintc format["%1",_item]}};
_price=10;
if(_item=="dmpBottleFull")then{_price=3};
if(_item=="dmpMRE")then{_price=15};
if(_item=="dmpBeans")then{_price=10};
if(_item=="dmpRice")then{_price=10};
if(_item=="dmpCereal")then{_price=5};
if(_item=="dmpFranta")then{_price=5};
if(_item=="dmpSprint")then{_price=5};
if(_item=="dmpEnergyDrink")then{_price=5};
if(_item=="dmpBandage")then{_price=10};
if(_item=="dmpMatches")then{_price=10};
if(_item=="dmpMesstin")then{_price=10};
if(_item=="dmpWaterPurification")then{_price=10};
if(_item=="dmpTacticalBacon")then{_price=10};
if(_item=="dmpAntibiotics")then{_price=20};
if(_item=="dmpPainkillers")then{_price=20};
if(_item=="dmpAntidote")then{_price=20};
if(_item=="dmpHeatpack")then{_price=20};
if(_item=="dmpCampingLamp")then{_price=50};
if(_item=="dmpSleepingBag")then{_price=50};
if(_item=="dmpTent")then{_price=50};
ceil _price