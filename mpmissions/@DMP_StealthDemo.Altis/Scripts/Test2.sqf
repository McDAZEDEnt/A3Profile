private["_object"];
_object=dmpSelectedTerminal;
hint format["Object: %1\n\nRadius: %2\n\nPassword: %3\n\nPassword (for reset): %4\n\nActions: %5\n\nSubsystems: %6\n\n",
	_object,
	_object getVariable"dmpTerminalRadius",
	_object getVariable"dmpTerminalPassword",
	_object getVariable"dmpTerminalPasswordMain",
	_object getVariable"dmpTerminalActions",
	_object getVariable"dmpTerminalSubsystems"
];