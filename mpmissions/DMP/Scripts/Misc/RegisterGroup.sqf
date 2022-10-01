private["_group"];
_group=_this;
if(isServer)then{
	if((side _group)==WEST)then{{_x addMPEventHandler["mpkilled",{dmpCasualtiesW=dmpCasualtiesW+1}]}forEach(units _group)};
	if((side _group)==EAST)then{{_x addMPEventHandler["mpkilled",{dmpCasualtiesE=dmpCasualtiesE+1}]}forEach(units _group)};
	if((side _group)==RESISTANCE)then{{_x addMPEventHandler["mpkilled",{dmpCasualtiesR=dmpCasualtiesR+1}]}forEach(units _group)};
};