local API = {};

local ChatModeration = {
    ["10133766492"] = {
        LastReason = "sending during mute",
        LastUpdated = 1772160336,
        MutedUntil = 1772171136,
        Strikes = 4
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
