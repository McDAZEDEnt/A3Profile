private["_group","_pos","_group","_go"];
_group=_this;
if((count dmpLocations)==0)exitWith{};
//_pos=getPos(selectRandom dmpLocations);
_pos=selectRandom dmpLocations;
_group move _pos;
_go=true;
while{true}do{
	{if(alive _x)exitWith{_go=false}}forEach units _group;
	if(((leader _group)distance2D _pos)<50)then{_pos=selectRandom dmpLocations;_group move _pos};
	sleep 60;
};