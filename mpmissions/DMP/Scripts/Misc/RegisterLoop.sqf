private["_registered"];
_registered=[];
while{TRUE}do{
	{if!(_x in _registered)then{_registered pushBack _x;_x execVM"DMP\Scripts\Misc\RegisterGroup.sqf"}}forEach allGroups;
	if!(dmpRegisterLoop)exitWith{};
	sleep 30;
};