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
-- GVAW Proportional Blue Air Response --
-- Define RequiRed Variables --


local initPictureComplete = false

-- Define Flights Using MOOSE --

-- CAPs --

local function CAP1()
		CAP1 = SPAWN:New("CAP1")
		:InitLimit(2, 30)
		:SpawnScheduled(2000, 0.25)
		:InitRepeatOnLanding()
end
	
local function CAP2()
		CAP2 = SPAWN:New("CAP2")
		:InitLimit(2, 30)
		:SpawnScheduled(1800, 0.25)
		:InitRepeatOnLanding()
end
	
local function CAP6()
		CAP6 = SPAWN:New("CAP6")
		:InitLimit(2, 30)
		:SpawnScheduled(1000, 0.25)
		:InitRepeatOnLanding()
end
	
local function CAP3()
		CAP3 = SPAWN:New("CAP3")
		:InitLimit(2, 30)
		:SpawnScheduled(2500, 0.25)
		:InitRepeatOnLanding()
end

local function CAP7()
		CAP7 = SPAWN:New("CAP7")
		:InitLimit(2, 30)
		:SpawnScheduled(1800, 0.25)
end

local function CAP8()
		CAP8 = SPAWN:New("CAP8")
		:InitLimit(2, 30)
		:SpawnScheduled(1800, 0.25)
end

local function CAP9()
	CAP9 = SPAWN:New("CAP9")
	:InitLimit (2, 16)
	:SpawnScheduled(2000, 0.25)
end

local function CAP4()
	CAP4 = SPAWN:New("CAP4")
	:InitLimit (2, 16)
	:SpawnScheduled(1500, 0.25)
end

local function CAP5()
	CAP5 = SPAWN:New("CAP5")
	:InitLimit (2, 16)
	:SpawnScheduled(2500, 0.25)
end


--Define Variations of Above Flights--

local function VariationA(threat)

	if initPictureComplete == false then
		
		CAP1()
		CAP2()
		CAP3()
		CAP4()
		CAP5()
		
		env.info("PROP-AIR for blue: Variation A default state initiated.")
		initPictureComplete = true
	end

	if threat == 2 then
		CAP1:SpawnScheduleStop()
		CAP2:SpawnScheduleStop()
		CAP3:SpawnScheduleStop()
		CAP4:SpawnScheduleStop()
		CAP5:SpawnScheduleStop()
	
	elseif threat == 3 then
		CAP1:SpawnScheduleStop()
		CAP2:SpawnScheduleStop()
		CAP3:SpawnScheduleStop()
		CAP4:SpawnScheduleStop()
		CAP5:SpawnScheduleStart()	
		
	elseif threat == 4 then
		CAP1:SpawnScheduleStop()
		CAP2:SpawnScheduleStop()
		CAP3:SpawnScheduleStart()
		CAP4:SpawnScheduleStart()
		CAP5:SpawnScheduleStop()

	else	
		CAP1:SpawnScheduleStart()
		CAP2:SpawnScheduleStart()
		CAP3:SpawnScheduleStop()
		CAP4:SpawnScheduleStop()
		CAP5:SpawnScheduleStop()
	end	
end


-- Check Blue Air Player Assets and Schedule a Response Accordingly --

local function checkRedAir()

	env.info("PROP-AIR: Check Red Air Function started!")

	local fighterValue = 0
	local strikerValue = 0
	local airThreatValue = 0
	local airThreatLevel = 0
		
	local playerTable = {}
	playerTable = coalition.getPlayers(2)
		
	if #playerTable < 1 then
	
		airThreatValue = 0
		
	else
		for i = 1, #playerTable do
		
			if	playerTable[i]:getTypeName() == "A-10A" 	or
				playerTable[i]:getTypeName() == "A-10C" 	or
				playerTable[i]:getTypeName() == "AV-8B" 	or
				playerTable[i]:getTypeName() == "AJS37" 	or
				playerTable[i]:getTypeName() == "SU-25T" 	or
				playerTable[i]:getTypeName() == "F-5E-3" 	or
				playerTable[i]:getTypeName() == "MiG-21Bis" then
				
				strikerValue = strikerValue + 1
				
			else
				
				fighterValue = fighterValue + 1
				
			end
		end
			
		airThreatValue = (strikerValue / 2) + fighterValue
		
	end
					
	if airThreatValue <= 5 then
	
		airThreatLevel = 0
		
	elseif airThreatValue > 5 and airThreatValue <= 12 then
	
		airThreatLevel = 1
		
	elseif airThreatValue > 12 and airThreatValue <= 20 then
	
		airThreatLevel = 2
	
	elseif airThreatValue > 20 then
	
		airThreatLevel = 3
		
	end		

	VariationA(airThreatLevel)

		
		
	env.info("PROP-AIR: Check Blue Air Function finished!")
	return timer.getTime() + 300
end

-- Initiate checkRedAir Schedule --

local function BlueAirInit()

	env.info("PROP-AIR: Initiated!")
	timer.scheduleFunction(checkRedAir, nil, timer.getTime() + 1)

end

BlueAirInit()