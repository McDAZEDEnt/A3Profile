private["_item","_military","_modes","_visionModes","_NVG","_TI","_type"];
_item=_this;
if!(_item isEqualType"")then{if(dmpDebug)then{hintc format["%1",_item]}};
_military=FALSE;
// Need to check for rockets, explosives, etc