-- Made by Donrskbb#0007 --

-- ONLY EDIT BELOW THIS --
local DISCORD_WEBHOOK = "YOUR WEBHOOK"
local DISCORD_NAME = "YOUR BOT NAME"
local DISCORD_IMAGE = "YOUR FOOTER IMAGE" -- Image must end on .png --
local communityname = "Discord Bot By Donrskbb"
local STEAM_KEY = "YOUR STEAM API"

--DON'T EDIT BELOW THIS --
PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, content = "FiveM Leave and Join Logger **ONLINE**", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })

AddEventHandler('playerConnecting', function() 
local color = 65280
    sendToDiscord("leeg", "Server Login", color)
end)

AddEventHandler('playerDropped', function(reason)
local color = 16711680
	if string.match(reason, "Kicked") or string.match(reason, "Banned") then
		color = 16007897
	end
  sendToDiscord("leeg", "Server Logout. \nReason: " .. reason, color)
end)

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function sendToDiscord(name, message, color)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
			["color"] = color,
            ["title"] = message,
            ["description"] = "Player: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = DISCORD_IMAGE,
            },
        }
    }
  PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end
