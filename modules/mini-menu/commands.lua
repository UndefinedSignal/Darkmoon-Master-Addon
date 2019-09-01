local commands = {}
commands["DMA_MiniMenuContentGMGMON"] = {"gm on", "whisper on"};
commands["DMA_MiniMenuContentGMFLYON"] = {"gm fly on"};
commands["DMA_MiniMenuContentGMWHON"] = {"whisper on"};
commands["DMA_MiniMenuContentGMCHAT"] = {"gm chat on"};
commands["DMA_MiniMenuContentGMINVON"] = {"gm vis off"};
commands["DMA_MiniMenuContentGMTAXICHEAT"] = {"cheat taxi on"};
commands["DMA_MiniMenuContentGMWATERWALK"] = {"cheat waterwalk on"};
commands["DMA_MiniMenuContentGMVIEWALLMAPS"] = {"cheat explore 1"};

commands["DMA_MiniMenuContentGMGMOFF"] = {"gm off"};
commands["DMA_MiniMenuContentGMFLYOFF"] = {"gm fly off"};
commands["DMA_MiniMenuContentGMWHOFF"] = {"whisper off"};
commands["DMA_MiniMenuContentGMCHATOFF"] = {"gm chat off"};
commands["DMA_MiniMenuContentGMINVOFF"] = {"gm vis on"};
commands["DMA_MiniMenuContentGMTAXICHEATOFF"] = {"cheat taxi off"};
commands["DMA_MiniMenuContentGMWATERWALKOFF"] = {"cheat waterwalk off"};
commands["DMA_MiniMenuContentGMVIEWALLMAPSOFF"] = {"cheat explore 0"};


commands["DMA_MiniMenuLeftPick1"] = {"/DMA:HideMiniMenuFrames();	DMA_MiniMenuContentGM:Show();"}; -- GM
commands["DMA_MiniMenuLeftPick2"] = {"/print(\"Executed\")"}; -- Char
commands["DMA_MiniMenuLeftPick3"] = {"/print(\"Executed\")"}; -- Char2
commands["DMA_MiniMenuLeftPick4"] = {"/print(\"Executed\")"}; -- NPC
commands["DMA_MiniMenuLeftPick5"] = {"/DMA:HideMiniMenuFrames();	DMAGobMoveFrame:Show();"}; -- Gameobject
commands["DMA_MiniMenuLeftPick6"] = {"/print(\"Executed\")"}; -- Gameobject2
commands["DMA_MiniMenuLeftPick7"] = {"/print(\"Executed\")"}; -- Tele
commands["DMA_MiniMenuLeftPick8"] = {"/print(\"Executed\")"}; -- Misc
commands["DMA_MiniMenuLeftPick9"] = {"/print(\"Executed\")"}; -- Server

function DMA:HideMiniMenuFrames()
	DMA_MiniMenuContentGM:Hide();
	DMAGobMoveFrame:Hide();
end

function DMA:EXECUTEGMCOMMAND(cmd)
	DMA:SendChatMessage(commands[tostring(cmd)]);
end

function DMA:EXECUTEPICKMENUCOMMAND(cmd)
	DMA:SendChatMessage(commands[tostring(cmd)]);
end

function DMA:SendChatMessage(msg, ChatType, channel)
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
			local msg = "."..tostring(msg[i]);
			local language = DEFAULT_CHAT_FRAME.editBox.languageID;
			SendChatMessage(msg, ChatType, language, channel);
		end
	end
end
