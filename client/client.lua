RegisterCommand("devprint", function(source, args, rawCommand)
    print("DEV PRINT")
end, false)

RegisterCommand("respawn", function(source, args, rawCommand)
if Config.RespawnCommand then
	respawn(source)
	else
	end
end, false)



RegisterCommand("kys", function(source, args, rawCommand)
if Config.kysCommand then
    local ped = Citizen.InvokeNative(0x275F255ED201B937, source)
        Citizen.InvokeNative(0x697157CED63F18D4, ped, 500000, false, true, true)
		else end
end, false)



AddEventHandler("onClientResourceStart", function() -- Reveal whole map on spawn
    Citizen.InvokeNative(0x4B8F743A4A6D2FF8, true)
end)


Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
	while Citizen.InvokeNative(0x2E9C3FCB6798F397) do
	Citizen.Wait(0)
	local timer = GetGameTimer()+Config.RespawnTime
	while timer >= GetGameTimer() do
	
	Citizen.Wait(0)
		Citizen.InvokeNative(0xFA08722A5EA82DA7, Config.Timecycle)
		Citizen.InvokeNative(0xFDB74C9CC54C3F37, Config.TimecycleStrenght)
		DrawTxt(Config.LocaleDead, 0.50, 0.50, true, 161, 3, 0)
		DrawTxtSmall(Config.LocaleTimer .. tonumber(string.format("%.0f", (((GetGameTimer() - timer) * -1)/1000))), 0.50, 0.60, true, 255, 255, 255)
			--print ("PLAYER IS DEAD")
				end
				respawn()
				Citizen.Wait(1)
					end
						end
end)


Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
if Config.Coords then
local ent = GetPlayerPed(source)
local pp = GetEntityCoords(ent)
DrawTxtSmall("x = " .. tonumber(string.format("%.2f", pp.x)) .. " y = " .. tonumber(string.format("%.2f", pp.y)) .. " z = " .. tonumber(string.format("%.2f", pp.z)), 0.50, 0.0, true, 255, 255, 255)
else end
end
end)


function respawn(source)
    local ped = Citizen.InvokeNative(0x275F255ED201B937, source)
    Citizen.InvokeNative(0x71BC8E838B9C6035, ped)
	Citizen.InvokeNative(0x0E3F4AF2D63491FB)
end

-- DRAW TEXT SECTION--
function DrawTxt(str, x, y, enableShadow, col1, col2, col3)
    local str = CreateVarString(10, "LITERAL_STRING", str)


    --Citizen.InvokeNative(0x66E0276CC5F6B9DA, 2)
    SetTextScale(1.0, 1.0)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), 255)
	SetTextCentre(true)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DrawText(str, x, y)
end

function DrawTxtSmall(str, x, y, enableShadow, col1, col2, col3)
    local str = CreateVarString(10, "LITERAL_STRING", str)


    --Citizen.InvokeNative(0x66E0276CC5F6B9DA, 2)
    SetTextScale(0.7, 0.7)
	SetTextCentre(true)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), 255)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DrawText(str, x, y)
end

function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end