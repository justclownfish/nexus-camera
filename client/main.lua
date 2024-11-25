local RSGCore = exports['rsg-core']:GetCoreObject()
   
Citizen.CreateThread(function() 
    while true do
        if RSGCore.Functions.GetPlayerData().citizenid then
            Citizen.CreateThread(function()      
                while true do
                    Wait(0)
                    local firstperson = Citizen.InvokeNative(0x90DA5BA5C2635416)
                end
            end)
        end
        Wait(1000)
    end
end)