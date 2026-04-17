local API = {};

local ChatModeration = {
    ["10830490387"] = {
        LastReason = "blacklist bypass attempt",
        LastUpdated = 1776391547,
        MutedUntil = 1776391847,
        Strikes = 1
    },
    ["3425034708"] = {
        LastReason = "strike decay",
        LastUpdated = 1775491075,
        MutedUntil = 1775489781,
        Strikes = 0
    },
    ["8032597496"] = {
        LastReason = "strike decay",
        LastUpdated = 1776162750,
        MutedUntil = 1776161703,
        Strikes = 0
    },
    ["8458659751"] = {
        LastReason = "strike decay",
        LastUpdated = 1776006177,
        MutedUntil = 1775843416,
        Strikes = 0
    },
    ["9740263774"] = {
        LastReason = "cooldown bypass",
        LastUpdated = 1775907928,
        MutedUntil = 1775908228,
        Strikes = 1
    }
};

function API:GetChatModeration()
    return ChatModeration;
end;

function API:GetUserState(userId)
    return ChatModeration[tostring(userId)] or {};
end;

function API:IsMuted(userId)
    local state = API:GetUserState(userId)
    local mutedUntil = tonumber(state.MutedUntil) or 0
    return mutedUntil > os.time(), mutedUntil
end;

return API;
