ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



local cegla = vector3(-178.35 , -1024.62, 27.02)
local blackmark = vector3(485.35 , -3383.62, 6.02)


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(6)
	    local playerPed = GetPlayerPed(-1)
			local coords = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(coords, blackmark, true) < 10 then
					Draw3DText(blackmark.x, blackmark.y, blackmark.z, '~r~[E]~w~ aby otworzyć menu ')
					if IsControlJustPressed(1, 51) and GetDistanceBetweenCoords(coords, blackmark, true) < 3 then
						MenuDark()
					end
			end
	end
end)

function MenuDark()
  ESX.UI.Menu.Open(
  'default', GetCurrentResourceName(), 'dark',
  {
    title    = 'Menu Sklepu',
    align    = 'center',
    elements = {
      {label = 'Hacker Device', value = 'hd'},
    }
  },
  function(data, menu)
    if data.current.value == 'hd' then
			TriggerServerEvent('black:dawaj_to', 'hackerDevice', '100')
      ESX.UI.Menu.CloseAll()
      elseif data.current.value == 'wiz' then
      ESX.UI.Menu.CloseAll()
		elseif data.current.value == 'ubez' then
      ESX.UI.Menu.CloseAll()
  	end
  end,
  function(data, menu)
    menu.close()
    ESX.UI.Menu.CloseAll()
  end
)
end



local cegly1 = vector3(112.1, -367.5, 43.45)
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(6)
	    local playerPed = GetPlayerPed(-1)
			local coords = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(coords, cegly1, true) < 10 then
					Draw3DText(cegly1.x, cegly1.y, cegly1.z, '~r~[E]~w~ aby szukać cegły ')
					if IsControlJustPressed(1, 51) and GetDistanceBetweenCoords(coords, cegly1, true) < 3 then
						szukanie()
					end
			end
	end
end)
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(6)
	    local playerPed = GetPlayerPed(-1)
			local coords = GetEntityCoords(playerPed)
			if GetDistanceBetweenCoords(coords, cegla, true) < 10 then
					Draw3DText(cegla.x, cegla.y, cegla.z, '~r~[E]~w~ aby szukać cegły ')
					if IsControlJustPressed(1, 51) and GetDistanceBetweenCoords(coords, cegla, true) < 3 then
						szukanie()
					end
			end
	end
end)

function szukanie()
	local playerPed = GetPlayerPed(-1)
	TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
  TriggerEvent("mythic_progbar:client:progress", {
  name = "unique_action_name",
  duration = 10000,
  label = "Szukanie cegieł...",
  useWhileDead = false,
  canCancel = true,
  controlDisables = {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }
}, function(status)
  if not status then
    TriggerServerEvent('shelo_cegla:dawaj_jom')
    ClearPedTasksImmediately(playerPed)
  end
end)
end



	function Draw3DText(x, y, z, text)
	    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	    local p = GetGameplayCamCoords()
	    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
	    local scale = (1 / distance) * 2
	    local fov = (1 / GetGameplayCamFov()) * 100
	    local scale = scale * fov
	    if onScreen then
	        SetTextScale(0.0, 0.35)
	        SetTextFont(4)
	        SetTextProportional(1)
	        SetTextColour(255, 255, 255, 255)
	        SetTextDropshadow(0, 0, 0, 0, 255)
	        SetTextEdge(2, 0, 0, 0, 150)
	        SetTextDropShadow()
	        SetTextOutline()
	        SetTextEntry("STRING")
	        SetTextCentre(1)
	        AddTextComponentString(text)
	        DrawText(_x,_y)
	    end
	end

function showText(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
