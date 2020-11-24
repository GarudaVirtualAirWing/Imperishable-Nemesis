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
AWACSHandler = {}
local function logisticAssets()

--[[ -- disable
	local function JTAC()
	  HOTELSpawner = SPAWN:New("JTAC")
	  :InitLimit(1, 20)
	  :SpawnScheduled(10, 0)
	  :InitRepeatOnLanding()
	  :InitRepeatOnEngineShutDown()
	  
	 end
--	 
	local function ACRO()
	  ARCOSpawner = SPAWN:New("ACRO")
	  :InitLimit(1, 1)
	  :SpawnScheduled(10, 20)
	  :InitRepeatOnLanding()
	  :InitRepeatOnEngineShutDown()
	  
	 end
	 
	local function TEXACO()
	  TEXACOSpawner = SPAWN:New("TEXACO")
	  :InitLimit(1, 20)
	  :SpawnScheduled(10, 0)
	  :InitRepeatOnLanding()
	  :InitRepeatOnEngineShutDown()
	  
	 end
--]]
	local function RusAWACS()
	  MAGICSpawner = SPAWN:New("RusAWACS")
	  :InitLimit(1, 20)
	  :SpawnScheduled(600, 1)
	  :InitRepeatOnLanding()
	  :InitRepeatOnEngineShutDown()
	  
	end
	 
	local function MAGIC()
	  MAGICSpawner = SPAWN:New("MAGIC")
	  :InitLimit(1, 20)
	  :SpawnScheduled(600, 1)
	  :InitRepeatOnLanding()
	  :InitRepeatOnEngineShutDown()
	  
	 end
	 
	local function MAGICDEF()
	  MAGICDEFSpawner = SPAWN:New("MAGICDEF")
	  :InitLimit(1, 20)
	  :SpawnScheduled(600, 1)
	  :InitRepeatOnLanding()
	  :InitRepeatOnEngineShutDown()
	  
	end
	 
--	JTAC()
--	ACRO()
--	TEXACO()
	RusAWACS()
	MAGIC()
	MAGICDEF()

end

logisticAssets()

-- message when awacs live and dead --
--
local function onDeath(event)
    deadThing = event.initiator
    if deadThing:hasAttribute("AWACS") and deadThing:getCoalition() == 2 then
        trigger.action.outTextForCoalition(2,  "MAGIC 1-1 Down. We will on station in 10 minutes!", 15, true)
		trigger.action.outSoundForCoalition(2,"awacsdown.ogg")
    end
end

local function onBirth(event)
    bornThing = event.initiator
    if bornThing:hasAttribute("AWACS") and bornThing:getCoalition() == 2 then
        trigger.action.outTextForCoalition(2,  "MAGIC 1-1 On Station", 15, true)
		trigger.action.outSoundForCoalition(2,"awacslive.ogg")
    end
end

-- handler awacs live and dead --

function AWACSHandler:onEvent(event)
    if event.id == world.event.S_EVENT_UNIT_LOST then
        onDeath(event)
    elseif event.id == world.event.S_EVENT_BIRTH then
        onBirth(event)
    end
end

world.addEventHandler(AWACSHandler)
--]]