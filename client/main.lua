local RSGCore = exports['rsg-core']:GetCoreObject()
local citizen_data = {}
local isAiming = false

RegisterNetEvent('nexus-camera:client:OnShootingData', function(data)
    print("Recieved skill info")
    print("Shooting level: " .. data.shooting_lvl)
    print("Shooting exp: " .. data.shooting_exp)
    citizen_data = data
end)

AddEventHandler('nexus-db:client:OnConnected', function()
    Citizen.CreateThread(function()  
        while true do
            Wait(0)
            Citizen.InvokeNative(0x90DA5BA5C2635416)
            local newAiming = Citizen.InvokeNative(0x936F967D4BE1CE9D, PlayerId())
            print(newAiming)
            if isAiming ~= newAiming then
                isAiming = newAiming
                if isAiming == 1 then
                    Citizen.InvokeNative(0xD9B31B4650520529, 'HAND_SHAKE', 5.0)
                    print(newAiming)
                else 
                    Citizen.InvokeNative(0xD9B31B4650520529, 'HAND_SHAKE', 0.0)
                    print(newAiming)
                end
            end
        end
    end)
end)