RegisterCommand("devprint", function(source, args, rawCommand)
    print("DEV PRINT")
end, false)

RegisterCommand("respawn", function(source, args, rawCommand)
    local ped = Citizen.InvokeNative(0x275F255ED201B937, source)
    print(ped)
        Citizen.InvokeNative(0x71BC8E838B9C6035, ped)
end, false)



RegisterCommand("kys", function(source, args, rawCommand)
    local ped = Citizen.InvokeNative(0x275F255ED201B937, source)
        Citizen.InvokeNative(0x697157CED63F18D4, ped, 500000, false, true, true)
end, false)



AddEventHandler("onClientResourceStart", function() -- Reveal whole map on spawn
    Citizen.InvokeNative(0x4B8F743A4A6D2FF8, true)
end)


Citizen.CreateThread(function()
  while true do
     Citizen.Wait(1)
   while Citizen.InvokeNative(0x2E9C3FCB6798F397) do
    DrawTxt("~r~Nie żyjesz ~s~", 0.40, 0.50, true, 161, 3, 0)
    print ("PLAYER IS DEAD")
    Citizen.Wait(20000)
    respawn()
end

  end
end)

function respawn(source)
    local ped = Citizen.InvokeNative(0x275F255ED201B937, source)
    print(ped)
    Citizen.InvokeNative(0x71BC8E838B9C6035, ped)
end





function DrawRct(x, y, w, h, r, g, b, a)
DrawRect(x,y,w,h,r,g,b,a,true,true)
end


-- DRAW TEXT SECTION--
function DrawTxt(str, x, y, enableShadow, col1, col2, col3)
    local str = CreateVarString(10, "LITERAL_STRING", str)


    --Citizen.InvokeNative(0x66E0276CC5F6B9DA, 2)
    SetTextScale(1.0, 1.0)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), 255)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DrawText(str, x, y)
end

function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end