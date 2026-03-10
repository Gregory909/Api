local API = {};

local ChatModeration = {
    ["10649241569"] = {
        LastReason = "spam burst (8/5s)",
        LastUpdated = 1773136899,
        MutedUntil = 1773137199,
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
