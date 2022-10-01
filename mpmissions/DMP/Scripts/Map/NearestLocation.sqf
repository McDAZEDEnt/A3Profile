private["_object","_radius","_locations","_out"];
_object=_this select 0;
_radius=_this select 1;
_locations=nearestLocations[getPos _object,dmpLocationTypes,_radius];
while{((count _locations)==0)}do{
	_radius=_radius+500;
	_locations=nearestLocations[getPos _object,dmpLocationTypes,_radius];
};
_out=_locations select 0;
_out