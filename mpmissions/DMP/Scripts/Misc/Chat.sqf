private["_chat"];
_chat="";
if((count _this)==1)exitWith{_chat=_this;_chat remoteExec["systemChat"]};