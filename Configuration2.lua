local API = {};

local ChatModeration = {
    ["10612749931"] = {
        LastReason = "blacklist bypass attempt",
        LastUpdated = 1772481954,
        MutedUntil = 1772482254,
        Strikes = 1
    },
    ["8823091362"] = {
        LastReason = "repeat-char spam",
        LastUpdated = 1772459330,
        MutedUntil = 1772459630,
        Strikes = 1
    },
    ["9654100719"] = {
        LastReason = "cooldown bypass",
        LastUpdated = 1772760147,
        MutedUntil = 1772760447,
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
