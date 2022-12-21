params [["_ownerSide", sideUnknown, [sideUnknown]], ["_halObj", objNull, [objNull]]];

// Re-write to make it universal. Have to try to use [side leaderHQ, side leaderHQB... side leaderHQn]
private _westCaps = (group leaderHQ) getVariable "RydHQ_Taken";
private _eastCaps = (group leaderHQB) getVariable "RydHQ_Taken";

switch (_ownerSide) do {
  case west: {
    _westCaps pushBackUnique _halObj;
    _eastCaps deleteAt (_eastCaps findIf {_x isEqualTo _halObj});

    (group leaderHQ) setVariable ["RydHQ_Taken", _westCaps, true];
    (group leaderHQB) setVariable ["RydHQ_Taken", _eastCaps, true];
  };

  case east: {
    _eastCaps pushBackUnique _halObj;
    _westCaps deleteAt (_westCaps findIf {_x isEqualTo _halObj});

    (group leaderHQB) setVariable ["RydHQ_Taken", _eastCaps, true];
    (group leaderHQ) setVariable ["RydHQ_Taken", _westCaps, true];
  };
};
