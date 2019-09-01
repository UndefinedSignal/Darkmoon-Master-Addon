function DMA:MoveBackForward(mode)
	local distance = DMA.PlayerMovement.Distance;
	if distance == nil then
		distance = 1;
	end
	if mode == 2 then
		distance = distance * -1
	end
	local angle = GetPlayerFacing()
	local sin = math.sin(angle)
	local cos = math.cos(angle)
	local py, px = DMA.HBD:GetPlayerWorldPosition()
	px = px + distance * cos;
	py = py + distance * sin;
	local pz = 0

	local msg = ".go xyz "..px.." "..py
	SendChatMessage(msg, "WHISPER", nil, GetUnitName("PLAYER"))
end

