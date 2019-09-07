local function SysChatFilter(self, event, msg, author, ...)
	if(DMAUserVars["GPS-Scan"] == true and not (tonumber(DMAUserVars["LastGPS-Z"]) == tonumber(0))) then
		return true;
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", SysChatFilter)

function DMA:InitializeHooks()
	--PLAYER_ENTERING_WORLD lol kek, hooks doesn't need
	DMAUserVars["LastGPS-O"] = 0;
end
