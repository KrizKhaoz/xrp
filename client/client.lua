RegisterCommand("devprint", function(source, args, rawCommand)
    print("DEV PRINT")
end, false)

RegisterCommand("respawn", function(source, args, rawCommand)
    local ped = Citizen.InvokeNative(0x275F255ED201B937, source)
    print(ped)
        Citizen.InvokeNative(0x71BC8E838B9C6035, ped)
end, false)

AddEventHandler("onClientResourceStart", function() -- Reveal whole map on spawn
    Citizen.InvokeNative(0x4B8F743A4A6D2FF8, true)
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(100)
    if Citizen.InvokeNative(0x2E9C3FCB6798F397) then -- if is dead
        print ("PLAYER IS DEAD")
        Citizen.Wait(15000)
        respawn()
    else
        print("NOT DEAD")
    end

  end
end)

function respawn(source)
    local ped = Citizen.InvokeNative(0x275F255ED201B937, source)
    print(ped)
    Citizen.InvokeNative(0x71BC8E838B9C6035, ped)
end