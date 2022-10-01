// From this post by roguetrooper:
// https://forums.bohemia.net/forums/topic/163286-how-to-disable-street-lights/?do=findComment&comment=2556773
private _list=[];
_list=_list+["Lamps_base_F"];
_list=_list+["Land_LampStreet_small_F"];
_list=_list+["Land_LampStreet_F"];
_list=_list+["Land_LampDecor_F"];
_list=_list+["Land_LampHalogen_F"];
_list=_list+["Land_LampHarbour_F"];
_list=_list+["Land_LampShabby_F"];
private _lamps=nearestObjects[dmpSelectedTerminal,_list,1000];
{_x setHit["light_1_hitpoint",0.97]}forEach _lamps;
{_x setHit["light_2_hitpoint",0.97]}forEach _lamps;
{_x setHit["light_3_hitpoint",0.97]}forEach _lamps;
{_x setHit["light_4_hitpoint",0.97]}forEach _lamps;