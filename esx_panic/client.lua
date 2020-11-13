ESX                           = nil
local pelaaja              = {}
Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  pelaaja = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  pelaaja.job = job
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 172) then
            if pelaaja.job ~= nil and pelaaja.job.name == "police" then
            TriggerServerEvent("esx_paniikki:viesti")
            kordinaatit = GetEntityCoords(GetPlayerPed(-1))
            end
      end
    end
end)


RegisterNetEvent("esx_paniikki:viesti_toteutus")
AddEventHandler("esx_paniikki:viesti_toteutus", function(etunimi, sukunimi)

  ESX.ShowAdvancedNotification('Hätäkeskus ilmoittaa', '', ''.. etunimi ..' '.. sukunimi ..' painoi paniikkinappia!', 'CHAR_CALL911' , 0)
  samppi44 = 0
  
  
  
  Citizen.CreateThread(function()
  while samppi44 < 3 do
  PlaySound(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)

  Citizen.Wait(1000)
  
  samppi44 = samppi44 + 1
 
  end
end)
  
  
  Wait(300)
  ESX.ShowHelpNotification("Paina ~INPUT_CONTEXT~ saadaksesi navigaattoriin sijainnin", false, true, 4000)
			

	  Citizen.CreateThread(function()
		  while true do
		  Citizen.Wait(1)
		  if IsControlPressed(0, 38) then
		  	SetNewWaypoint(kordinaatit.x, kordinaatit.y)
		  	break
        end
      end
    end)



end)
