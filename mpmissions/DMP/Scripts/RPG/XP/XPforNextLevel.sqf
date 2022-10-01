private["_c"];
_c=10;
if(dmpPlayerLevel<1)exitWith{dmpPlayerXPnextLevel=10};
dmpPlayerXPnextLevel=10+(dmpPlayerLevel*_c);