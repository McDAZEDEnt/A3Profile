private["_distance","_d","_counter","_text"];
_distance=round _this;
//_distance=round _distance;
_d=0;
_counter="meters";
_text="";
if!(_distance<1000)then{_d=_distance/1000;_d=round _d;_counter="clicks"};
if(_distance<1000)then{_d=_distance/100;_d=round _d;_d=_d*100};
if(_distance<100)then{_d=_distance/10;_d=round _d;_d=_d*10};
if(_distance<10)then{_d=_distance};
_text=format["%1 %2",_d,_counter];
_text