### Respawn Loadout Generator

Author: Steffieth

This Mission can be used to easily generate the CfgRespawnInventory.
Simply configure your Units in the editor and export respawn loadouts by starting the Mission.

## Usage

- For each Unit placed in the Mission an Respawn Class is created.
- The classes are grouped by their units groups, where each group represents a role.
- The classes name is the units variableName. If no variableName is selected a generic name is generated
- The classes displayName can be set by the Units "STEFF_LOADOUT_NAME" Variable.
- The groups callsign represents the roles displayName. The roles classname is generated from this displayName.
- To exclude several units this can be done by setting its Variable "STEFF_LOADOUT_EXCLUDE" to true.
- If you want to exclude units by default you can set teh public variable "STEFF_DEFAULT_LOADOUT_EXCLUDE" to ture.

when starting the mission the CfgRespawnInventory is generated and copyed to your clipboard.

- paste the CfgRespawnInventory to your description.ext file.
- copy the Roles initialization from the header comment to your init.sqf file.