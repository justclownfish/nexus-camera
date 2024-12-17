local PlayersData = {}
local LevelsInfo = {}

local RSGCore = exports['rsg-core']:GetCoreObject()

local function LoadDB()
    local data = MySQL.query.await('SELECT * FROM player_skills')
    for i = 1, #data do
        local value = data[i]
        PlayersData[value.player_id] = {
            mining_lvl = value.shooting_lvl,
            mining_exp = value.shooting_exp
        }
    end
    data = MySQL.query.await('SELECT * FROM shooting_level')
    LevelsInfo.max_level = #data
    for i = 1, #data do
        local value = data[i]
        LevelsInfo[value.lvl] = value
    end
end
