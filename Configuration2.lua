local API = {};

local ChatModeration = {
    ["2041098977"] = {
        LastReason = "blacklist bypass attempt",
        LastUpdated = 1773013846,
        MutedUntil = 1773014146,
        Strikes = 1
    },
    ["3828191940"] = {
        LastReason = "blacklist bypass attempt",
        LastUpdated = 1772883467,
        MutedUntil = 1772883767,
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
