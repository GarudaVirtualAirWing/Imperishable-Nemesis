-- GVAW slot blocker
-- Based on the excellent work by the authors of Simple Slot Block (thank you Ciribob et al!)

-- Events related to connection and chat are handled by GVAWPlayerLogger

net.log("Loading GVAWSlotBlocker...")

local M = {}

-- GVAW developers and admins
M.gameMasterUcids = {

}

M.tacCmdrUcids = {

}

-- These values must match what's in SE3\GVAWSlotBlocker.lua
M.slotEnabled = 1
M.slotDisabled = 99 -- flags default to 0 if not set, so don't use 0 for disabled!

local function log(message)
    net.log("GVAWSlotBlocker: " .. message)
end

local function getFlagValue(groupName)
    local status, error = net.dostring_in('server', " return trigger.misc.getUserFlag(\"" .. groupName .. "\"); ")

    if not status and error then
        log("Error getting flag '" .. groupName .. "': " .. error)
        return M.slotEnabled
    else
        return tonumber(status)
    end
end

local function isUcidAllowed(playerUcid, allowedUcids)
    for _, allowedUcid in pairs(allowedUcids) do
        if allowedUcid == playerUcid then
            return true
        end
    end
    return false
end

local function isGameMasterSlot(unitRole)
    return unitRole == "instructor"
end

local function isTacCmdrSlot(unitRole)
    return unitRole == "artillery_commander" or unitRole == "forward_observer" or unitRole == "observer"
end

local function isNonAircraftSlot(unitRole)
    return unitRole ~= nil and isGameMasterSlot(unitRole) or isTacCmdrSlot(unitRole)
end

local function logNonAircraftSlot(playerId, playerName, playerUcid, unitRole, allowed)
    if allowed then
        log("Allowing " .. playerName .. " into " .. unitRole .. " slot (UCID " .. playerUcid .. ")")
    else
        log("Rejecting " .. playerName .. " from " .. unitRole .. " slot (UCID " .. playerUcid .. ")")
        net.send_chat_to("*** Sorry, you are not allowed into the " .. unitRole .. " slots.  If you want access to these slots, please contact us on Discord (linked in the briefing) ***", playerId)
    end
end

-- DCS documentation says returning nothing is success, otherwise a failure
function M.onPlayerTryChangeSlot(playerId, side, slotId)
    if not DCS.isServer() or not DCS.isMultiplayer() or side == 0 or slotId == '' or slotId == nil then
        return
    end

    local playerName = net.get_player_info(playerId, 'name')
    local playerUcid = net.get_player_info(playerId, 'ucid')

    if playerName == nil then
        playerName = ""
    end

    local unitRole = DCS.getUnitType(slotId)

    if isNonAircraftSlot(unitRole) then
        if isGameMasterSlot(unitRole) then
            local allowedIntoGameMaster = isUcidAllowed(playerUcid, M.gameMasterUcids)
            logNonAircraftSlot(playerId, playerName, playerUcid, unitRole, allowedIntoGameMaster)
            return allowedIntoGameMaster
        else
            local allowedIntoTacCmdr = isUcidAllowed(playerUcid, M.gameMasterUcids) or isUcidAllowed(playerUcid, M.tacCmdrUcids)
            logNonAircraftSlot(playerId, playerName, playerUcid, unitRole, allowedIntoTacCmdr)
            return allowedIntoTacCmdr
        end
    end

    -- aircraft slots; check flag values based on group name
    local groupName = DCS.getUnitProperty(slotId, DCS.UNIT_GROUPNAME)

    if groupName == nil or groupName == "" then
        log("Unable to get group name for slot " .. slotId .. "; allowing access")
        return true
    end

    local flagValue = getFlagValue(groupName)
    net.log(string.format("Flag value for group '%s' is %d", groupName, flagValue))
    -- only reject a slot if the disabled value is set (ie fail-safe and allow the slot)
    local slotAllowed = flagValue ~= M.slotDisabled

    if slotAllowed then
        log("Allowing player " .. playerName .. " on side " .. side .. " into slot '" .. groupName .. "'")
        return true
    else
        net.send_chat_to("*** Sorry, this slot is only active if your side controls this base ***", playerId)
        log("Rejecting player " .. playerName .. " on side " .. side .. " from slot '" .. groupName .. "'")
        return false
    end
end

DCS.setUserCallbacks(M)

net.log("Loaded GVAWSlotBlocker")
