----------------------------------------------------
-- DCS INDONESIA // GARUDA VIRTUAL AIR WING --     |
-- MISSION : STORM EAGLE III - A DYNAMIC CAMPAIGN  |
-- MISSION DEVELOPED BY:                           |
----- EAGLE EYE                                    |
----------------------------------------------------

----------------------------------------------------
-- DRAFT FILE                                      |
-- VERSION : INITIAL                               |
----------------------------------------------------

-- required MOOSE
-- RED SPAWNER -- 600 SEC ACTIVE AFTER DESTROYED
-- DEFENDER ZONE
Spawn_Vehicle_1 = SPAWN:New( "RedDefender Senaki" ):InitLimit( 5, 10):InitRandomizePosition( true, 1000, 500):SpawnScheduled( 600, .5 )

Spawn_Vehicle_2 = SPAWN:New( "RedDefender Zugdidi" ):InitLimit( 5, 10):InitRandomizePosition( true, 1000, 500):SpawnScheduled( 600, .5 )

Spawn_Vehicle_2 = SPAWN:New( "RedDefender Khashuri" ):InitLimit( 5, 10):InitRandomizePosition( true, 1000, 500):SpawnScheduled( 600, .5 )

-- BLUE SPAWNER -- 600 SEC ACTIVE AFTER DESTROYED
-- DEFENDER ZONE
Spawn_Vehicle_20 = SPAWN:New( "BlueDefender Senaki" ):InitLimit( 5, 10):InitRandomizePosition( true, 1000, 500):SpawnScheduled( 600, .5 )

Spawn_Vehicle_21 = SPAWN:New( "BlueDefender Zugdidi" ):InitLimit( 5, 10):InitRandomizePosition( true, 1000, 500):SpawnScheduled( 600, .5 )

Spawn_Vehicle_22 = SPAWN:New( "BlueDefender Khashuri" ):InitLimit( 5, 10):InitRandomizePosition( true, 1000, 500):SpawnScheduled( 600, .5 )