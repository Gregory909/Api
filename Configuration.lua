local API = {};
local HardBans = {"1293792120","1993687031","604430770","1222680","6225378520","7166779222","10035014576"};
local IPBans = {};
local Warnings = {
    ["3441475358"] = {Reason = "N words in chat", Moderator = "gregory909"},
};
function API:GetHardBans()
	return HardBans;
end;
function API:GetIPBans()
	return IPBans;
end;
function API:GetWarnings()
	return Warnings;
end;
function API:IsHardBanned(player)
	return table.find(HardBans, tostring(player.UserId)) ~= nil;
end;
function API:HasWarning(userId)
	return Warnings[tostring(userId)] ~= nil;
end;

function API:IsIPBanned(ip)
	return table.find(IPBans, tostring(ip)) ~= nil;
end;

return API;
