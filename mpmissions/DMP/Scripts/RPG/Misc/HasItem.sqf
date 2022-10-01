private["_item"];
_item=_this;
if(_item in(items player))exitWith{TRUE};
if(_item in(assignedItems player))exitWith{TRUE};
if(_item in(backpackItems player))exitWith{TRUE};
if(_item in(weapons player))exitWith{TRUE};
FALSE