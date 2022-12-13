_camera = "camera" camCreate [(getPos player) select 0,(getPos player) select 1,((getPos player) select 2) + 1.6];
_camera cameraEffect ["internal", "back"];
cameraEffectEnableHUD true;
_camera camCommand "inertia on";
_null = [1,0,false,false] call BIS_fnc_cinemaBorder;

_camera camPrepareTarget [19483.1,15905.7,0];
_camera camPreparePos [(getPos player) select 0,(getPos player) select 1,((getPos player) select 2) + 1.6];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

_camera camPrepareTarget [19483.1,15905.7,0];
_camera camPreparePos [19779.1,15638.9,100];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

sleep 30;

_camera camPrepareTarget [18832.2,16613.2,0];
_camera camPreparePos [18949.6,16505.7,40];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;

sleep 20;

_camera camPrepareTarget [18832.2,16613.2,40];
_camera camPreparePos [18450.7,16562.2,40];
_camera camPrepareFOV 0.850;
_camera camCommitPrepared 10;

sleep 20;

_camera camPrepareTarget [18832.2,16613.2,0];
_camera camPreparePos [18883.7,17540.8,80];
_camera camPrepareFOV 0.850;
_camera camCommitPrepared 30;

sleep 50;

_camera camPrepareTarget [18832.2,16613.2,0];
_camera camPreparePos [(getPos player) select 0,(getPos player) select 1,((getPos player) select 2) + 1.6];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

sleep 20;

_camera cameraEffect ["terminate","back"];
camdestroy _camera;