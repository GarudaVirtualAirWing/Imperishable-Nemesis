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
-- Control ZONE --
Zone1Zone = ZONE:FindByName( "Senaki Airbase" )
Zone1CaptureZone = ZONE_CAPTURE_COALITION:New( Zone1Zone, coalition.side.RED )

Zone2Zone = ZONE:FindByName( "Zugdidi City" )
Zone2CaptureZone = ZONE_CAPTURE_COALITION:New( Zone2Zone, coalition.side.RED )

Zone3Zone = ZONE:FindByName( "Khashuri City" )
Zone3CaptureZone = ZONE_CAPTURE_COALITION:New( Zone3Zone, coalition.side.RED )

Zone4Zone = ZONE:FindByName( "Gori City" )
Zone4CaptureZone = ZONE_CAPTURE_COALITION:New( Zone4Zone, coalition.side.RED )

Zone5Zone = ZONE:FindByName( "Tskhinvali City" )
Zone5CaptureZone = ZONE_CAPTURE_COALITION:New( Zone5Zone, coalition.side.RED )

Zone6Zone = ZONE:FindByName( "Tbilisi City" )
Zone6CaptureZone = ZONE_CAPTURE_COALITION:New( Zone6Zone, coalition.side.RED )

Zone7Zone = ZONE:FindByName( "Tbilisi Airbase" )
Zone7CaptureZone = ZONE_CAPTURE_COALITION:New( Zone7Zone, coalition.side.RED )

Zone8Zone = ZONE:FindByName( "Sukhumi Airbase" )
Zone8CaptureZone = ZONE_CAPTURE_COALITION:New( Zone8Zone, coalition.side.RED )

Zone9Zone = ZONE:FindByName( "Paris FARP" )
Zone9CaptureZone = ZONE_CAPTURE_COALITION:New( Zone9Zone, coalition.side.BLUE )

Zone10Zone = ZONE:FindByName( "Dallas FARP" )
Zone10CaptureZone = ZONE_CAPTURE_COALITION:New( Zone10Zone, coalition.side.BLUE )

Zone11Zone = ZONE:FindByName( "Kobuleti Airbase" )
Zone11CaptureZone = ZONE_CAPTURE_COALITION:New( Zone11Zone, coalition.side.BLUE )

Zone12Zone = ZONE:FindByName( "Batumi Airbase" )
Zone12CaptureZone = ZONE_CAPTURE_COALITION:New( Zone12Zone, coalition.side.BLUE )

--[[ -- template, Change Zone Name sesuai dengan triggerzone di miz file

Zone9Zone = ZONE:FindByName( "Zone Name" )
Zone9CaptureZone = ZONE_CAPTURE_COALITION:New( Zone9Zone, coalition.side.RED )

Zone10Zone = ZONE:FindByName( "Zone Name" )
Zone10CaptureZone = ZONE_CAPTURE_COALITION:New( Zone10Zone, coalition.side.RED )

Zone11Zone = ZONE:FindByName( "Zone Name" )
Zone11CaptureZone = ZONE_CAPTURE_COALITION:New( Zone11Zone, coalition.side.RED )

Zone12Zone = ZONE:FindByName( "Zone Name" )
Zone12CaptureZone = ZONE_CAPTURE_COALITION:New( Zone12Zone, coalition.side.RED )

Zone13Zone = ZONE:FindByName( "Zone Name" )
Zone13CaptureZone = ZONE_CAPTURE_COALITION:New( Zone13Zone, coalition.side.RED )

--]]

