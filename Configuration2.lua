local API = {};

local ChatModeration = {
    ["8823091362"] = {
        LastReason = "repeat-char spam",
        LastUpdated = 1772459330,
        MutedUntil = 1772459630,
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
