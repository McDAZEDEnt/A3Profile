private["_man","_chanceCanteen","_chanceWallet","_chanceSleepingBag","_chanceTent","_lootChance","_lootCount","_lootChanceR","_lootCountR","_lootChanceVR","_lootCountVR","_array","_chance","_index","_count"];
_man=_this;

_chanceCanteen=75;
_chanceWallet=50;
_chanceSleepingBag=20;
_chanceTent=10;
_lootChance=70;
_lootCount=[1,5];
_lootChanceR=10;
_lootCountR=[1,3];
_lootChanceVR=5;
_lootCountVR=[1,3];

_countArray=[];
_array=[];
_chance=0;
_index=1;
_count=0;

if((random 100)< _chanceCanteen)then{
	_man addItem"dmpCanteenClean";
};

if((random 100)< _chanceWallet)then{
	_man addItem"dmpWallet";
};

if((random 100)< _chanceSleepingBag)then{
	_man addItem"dmpSleepingBag";
};

if((random 100)< _chanceTent)then{
	_man addItem"dmpTent";
};

while{TRUE}do{
	if(_index>3)exitWith{};
	if(_index==1)then{_array=[]+dmpLootCommonRPG;_chance=_lootChance;_countArray=[]+_lootCount};
	if(_index==2)then{_array=[]+dmpLootRareRPG;_chance=_lootChanceR;_countArray=[]+_lootCountR};
	if(_index==3)then{_array=[]+dmpLootVeryRareRPG;_chance=_lootChanceVR;_countArray=[]+_lootCountVR};
	if((random 100)<_chance)then{
		if((count _countArray)<1)exitWith{};
		_count=_countArray call BIS_fnc_RandomInt;
		while{TRUE}do{
			if(_count<1)exitWith{};
			_man addItem(selectRandom _array);
			_count=_count-1;
		};
	};
	_index=_index+1;
};