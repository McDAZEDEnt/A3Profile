if(dmpRPGdeleteCharacter>0)exitWith{profileNamespace setVariable[dmpSaveNameRPG,[]];dmpRPGdeleteCharacter=0;systemChat"Character deleted"};
dmpRPGdeleteCharacter=dmpRPGdeleteCharacter+1;
systemChat"Press again to confirm deletion";
sleep 10;
dmpRPGdeleteCharacter=0;