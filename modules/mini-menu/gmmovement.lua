--[[
───────────▒▒▒▒▒▒▒▒
─────────▒▒▒──────▒▒▒
────────▒▒───▒▒▒▒──▒░▒
───────▒▒───▒▒──▒▒──▒░▒
──────▒▒░▒──────▒▒──▒░▒
───────▒▒░▒────▒▒──▒░▒
─────────▒▒▒▒▒▒▒───▒▒
─────────────────▒▒▒
─────▒▒▒▒────────▒▒
───▒▒▒░░▒▒▒─────▒▒──▓▓▓▓▓▓▓▓
──▒▒─────▒▒▒────▒▒▓▓▓▓▓░░░░░▓▓──▓▓▓▓
─▒───▒▒────▒▒─▓▓▒░░░░░░░░░█▓▒▓▓▓▓░░▓▓▓
▒▒──▒─▒▒───▓▒▒░░▒░░░░░████▓▓▒▒▓░░░░░░▓▓
░▒▒───▒──▓▓▓░▒░░░░░░█████▓▓▒▒▒▒▓▓▓▓▓░░▓▓
──▒▒▒▒──▓▓░░░░░░███████▓▓▓▒▒▒▒▒▓───▓▓░▓▓
──────▓▓░░░░░░███████▓▓▓▒▒▒▒▒▒▒▓───▓░░▓▓
─────▓▓░░░░░███████▓▓▓▒▒▒▒▒▒▒▒▒▓▓▓▓░░▓▓
────▓▓░░░░██████▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▓░░░░▓▓
────▓▓▓░████▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓
─────▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓
─────▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓
──────▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓
───────▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓
─────────▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓
───────────▓▓▓▓▓▓▒▒▒▒▒▓▓▓▓
───────────────▓▓▓▓▓▓▓▓
-- Made by TestUnit
]]--
function DMA:MoveCharacterXYZ(mode)
	local distance = DMAUserVars["MoveDistance"];
	local angle = GetPlayerFacing();
	if distance == nil then
		distance = 1;
	end
	
	if mode == 2 then
		distance = distance * -1;
	end
	if mode == 3 then -- Left
		angle = math.abs(angle - 1.5708);
	elseif mode == 4 then -- Right
		angle = math.abs(angle + 1.5708);
	end
	local sin = math.sin(angle);
	local cos = math.cos(angle);
	local py, px = DMA.HBD:GetRawPlayerWorldPosition();
	px = px + distance * cos;
	py = py + distance * sin;

	DMAUserVars["LastGPS-X"] = px;
	DMAUserVars["LastGPS-Y"] = py;
	DMAUserVars["LastGPS-O"] = angle;

	DMA:UpdateEditBoxXYZ();

	local msg = ".go xyz "..DMAUserVars["LastGPS-X"].." "..DMAUserVars["LastGPS-Y"].." "..DMAUserVars["LastGPS-Z"];
	--print(msg)
	SendChatMessage(msg, "WHISPER", nil, GetUnitName("PLAYER"));
end
-- 1.5707975 - 3.141595 + 1.5707975
-- 6,28319


function DMA:GenerateObjScrollMenu()
	FauxScrollFrame_Update(DMA_MiniMenuContentGameobjectObjectSceneScrollBar,#RPSEmoteFramework.EmoteList.ToShow,10,32);

	for jBtn=1, 12 do
		lineplusoffset = jBtn + FauxScrollFrame_GetOffset(DMA_MiniMenuContentGameobjectObjectSceneScrollBar);
		DMA.lineplusoffset[jBtn] = tonumber(lineplusoffset)
		--print("RPSEmoteFramework.EmoteList.lineplusoffset["..jBtn.."]:"..RPSEmoteFramework.EmoteList.lineplusoffset[jBtn])
	end

	DMA:GObjectScrollBar_Update()
end


function DMA:GObjectScrollBar_Update()
    if DMA.GOB.ObjectListInitialized then
        for line=1,#DMA.lineplusoffset do
            local lineplusoffset = DMA.lineplusoffset[line];
            if lineplusoffset <= #DMA.GOB.ObjectList.ToShow then
                _G["DMA_MiniMenuContentGameobjectObjectSceneGOB"..line]:SetText("[ |cFFFD8A00" .. line .. "|r ] ");
                --_G["DMA_MiniMenuContentGameobjectObjectSceneGOB"..line]:Show();
            else
                --_G["DMA_MiniMenuContentGameobjectObjectSceneGOB"..line]:Hide();
            end
        end
    end
end