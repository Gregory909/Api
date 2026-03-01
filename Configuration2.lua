local API = {};

local ChatModeration = {
    ["4009693961"] = {
        LastReason = "webhook rejected message",
        LastUpdated = 1772322242,
        MutedUntil = 1772322542,
        Strikes = 1
    },
    ["8775533108"] = {
        LastReason = "strike decay",
        LastUpdated = 1772358254,
        MutedUntil = 1772356261,
        Strikes = 0
    },
    ["9432475747"] = {
        LastReason = "blacklist bypass attempt",
        LastUpdated = 1772321194,
        MutedUntil = 1772321494,
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
