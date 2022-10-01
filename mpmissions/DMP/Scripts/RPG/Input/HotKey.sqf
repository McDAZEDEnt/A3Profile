// Input from main script
private["_code"];
_code=_this select 0;
if(_code==1)exitWith{if!(dmpScriptHotkey1=="")exitWith{execVM dmpScriptHotkey1}};
if(_code==2)exitWith{if!(dmpScriptHotkey2=="")exitWith{execVM dmpScriptHotkey2}};
if(_code==3)exitWith{if!(dmpScriptHotkey3=="")exitWith{execVM dmpScriptHotkey3}};