waitUntil!{isNil"dmpPTready"};waitUntil{dmpPTready};
private["_info","_c"];
_info=_this;
_c=0;

_code=_info select _c;_c=_c+1;
_pos=_info select _c;_c=_c+1;
_target=_info select _c;_c=_c+1;
_type=_info select _c;_c=_c+1;
_title=_info select _c;_c=_c+1;

_code=format["%1%2%3",_type,(_pos select 0),(_pos select 1)];

_task=[];
_found=FALSE;
{
_task=_x;
if((_task select 0)==_code)exitWith{_found=TRUE};
}forEach dmpPersistentTasks;

_status=_task select 1;
if(_status=="DONE")exitWith{
};

if


/*
_taskInfo=[_pos,_target,etc];
dmpPersistentTasks pushBack _taskInfo;