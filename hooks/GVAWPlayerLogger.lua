-- GVAW player info and chat logger
-- This handles callbacks related to connections and chat; slot changes are handled by GVAWSlotBlocker

net.log("Loading GVAWPlayerLogger...")

package.cpath = package.cpath .. [[C:\dev\luarocks\lib\lua\5.1\?.dll]]
local sqlite3 = require("lsqlite3")
local lfs = require('lfs')

local M = {}

-- Banned IP addresses
M.bannedIps = {

}

-- Banned player UCIDs
M.bannedUcids = {
    "UCID", -- name him
}

M.db = sqlite3.open(lfs.writedir() .. [[Scripts\GVAW\GVAW.sqlite]], sqlite3.OPEN_READWRITE)

M.insert_stmt = M.db:prepare("INSERT INTO connection(ucid, name, ipaddr) VALUES(?, ?, ?)")

-- populated on connect; used in callbacks which just pass in a playerId
M.connectedPlayerInfo = {
    -- {name = <name>, ucid = <ucid>},
}

function M.onPlayerConnect(playerId)
    local ucid = net.get_player_info(playerId, 'ucid')
    local name = net.get_player_info(playerId, 'name')
    local ipaddr = net.get_player_info(playerId, 'ipaddr')
    net.log("GVAWPlayerLogger: logging connection from " .. name)
    M.connectedPlayerInfo[playerId] = { name = name, ucid = ucid }
    M.insert_stmt:bind_values(ucid, name, ipaddr)
    M.insert_stmt:step()
    M.insert_stmt:reset()
end

-- based on slmod from https://github.com/mrSkortch/DCS-SLmod/blob/master/Scripts/net/Slmodv7_5/SlmodCallbacks.lua
function M.onPlayerTryConnect(ipaddr, name, ucid)
    if M.bannedIps[ipaddr] then
        net.log("GVAWPlayerLogger: not allowing " .. name .. ", ucid " .. ucid .. " from banned IP" .. ipaddr)
        return false, "You are banned from this server."
    end

    if M.bannedUcids[ucid] then
        net.log("GVAWPlayerLogger: not allowing " .. name .. ", ucid " .. ucid .. " from banned ucid" .. ucid)
        return false, "You are banned from this server."
    end
    -- return nothing
end

function M.onPlayerTrySendChat(playerId, msg, all)
    local playerInfo = M.connectedPlayerInfo[playerId]
    local name = playerInfo.name
    local ucid = playerInfo.ucid
    -- all is -1 for chat to all, -2 for chat to allies (!!!)
    local toAll = all == -1
    local destination = toAll and "ALL" or "ALLIES"
    net.log("GVAWPlayerLogger: CHAT [" .. name .. "] (" .. ucid .. ") <" .. destination .. ">: " .. msg)
end

DCS.setUserCallbacks(M)

net.log("Loaded GVAWPlayerLogger")
