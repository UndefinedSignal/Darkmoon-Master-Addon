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
local commands = {}
commands["DMA_MiniMenuContentGMGMON"] = {".gm on", ".whisper on"};
commands["DMA_MiniMenuContentGMFLYON"] = {".gm fly on"};
commands["DMA_MiniMenuContentGMWHON"] = {".whisper on"};
commands["DMA_MiniMenuContentGMCHAT"] = {".gm chat on"};
commands["DMA_MiniMenuContentGMINVON"] = {".gm vis off"};
commands["DMA_MiniMenuContentGMTAXICHEAT"] = {".cheat taxi on"};
commands["DMA_MiniMenuContentGMWATERWALK"] = {".cheat waterwalk on"};
commands["DMA_MiniMenuContentGMVIEWALLMAPS"] = {".cheat explore 1"};

commands["DMA_MiniMenuContentGMGMOFF"] = {".gm off"};
commands["DMA_MiniMenuContentGMFLYOFF"] = {".gm fly off"};
commands["DMA_MiniMenuContentGMWHOFF"] = {".whisper off"};
commands["DMA_MiniMenuContentGMCHATOFF"] = {".gm chat off"};
commands["DMA_MiniMenuContentGMINVOFF"] = {".gm vis on"};
commands["DMA_MiniMenuContentGMTAXICHEATOFF"] = {".cheat taxi off"};
commands["DMA_MiniMenuContentGMWATERWALKOFF"] = {".cheat waterwalk off"};
commands["DMA_MiniMenuContentGMVIEWALLMAPSOFF"] = {".cheat explore 0"};

commands["DMA_MiniMenuLeftPick1"] = {"/DMA:HideMiniMenuFrames();	DMA_MiniMenuContentGM:Show();"}; -- GM
commands["DMA_MiniMenuLeftPick2"] = {"/DMA:HideMiniMenuFrames();	DMACharacterFrame:Show();"}; -- Char
commands["DMA_MiniMenuLeftPick3"] = {"/print(\"WIP\")"}; -- Char2
commands["DMA_MiniMenuLeftPick4"] = {"/print(\"WIP\")"}; -- NPC
commands["DMA_MiniMenuLeftPick5"] = {"/DMA:HideMiniMenuFrames();	DMAPlayerMoveFrame:Show();"}; -- Playermove
commands["DMA_MiniMenuLeftPick6"] = {"/DMA:HideMiniMenuFrames();	DMA_MiniMenuContentGameobject:Show();"}; -- Gameobject
commands["DMA_MiniMenuLeftPick7"] = {"/DMA:HideMiniMenuFrames();	DMA_MiniMenuContentTeleport:Show();		DMA_MiniMenuRight:Show();	DMA_MiniMenuRightTeleport:Show();"}; -- Tele
commands["DMA_MiniMenuLeftPick8"] = {"/DMA:ProcessDMAMorph()"}; -- Misc
commands["DMA_MiniMenuLeftPick9"] = {"/print(\"WIP\")"}; -- Server

function DMA:HideMiniMenuFrames()
	DMA_MiniMenuContentGM:Hide();
	DMACharacterFrame:Hide();
	DMAPlayerMoveFrame:Hide();
	DMA_MiniMenuContentGameobject:Hide();
	DMA_MiniMenuContentTeleport:Hide();
end

function DMA:EXECUTEGMCOMMAND(cmd)
	DMA:SendChatMessage(commands[tostring(cmd)]);
end

function DMA:EXECUTEPICKMENUCOMMAND(cmd)
	if (_G["DMA_MiniMenuRight"]:IsShown()) then
		_G["DMA_MiniMenuRightTeleport"]:Hide();
		_G["DMA_MiniMenuRight"].FadeOut:Play();
	end
	DMA:SendChatMessage(commands[tostring(cmd)]);
end

function DMA:SendChatMessage(msg, ChatType, channel)
	if type(msg) == "table" then
		if msg[1] == nil then
			return
		end
		if ChatType == nil then
			ChatType = "GUILD";
		end
		if channel == nil then
			channel = nil;
		end
		for i=1, #msg do
			if string.sub(msg[i], 1, 1) == '/' then
				RunScript(string.sub(msg[i], 2));
			else
				local language = DEFAULT_CHAT_FRAME.editBox.languageID;
				SendChatMessage(msg[i], ChatType, language, channel);
			end
		end
	elseif type(msg) == "string" then
		local language = DEFAULT_CHAT_FRAME.editBox.languageID;
		SendChatMessage(msg, ChatType, language, channel);
	end
end
