local API = {};

local ChatModeration = {
    ["3828191940"] = {
        LastReason = "strike decay",
        LastUpdated = 1772883108,
        MutedUntil = 1772869584,
        Strikes = 0
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
