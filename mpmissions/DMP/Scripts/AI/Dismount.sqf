private["_group","_pos","_vehicle","_vehicles"];
_group=_this;
_pos=[];
_vehicles=[];
_vehicle=objNull;
{if!((vehicle _x)==_x)then{_vehicles pushBack(vehicle _x)}}forEach units _group;
while{((count _vehicles)>0)}do{
	_vehicle=_vehicles select 0;
	_vehicles=_vehicles-[_vehicle];
	if ((speed _vehicle)>1)then{
		_vehicle setVelocity[0.1,0.1,0.1];
		(crew _vehicle)doMove getPos _vehicle;
		sleep 1;
	};
	{
		_x action["GETOUT",_vehicle];
		[_x]orderGetin false;
		unassignVehicle _x;
		[_x]allowGetIn false;
		sleep 0.7;
	}forEach fullCrew[_vehicle,"cargo",false];
};