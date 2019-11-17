RegisterCommand("devprint", function(source, args, rawCommand)
    print("DEV PRINT")
end, false)

AddEventHandler("playerSpawned", function() -- Reveal whole map on spawn
    Citizen.InvokeNative(0x4B8F743A4A6D2FF8, true)
end)