-- zonasi zone 1 start ---
--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone1CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone1CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Senaki Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone1CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Senaki Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone1CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Senaki Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  Zone1CaptureZone:Smoke( SMOKECOLOR.White )
    trigger.action.outText("GARUDA Air Wing attacking Senaki Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone1CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
  trigger.action.outText("GARUDA Air Wing captured Senaki Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Senaki Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone1CaptureZone:__Guard( 1 )
Zone1CaptureZone:Start( 30, 120 )

-- zonasi zone 1 end ---
-- zonasi zone 2 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone2CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone2CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Zugdidi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone2CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Zugdidi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone2CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Zugdidi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking Zugdidi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone2CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured Zugdidi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Zugdidi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone2CaptureZone:__Guard( 1 )
Zone2CaptureZone:Start( 30, 120 )

-- zonasi zone 2 end ---
-- zonasi zone 3 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone3CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone3CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Khashuri City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone3CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Khashuri City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone3CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Khashuri City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking Khashuri City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone3CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured Khashuri City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Khashuri City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone3CaptureZone:__Guard( 1 )
Zone3CaptureZone:Start( 30, 120 )

-- zonasi zone 3 end ---
-- zonasi zone 4 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone4CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone4CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Gori City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone4CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Gori City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone4CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Gori City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking Gori City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone4CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured Gori City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Gori City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone4CaptureZone:__Guard( 1 )
Zone4CaptureZone:Start( 30, 120 )

-- zonasi zone 4 end ---
-- zonasi zone 5 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone5CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone5CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Tskhinvali City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone5CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Tskhinvali City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone5CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Tskhinvali City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking Tskhinvali City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone5CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured Tskhinvali City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Tskhinvali City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone5CaptureZone:__Guard( 1 )
Zone5CaptureZone:Start( 30, 120 )

-- zonasi zone 5 end ---
-- zonasi zone 6 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone6CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone6CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Tbilisi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone6CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Tbilisi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone6CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Tbilisi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking Tbilisi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone6CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured Tbilisi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Tbilisi City", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone6CaptureZone:__Guard( 1 )
Zone6CaptureZone:Start( 30, 120 )

-- zonasi zone 6 end ---
-- zonasi zone 7 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone7CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone7CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Tbilisi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone7CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Tbilisi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone7CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Tbilisi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking Tbilisi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone7CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured Tbilisi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Tbilisi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone7CaptureZone:__Guard( 1 )
Zone7CaptureZone:Start( 30, 120 )

-- zonasi zone 7 end ---
-- zonasi zone 8 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone8CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone8CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Sukhumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone8CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Sukhumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone8CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Sukhumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking Sukhumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone8CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured Sukhumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Sukhumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone8CaptureZone:__Guard( 1 )
Zone8CaptureZone:Start( 30, 120 )

-- zonasi zone 8 end ---
-- zonasi zone 9 end ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone9CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone9CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting FARP Paris", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone9CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting FARP Paris", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone9CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking FARP Paris", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking FARP Paris", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone9CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured FARP Paris", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured FARP Paris", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone9CaptureZone:__Guard( 1 )
Zone9CaptureZone:Start( 30, 120 )

-- zonasi zone 9 end ---
-- zonasi zone 10 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone10CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone10CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting FARP Dallas", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone10CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting FARP Dallas", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone10CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking FARP Dallas", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking FARP Dallas", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone10CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured FARP Dallas", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured FARP Dallas", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone10CaptureZone:__Guard( 1 )
Zone10CaptureZone:Start( 30, 120 )

-- zonasi zone 10 end ---
-- zonasi zone 11 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone11CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone11CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Kobuleti Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone11CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Kobuleti Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone11CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Kobuleti Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking Kobuleti Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone11CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured Kobuleti Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Kobuleti Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone11CaptureZone:__Guard( 1 )
Zone11CaptureZone:Start( 30, 120 )

-- zonasi zone 11 end ---
-- zonasi zone 12 start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function Zone12CaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	Zone12CaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting Batumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	Zone12CaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting Batumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone12CaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking Batumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking Batumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function Zone12CaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured Batumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured Batumi Airbase", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

Zone12CaptureZone:__Guard( 1 )
Zone12CaptureZone:Start( 30, 120 )

-- zonasi zone 12 end ---

--[[
-- Change XX di ZoneXXCaptureZone, sesuai dengan urutannya di bagian control ZONE.
-- zonasi zone X start ---

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function ZoneXXCaptureZone:OnEnterGuarded( From, Event, To )
  if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
    if Coalition == coalition.side.BLUE then
	ZoneXXCaptureZone:Smoke( SMOKECOLOR.Blue )
  trigger.action.outText("GARUDA Air Wing protecting [PLACEHOLDER]", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    else
	ZoneXXCaptureZone:Smoke( SMOKECOLOR.Red )
  trigger.action.outText("Georgian Insurgency Army protecting [PLACEHOLDER]", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
    end
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function ZoneXXCaptureZone:OnEnterAttacked()
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("Georgian Insurgency Army attacking [PLACEHOLDER]", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
  
    trigger.action.outText("GARUDA Air Wing attacking [PLACEHOLDER]", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
end

--- @param Functional.Protect#ZONE_CAPTURE_COALITION self
function ZoneXXCaptureZone:OnEnterCaptured()
  trigger.action.outSound("walkietalkie2.wav" )
  local Coalition = self:GetCoalition()
  self:E({Coalition = Coalition})
  if Coalition == coalition.side.BLUE then
    trigger.action.outText("GARUDA Air Wing captured [PLACEHOLDER]", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  else
    trigger.action.outText("Georgian Insurgency Army captured [PLACEHOLDER]", 10 , false)
  trigger.action.outSound("walkietalkie.wav" )
  end
   
  self:__Guard( 30 )
end

ZoneXXCaptureZone:__Guard( 1 )
ZoneXXCaptureZone:Start( 30, 120 )

-- zonasi zone X end ---
--]]
