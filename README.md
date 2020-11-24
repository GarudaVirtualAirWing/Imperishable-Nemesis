# Imperishable-Nemesis
A Dynamic/Presistence Campaign - DCS Indonesia

##INSTALLATION
1. From your install folder (not saved games), open Scripts/MissionScripting.lua
2. Comment out all the lines in the do block below the sanitization function with -\-. This allows the LUA engine access to the file system. It should look similar to:
```
--sanitizeModule('os')
--sanitizeModule('io')
--sanitizeModule('lfs')
--require = nil
--loadlib = nil
```
3. Clone this repository: from your Saved Games\DCS\Scripts folder run git clone https://github.com/GarudaVirtualAirWing/Imperishable-Nemesis git. This should create a folder named RSR and in the end it should look like Saved Games\DCS\Scripts\RSR
4. Update your mission file to include a DO SCRIPT trigger to run dofile(lfs.writedir() .. [[Scripts\SE3\....lua]])

##INFORMATION
```
AWACS          : Run & Respawn automatically AWACS Blue & Red
Base Defender  : Automatic Base / City Capture
BLUEHelp       : CAP AI Support
CSAR           : Combat Search and Rescue feature
ctld-gvaw      : Complete Troops and Logistic Delivery feature modified for GVAW
mission        : Auto-Generate Mission Briefing/Task based
mist & moose   : basis script
REDThreats     : AI CAP, CAS, Bomber for REDFOR
state-save     : Saving Ground unit when mission restarted
WeaponManager  : Weapon management (limitation per user)
Zonasi         : List zone
```

Kind Regards,
Eagle Eye
