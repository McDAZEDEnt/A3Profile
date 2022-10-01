// Registered civilians
dmpCivs=[];
while{true}do{
	{
		if((side _x)==CIVILIAN)then{
			if!(_x in dmpCivs)then{
				dmpCivs pushBack _x;
				0=_x addMPEventHandler["mpKilled",{_this execVM"DMP\Scripts\Civilians\KilledCiv.sqf"}];
			};
		};
	}forEach allUnits;
	sleep 15;
};