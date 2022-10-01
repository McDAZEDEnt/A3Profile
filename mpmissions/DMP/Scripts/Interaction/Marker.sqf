private["_pos","_description","_marker","_colour","_alpha"];
_pos=_this select 0;
_description=_this select 1;
_colour="ColorCIVILIAN";
if((count _this)>2)then{_colour=_this select 2};
_marker="";
_marker=createMarkerLocal[format["DMP_Interaction_%1%2",_description,_pos,TIME],_pos];	
_marker setMarkerTypeLocal"hd_warning";
_marker setMarkerTextLocal _description;
_marker setMarkerColorLocal _colour;
_alpha=1;
while{_alpha>0}do{
	_marker setMarkerAlphaLocal _alpha;
	_alpha=_alpha-.03;
	sleep 1;
};
deleteMarker _marker