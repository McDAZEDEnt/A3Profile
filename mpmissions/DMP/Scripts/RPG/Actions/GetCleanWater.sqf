private["_item"];
_item="";
{if(_x in dmpEmptyBottles)exitWith{_item=_x}}forEach items player;
if(_item=="")exitWith{systemChat"No empty bottles";closeDialog 0};
//	closeDialog 0;
//player playMove _animIn;sleep 3;
player removeItem _item;
if(_item in["dmpBottleEmpty","ACE_WaterBottle_Empty"])then{player addItem"dmpBottleFull";systemChat"Got clean water (bottle)"};
if(_item in["dmpCanteenEmpty","ACE_Canteen_Empty"])then{player addItem"dmpCanteenClean";systemChat"Got clean water (canteen)"};
