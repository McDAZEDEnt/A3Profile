private["_taskInfo","_unit","_firstUnit"];
_taskInfo=[];
//_firstUnit=player;
_unit=player;
while{TRUE}do{
	if!(_unit==player)then{_unit=player;{((_x select 1)select 0)call BIS_fnc_deleteTask}forEach(player call BIS_fnc_tasksUnit)};
	//if!(_unit==player)then{_unit=player;{(_x select 1)call BIS_fnc_deleteTask}forEach(player call BIS_fnc_tasksUnit)};
	//if!(_unit==player)then{_unit=player;if!(_firstUnit)then{{_x call BIS_fnc_deleteTask}forEach(player call BIS_fnc_tasksUnit)}};
	if(count(player call BIS_fnc_tasksUnit)<1)then{
		if((count dmpAllTasks)>0)then{
			{
				_taskInfo=_x;
				_taskInfo set[0,player];
				_taskInfo set[4,"CREATED"];
				_taskInfo set[6,FALSE];
				_taskInfo call BIS_fnc_taskCreate;
			}forEach dmpAllTasks;
		};
	};
	sleep 5;
};
