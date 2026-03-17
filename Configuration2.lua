local API = {};

local ChatModeration = {
    ["10444664496"] = {
        LastReason = "spam burst (8/5s)",
        LastUpdated = 1773775588,
        MutedUntil = 1773775888,
        Strikes = 1
    },
    ["10649241569"] = {
        LastReason = "spam burst (8/5s)",
        LastUpdated = 1773136899,
        MutedUntil = 1773137199,
        Strikes = 1
    },
    ["8179404656"] = {
        LastReason = "cooldown bypass",
        LastUpdated = 1773512033,
        MutedUntil = 1773512333,
        Strikes = 1
    },
    ["9654100719"] = {
        LastReason = "cooldown bypass",
        LastUpdated = 1773712227,
        MutedUntil = 1773712527,
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
