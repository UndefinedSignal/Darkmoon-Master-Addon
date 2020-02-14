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
function DMA:DMA_MiniMenuExposeLeftOnEnter(self)
	SetCursor("Interface/CURSOR/Inspect");
end

function DMA:DMA_MiniMenuExposeLeftOnLeave(self)
	SetCursor(nil);
end

function DMA:DMA_MiniMenuExposeLeftOnClick(self)
	if (DMA_MiniMenuLeft:IsShown()) then
		DMA_MiniMenuLeft.FadeOut:Play();
	else
		DMA_MiniMenuLeft:Show();
	end
end

function DMA:DMA_MiniMenuExposeRightOnEnter(self)
	SetCursor("Interface/CURSOR/Inspect");
end
function DMA:DMA_MiniMenuExposeRightOnLeave(self)
	SetCursor(nil);
end

function DMA:DMA_MiniMenuExposeRightOnClick(self)
	if (DMA_MiniMenuRight:IsShown()) then
		DMA_MiniMenuRight.FadeOut:Play()
		--DMA_MiniMenuRight:Hide();
	else
		DMA_MiniMenuRight:Show();
	end
end

function DMA:DMA_MiniMenuOnLoad(self)
	self:RegisterForDrag("LeftButton");
	tinsert(UISpecialFrames, self:GetName());
	self:Show();
end

function DMA:DMA_MiniMenuOnDragStart(self)
	self:StartMoving();
end

function DMA:DMA_MiniMenuOnDragStop(self)
	self:StopMovingOrSizing();
end


-- DMA_MiniMenuLeft

function DMA:DMA_MiniMenuLeft_OnFadeOutAnimFinished(self)
	DMA_MiniMenuLeft:Hide();
end

function DMA:DMA_MiniMenuLeft_OnShow(self)
	self.FadeIn:Play();
end

-- DMA_MiniMenuRight

function DMA:DMA_MiniMenuRight_OnFadeOutAnimFinished(self)
	DMA_MiniMenuRight:Hide();
end

function DMA:DMA_MiniMenuRight_OnShow(self)
	self.FadeIn:Play();
end

-- GM Content Commands
function DMA:ShowTooltipForTriggerButton(self, name)
	local number = DMA:GetCommandNumber(name);
	if number == nil then
		number = "Описание команды временно отсутствует"
		GameTooltip:ClearLines();
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
		GameTooltip:AddLine(number)
		GameTooltip:Show();
	else
		GameTooltip:ClearLines();
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
		GameTooltip:AddLine(DMA.CommandsList[number][3].." "..DMA.CommandsList[number][4])
		GameTooltip:AddLine(DMA.CommandsList[number][5])
		GameTooltip:Show();
	end
end

function DMA:GetCommandNumber(name)
	for i=1, #DMA.CommandsList do
		if DMA.CommandsList[i][2] == tostring(name) then
			return i;
		end
	end
	return nil;
end

function DMA:HideTooltip(self)
	GameTooltip:ClearLines();
	GameTooltip:Hide();
end

-- LeftMenu Commands

function DMA:ShowGMFrame(self)
	DMA_MiniMenuContentGM:Show();
end

function DMA:BackGroundAlphaInitialize()
	local number = tonumber(DMAUserVars["BackgroundAlpha"])
	DMA_MiniMenuBackground:SetAlpha(number);
	DMA_MiniMenuLeftBackground:SetAlpha(number);
	DMA_MiniMenuRightBackground:SetAlpha(number);
end

function DMA:AlphaSlider()
	DMA_AlphaSlider:SetOrientation('HORIZONTAL');
	DMA_AlphaSlider:SetMinMaxValues(1, 11);
	DMA_AlphaSlider:SetValue(DMAUserVars["BackgroundAlpha"]*10);
	DMA_AlphaSlider:SetScript("OnValueChanged", function(self,event,arg1) 
		local number = tonumber(event)/10;
		DMA_MiniMenuBackground:SetAlpha(number);
		DMA_MiniMenuLeftBackground:SetAlpha(number);
		DMA_MiniMenuRightBackground:SetAlpha(number);
		DMAUserVars["BackgroundAlpha"] = number;
	end)
end

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

