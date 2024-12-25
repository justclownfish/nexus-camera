local PlayersData = {}
local LevelsInfo = {}

local RSGCore = exports['rsg-core']:GetCoreObject()

local function LoadDB()
    local data = MySQL.query.await('SELECT * FROM shooting_level')
    LevelsInfo.max_level = #data
    for i = 1, #data do
        local value = data[i]
        LevelsInfo[value.lvl] = value
    end
end

RegisterNetEvent('nexus-db:server:OnConnected', function()
    SendShootingData(source)
end)

function SendShootingData(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    
    if PlayersData[Player.PlayerData.citizenid] == nil then
        PlayersData[Player.PlayerData.citizenid] = { shooting_lvl = 1, shooting_exp = 0 }
        MySQL.insert.await('INSERT INTO player_skills VALUES (?, 1, 0, 1, 0)', { Player.PlayerData.citizenid })
    end
    
    TriggerClientEvent('nexus-camera:client:OnShootingData', source, PlayersData[Player.PlayerData.citizenid])
end

AddEventHandler('nexus-db:server:OnStart', function()
    exports["nexus-db"]:Functions().Register("shooting", {
        columns = { "exp", "lvl" }
    })
end)
LoadDB()
