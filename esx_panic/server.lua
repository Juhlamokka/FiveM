ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)






RegisterServerEvent('esx_paniikki:viesti')
AddEventHandler('esx_paniikki:viesti', function()
    
    local xPlayer = ESX.GetPlayerFromId(source)

    local nimi = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    })

    


    local etunimi = nimi[1].firstname
    local sukunimi = nimi[1].lastname



    local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == "police" or xPlayer.job.name == "sheriff" then
        TriggerClientEvent("esx_paniikki:viesti_toteutus", xPlayers[i], etunimi, sukunimi)

    end
end






end)