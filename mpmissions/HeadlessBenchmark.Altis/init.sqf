[true,30,true,true,10,0.5,true,[]] execVM "WerthlesHeadless.sqf";
activate = false;
enableSaving [ false, false ];
enableRadio true;

{
	_x allowDamage false;
	_x setCaptive true;
}forEach units group Officer;

if (hasInterface) then
{
	_null = [] spawn {
		sleep 3;
		hintSilent composeText [
			parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>",
			parseText "<br/>",
			parseText "<t color='#7D9EC0' align='center'>Benchmarking Will Begin In Around 60 Seconds</t>",
			parseText "<br/>",
			parseText "<t color='#C5C1AA' align='center'>-------------------------------------------------------</t>"
		];
	};
};

if (isServer) then
{
	_null = [] spawn {
		waitUntil{time>60};
		activate = true;
		publicVariable "activate";
		sleep 10;
		_ii=0;
		{
			_x setPos [18506,16654.2+_ii,1];
			_ii = _ii + 1;
		}forEach units group Officer;
	};
};