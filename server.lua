ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('shelo_cegla:dawaj_jom')
AddEventHandler('shelo_cegla:dawaj_jom', function()
  local source_ = source
  local xPlayer = ESX.GetPlayerFromId(source)
  local szansaNaCegle = math.random(1 , 5)

  if szansaNaCegle > 3 then
		xPlayer.addWeapon('WEAPON_SNOWBALL', 1)
      pNotify('<span style="color:green">Znaleziono CEGŁĘ!!</span>', 'success', 3000)
  else
    pNotify('Może następnym razem!', 'success', 3000)
  end
end)

RegisterNetEvent('black:dawaj_to')
AddEventHandler('black:dawaj_to', function(it, price)
  local xPlayer = ESX.GetPlayerFromId(source)
  local itemCount = xPlayer.getInventoryItem(it).count

if itemCount < 1 then
	xPlayer.addInventoryItem(it, 1)
	xPlayer.removeAccountMoney("bank", price)
		pNotify('Pobrano <span style="color: green">$'..price..'</span> z banku', 'success', 3000)
else
	pNotify('<span style="color: orange">Posiadasz już '..it..'</span>', 'success', 3000)
end
end)

pNotify = function(message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", source, {
		text = message,
		type = messageType,
		queue = "shop_sv",
		timeout = messageTimeout,
		layout = "centerRight"
	})
end