local DMAScaleCheckBoxes = {}
DMAScaleCheckBoxes["DMACharacterFrameSpeedCheckSwim"] = {"/DMACharacterFrameSpeedCheckAll:SetChecked();"}
DMAScaleCheckBoxes["DMACharacterFrameSpeedCheckWalk"] = {"/DMACharacterFrameSpeedCheckAll:SetChecked();"}
DMAScaleCheckBoxes["DMACharacterFrameSpeedCheckFly"] = {"/DMACharacterFrameSpeedCheckAll:SetChecked(false);"}
DMAScaleCheckBoxes["DMACharacterFrameSpeedCheckBackWalk"] = {"/DMACharacterFrameSpeedCheckAll:SetChecked(false);"}
DMAScaleCheckBoxes["DMACharacterFrameSpeedCheckAll"] = {"/DMACharacterFrameSpeedCheckBackWalk:SetChecked(false);	DMACharacterFrameSpeedCheckFly:SetChecked(false);	DMACharacterFrameSpeedCheckWalk:SetChecked(false);	DMACharacterFrameSpeedCheckSwim:SetChecked(false);"}

function DMA:GetActiveSpeedCheckBox()
	local messages = {}	
	if not DMACharacterFrameSpeedCheckSwim:GetChecked() and not DMACharacterFrameSpeedCheckAll:GetChecked() and not DMACharacterFrameSpeedCheckWalk:GetChecked() and not DMACharacterFrameSpeedCheckFly:GetChecked() and not DMACharacterFrameSpeedCheckBackWalk:GetChecked() then
		table.insert(messages, ".mod speed all ")
		return messages
	end
	if DMACharacterFrameSpeedCheckAll:GetChecked() then
		table.insert(messages, ".mod speed all ")
		return messages
	end
	if DMACharacterFrameSpeedCheckSwim:GetChecked() then
		table.insert(messages, ".mod speed swim ")
	end
	if DMACharacterFrameSpeedCheckWalk:GetChecked() then
		table.insert(messages, ".mod speed walk ")
	end
	if DMACharacterFrameSpeedCheckFly:GetChecked() then
		table.insert(messages, ".mod speed fly ")
	end
	if DMACharacterFrameSpeedCheckBackWalk:GetChecked() then
		table.insert(messages, ".mod speed backwalk ")
	end
	return messages
end

function DMA:SetCharacterSpeed(arg)
	local message = DMA:GetActiveSpeedCheckBox();
	for i=1, #message do
		DMA:SendChatMessage(message[i]..arg);
	end
end

function DMA:SetCharacterScale(arg)
	local msg = ".mod scale ";
	DMA:SendChatMessage(msg..arg);
end

function DMA:ProcessSpeedSliderCheckBoxes(arg)
	DMA:SendChatMessage(DMAScaleCheckBoxes[arg]);
end

function DMA:SpeedSliderReloadToDefauld()
	DMACharacterFrameSpeed:SetValue(1.000);
	DMACharacterFrameSpeedCounter:SetText(string.sub(DMACharacterFrameSpeed:GetValue(), 1, 5));
	DMA:SetCharacterSpeed(string.sub(DMACharacterFrameSpeed:GetValue(), 1, 5));
end

function DMA:ScaleSliderReloadToDefauld()
	DMACharacterFrameScale:SetValue(1.000);
	DMACharacterFrameScaleCounter:SetText(string.sub(DMACharacterFrameScale:GetValue(), 1, 5));
	DMA:SetCharacterScale(string.sub(DMACharacterFrameScale:GetValue(), 1, 5));
end

function DMA:UpdateEditBoxXYZ()
	DMAPlayerMoveFrameCoordX:SetText(DMAUserVars["LastGPS-X"]);
	DMAPlayerMoveFrameCoordY:SetText(DMAUserVars["LastGPS-Y"]);
	DMAPlayerMoveFrameCoordZ:SetText(DMAUserVars["LastGPS-Z"]);
	DMAPlayerMoveFrameCoordO:SetText(DMAUserVars["LastGPS-O"]);
end

function DMA:ProcessGPSMove()
	local px, py = DMA.HBD:GetRawPlayerWorldPosition();
	local pa = GetPlayerFacing();

	if not (math.floor(DMAUserVars["LastGPS-X"]) == math.floor(px) and math.floor(DMAUserVars["LastGPS-Y"]) == math.floor(py) and DMAUserVars["LastGPS-O"] == pa) then
		DMAUserVars["GPS-Scan"] = true;
		DMA.Timers["GPS-Timer"] = self:ScheduleTimer("ProcessGPSTimer", 1);
		SendChatMessage(".gps", "GUILD", DEFAULT_CHAT_FRAME.editBox.languageID);
	end
	DMA:UpdateEditBoxXYZ();
end

function DMA:ProcessGPSTimer()
	DMAUserVars["GPS-Scan"] = false;
	DMA:UpdateEditBoxXYZ();
end

