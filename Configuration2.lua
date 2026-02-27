local API = {};

local ChatModeration = {};

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
