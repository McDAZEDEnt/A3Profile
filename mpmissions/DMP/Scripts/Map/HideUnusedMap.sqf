private["_radius","_AOpos","_AOsize","_pos","_obj"];
_radius=dmpRemoteSize;
_AOpos=dmpCenter;
_AOsize=dmpRadius+800;
_pos=[];
_obj=[];
{
_pos=_x;
if((_pos distance2D _AOpos)>_AOsize)then{
	_obj=(nearestObjects[_pos,[],_radius]);
	{hideObjectGlobal _x}forEach _obj;
	sleep .01;
};
sleep .5;
}forEach dmpUnusedAreas;