function DMA:ProcessManualXYZInput()
	local msg = ".go xyz "..DMAPlayerMoveFrameCoordX:GetText().." "..DMAPlayerMoveFrameCoordY:GetText().." "..DMAPlayerMoveFrameCoordZ:GetText();
	SendChatMessage(msg, "WHISPER", nil, GetUnitName("PLAYER"));
end

function DMA:ProcessManualOrientationInput()
	local _, _, mapid = GetPlayerWorldPosition();
	local msg = ".go xyz "..DMAPlayerMoveFrameCoordX:GetText().." "..DMAPlayerMoveFrameCoordY:GetText().." "..DMAPlayerMoveFrameCoordZ:GetText().." "..mapid.." "..DMAPlayerMoveFrameCoordO:GetText();
	SendChatMessage(msg, "WHISPER", nil, GetUnitName("PLAYER"));
end

-- I'm so sorry for that

local DMAMoveIncrementFrames = {}
DMAMoveIncrementFrames["DMAPlayerMoveFrameCoordXIncrement"] = "DMAPlayerMoveFrameCoordX:SetText(tonumber(DMAPlayerMoveFrameCoordX:GetText())+tonumber(DMAPlayerMoveFrameDistance:GetText()))";
DMAMoveIncrementFrames["DMAPlayerMoveFrameCoordXDecrement"] = "DMAPlayerMoveFrameCoordX:SetText(tonumber(DMAPlayerMoveFrameCoordX:GetText())-tonumber(DMAPlayerMoveFrameDistance:GetText()))";
DMAMoveIncrementFrames["DMAPlayerMoveFrameCoordYIncrement"] = "DMAPlayerMoveFrameCoordY:SetText(tonumber(DMAPlayerMoveFrameCoordY:GetText())+tonumber(DMAPlayerMoveFrameDistance:GetText()))";
DMAMoveIncrementFrames["DMAPlayerMoveFrameCoordYDecrement"] = "DMAPlayerMoveFrameCoordY:SetText(tonumber(DMAPlayerMoveFrameCoordY:GetText())-tonumber(DMAPlayerMoveFrameDistance:GetText()))";
DMAMoveIncrementFrames["DMAPlayerMoveFrameCoordZIncrement"] = "DMAPlayerMoveFrameCoordZ:SetText(tonumber(DMAPlayerMoveFrameCoordZ:GetText())+tonumber(DMAPlayerMoveFrameDistance:GetText()))";
DMAMoveIncrementFrames["DMAPlayerMoveFrameCoordZDecrement"] = "DMAPlayerMoveFrameCoordZ:SetText(tonumber(DMAPlayerMoveFrameCoordZ:GetText())-tonumber(DMAPlayerMoveFrameDistance:GetText()))";
DMAMoveIncrementFrames["DMAPlayerMoveFrameCoordOIncrement"] = "print(\"WIP\")";
DMAMoveIncrementFrames["DMAPlayerMoveFrameCoordODecrement"] = "print(\"WIP\")";
DMAMoveIncrementFrames["DMAPlayerMoveFrameDistanceIncrement"] = "DMAPlayerMoveFrameDistance:SetText(tonumber(DMAPlayerMoveFrameDistance:GetText())+tonumber(1))";
DMAMoveIncrementFrames["DMAPlayerMoveFrameDistanceDecrement"] = "DMAPlayerMoveFrameDistance:SetText(tonumber(DMAPlayerMoveFrameDistance:GetText())-tonumber(1))";

function DMA:ProcessPlayerMoveIncDecrement(frame_name)
	RunScript(DMAMoveIncrementFrames[frame_name]);
	if (frame_name == "DMAPlayerMoveFrameCoordOIncrement") or (frame_name == "DMAPlayerMoveFrameCoordODecrement") then
		return
	end
	DMA:ProcessManualXYZInput();
end

function DMA:GameObjectSearchOnEnterPressed()
	DMA.Linkifier.isShowing = false;
	local msg = ".look obj "..DMA_MiniMenuContentGameobjectObjectSceneEditBox:GetText();
	SendChatMessage(msg, "WHISPER", nil, GetUnitName("PLAYER"));
	self:ScheduleTimer("SYSMSGEnable", 2)
	DMA:GameObjectSearchClearResults();
	DMA:GenerateObjScrollMenu();
end

function DMA:GameObjectSearchClearResults()
	DMA.GOB.ObjectList = {};
	DMA.GOB.ObjectList.ToShow = {};
	DMA.GOB.Counter = 1;
end

function DMA:SYSMSGEnable()
	DMA.Linkifier.isShowing = true;
	DMA:GenerateObjectsScrollMenu();
end