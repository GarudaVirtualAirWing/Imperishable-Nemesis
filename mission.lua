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
env.info("GVAW TaskDispatcher: Now, Task Dispatcher Running..")
--[[

THIS SECTION IS BLUE HQ & RED HQ

--]]
-- BLUESIDE CC --
local HQ = GROUP:FindByName( "BLUEHQ", "Garuda" )

local CommandCenter = COMMANDCENTER:New( HQ, "Garuda" )

-- BLUESIDE INTEL --
local BIHQ = GROUP:FindByName( "Army HQ", "Garuda Army" )

local BlueIntel = COMMANDCENTER:New( BIHQ, "Garuda Army" )

-- REDSIDE CC --
local RHQ = GROUP:FindByName( "REDHQ", "Grey Wolf" )

local RCommandCenter = COMMANDCENTER:New( RHQ, "Grey Wolf" )

-- REDSIDE INTEL --
local RIHQ = GROUP:FindByName( "GIArmy HQ", "GI Army" )

local RedIntel = COMMANDCENTER:New( RIHQ, "GI Army" )


--[[

THIS SECTION IS FOR AIR TO AIR DISPATCHER MISSION FOR BLUE & RED

--]]

-- BLUSIDE AIR TO AIR --

local Mission = MISSION
  :New( CommandCenter, "Garuda Sweeper", "Primary", "INTERCEPT target. Identify the Bogey flying towards the EWR, if Bogey detected as Bandit, destroy them.", coalition.side.BLUE ) --- briefing

local EWRSet = SET_GROUP:New():FilterCoalitions("blue"):FilterStart()

local EWRDetection = DETECTION_AREAS:New( EWRSet, 10000 )
EWRDetection:SetFriendliesRange( 10000 )
EWRDetection:SetRefreshTimeInterval( 10 )


local AttackGroups = SET_GROUP:New():FilterCoalitions( "blue" ):FilterCategories( "plane" ):FilterStart()

TaskDispatcher = TASK_A2A_DISPATCHER:New( Mission, AttackGroups, EWRDetection )
TaskDispatcher:SetRefreshTimeInterval( 10 )



-- REDSIDE AIR TO AIR --

local RMission = MISSION
  :New( RCommandCenter, "GIA Sweeper", "Primary", "INTERCEPT target. Identify the Bogey flying towards the EWR, if Bogey detected as Bandit, destroy them. You can join your buddy if mission was assigned", coalition.side.RED ) --- briefing

local REWRSet = SET_GROUP:New():FilterCoalitions("red"):FilterStart()

local EWRDetection = DETECTION_AREAS:New( REWRSet, 10000 )
EWRDetection:SetFriendliesRange( 10000 )
EWRDetection:SetRefreshTimeInterval( 10 )


local AttackGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterCategories( "plane" ):FilterStart()

TaskDispatcher = TASK_A2A_DISPATCHER:New( RMission, AttackGroups, EWRDetection )
TaskDispatcher:SetRefreshTimeInterval( 10 )

--[[

THIS SECTION IS FOR AIR TO GROUND DISPATCHER MISSION FOR BLUE & RED

--]]
-- Declare the Mission for the Command Center.
-- BLUSIDE AIR TO GROUND --
local BAGMission = MISSION
  :New( BlueIntel, "Garuda Striker", "High",
        "INTEL REPORTED, GIA Ground Forces on marked location, check from F10 Radio Menu or Join your buddy if mission was assigned",
        coalition.side.BLUE ) -- Create the Mission.

-- Setup the AttackSet, which is a SET_GROUP.
-- The SET_GROUP is a dynamic collection of GROUP objects.  
local AttackSet = SET_GROUP
  :New()  -- Create the SET_GROUP object.
  :FilterCoalitions( "blue" ) -- Only incorporate the BLUE coalitions.
  :FilterStart() -- Start the dynamic building of the set.
  
-- Now we have everything to setup the main A2G TaskDispatcher.
TaskDispatcher = TASK_A2G_DISPATCHER
  :New( BAGMission, AttackSet, EWRDetection ) -- We assign the TaskDispatcher under Mission. The AttackSet will engage the enemy and will recieve the dispatched Tasks. The DetectionAreas will report any detected enemies to the TaskDispatcher.


-- REDSIDE AIR TO GROUND --
local RAGMission = MISSION
  :New( RedIntel, "GIA Striker", "High",
        "INTEL REPORTED, Garuda Ground Forces on marked location, check from F10 Radio Menu or Join your buddy if mission was assigned",
        coalition.side.RED ) -- Create the Mission.

-- Setup the AttackSet, which is a SET_GROUP.
-- The SET_GROUP is a dynamic collection of GROUP objects.  
local AttackSet = SET_GROUP
  :New()  -- Create the SET_GROUP object.
  :FilterCoalitions( "red" ) -- Only incorporate the RED coalitions.
  :FilterStart() -- Start the dynamic building of the set.
  
-- Now we have everything to setup the main A2G TaskDispatcher.
TaskDispatcher = TASK_A2G_DISPATCHER
  :New( RAGMission, AttackSet, EWRDetection ) -- We assign the TaskDispatcher under Mission. The AttackSet will engage the enemy and will recieve the dispatched Tasks. The DetectionAreas will report any detected enemies to the TaskDispatcher.
