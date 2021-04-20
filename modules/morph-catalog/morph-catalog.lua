-- settings
local MaxNumberOfColumn = 12
local MinNumberOfColumn = 3
local NumberOfColumn = 12
local MaxModelID = 95474
local WindowWidth = 1000
local WindowHeight = 760
-- vars
local Cells = {}
local OffsetModelID = 0
local ModelID = OffsetModelID
local LastMaxModelID = 0
local GoBackStack = {}
local GoBackDepth = 0
local DisplayFavorites = false
--
DMAFavMorphs = {
	FavoriteList = {}
}

-- DMAMorphFrame (main)
local DMAMorphFrame = CreateFrame("Frame", nil, UIParent)
DMAMorphFrame:Hide()
DMAMorphFrame:SetFrameStrata("DIALOG")
DMAMorphFrame:SetWidth(WindowWidth) 
DMAMorphFrame:SetHeight(WindowHeight)
DMAMorphFrame:SetPoint("CENTER",0,0)
DMAMorphFrame:SetMovable(true)
DMAMorphFrame:SetMinResize(400, 400)
DMAMorphFrame:SetClampedToScreen(true)
DMAMorphFrame:SetBackdrop( { 
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark", 
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", tile = true, tileSize = 32, edgeSize = 32, 
  insets = { left = 11, right = 12, top = 12, bottom = 11 }
})
-- end DMAMorphFrame

if DMA.Debug then
	print("DMAMorphFrame OK")
end

-- Collection
DMAMorphFrame.Collection = CreateFrame("Button",nil,DMAMorphFrame, "UIPanelButtonTemplate")
DMAMorphFrame.Collection:SetSize(120,30)
DMAMorphFrame.Collection:SetPoint("TOPLEFT",10,-10)
DMAMorphFrame.Collection:SetText("Collection")
DMAMorphFrame.Collection:SetScript("OnClick", function(self, Button, Down)
	OffsetModelID = 0
	ModelID = 0
	DisplayFavorites = false
	--
	NumberOfColumn = MaxNumberOfColumn
	DMAMorphFrame.Gallery:Load(true)
end)
-- end Collection

-- Favorites
DMAMorphFrame.Favorites = CreateFrame("Button",nil,DMAMorphFrame, "UIPanelButtonTemplate")
DMAMorphFrame.Favorites:SetSize(120,30)
DMAMorphFrame.Favorites:SetPoint("TOPLEFT",130,-10)
DMAMorphFrame.Favorites:SetText("Favorites")
DMAMorphFrame.Favorites:SetScript("OnClick", function(self, Button, Down)
	OffsetModelID = 0
	ModelID = 0
	DisplayFavorites = true
	GoBackDepth = 0
	DMAMorphFrame.Gallery:Load(true)
end)
-- end Favorites

-- ModelPreview
DMAMorphFrame.ModelPreview = CreateFrame("Frame",nil,DMAMorphFrame)
DMAMorphFrame.ModelPreview:SetScript("OnMouseDown", function(self, Button, Down)
	DMAMorphFrame.ModelPreview:Hide()
end)
DMAMorphFrame.ModelPreview:SetFrameStrata("DIALOG")
DMAMorphFrame.ModelPreview:SetFrameLevel(5)
DMAMorphFrame.ModelPreview:SetBackdrop( { 
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  insets = { left = 11, right = 12, top = 12, bottom = 11 }
})
DMAMorphFrame.ModelPreview:SetAllPoints()
--
DMAMorphFrame.ModelPreview.ModelFrame = CreateFrame("PlayerModel", nil, DMAMorphFrame.ModelPreview)
DMAMorphFrame.ModelPreview:Hide()
--
DMAMorphFrame.ModelPreview.FontString = DMAMorphFrame.ModelPreview.ModelFrame:CreateFontString(nil,nil,"GameFontNormal")
DMAMorphFrame.ModelPreview.FontString:SetPoint("TOP",0, 22)
--
DMAMorphFrame.ModelPreview.ModelFrame.DisplayInfo = 0
DMAMorphFrame.ModelPreview.ModelFrame:SetWidth(WindowWidth / 3) 
DMAMorphFrame.ModelPreview.ModelFrame:SetHeight(WindowHeight / 2)
DMAMorphFrame.ModelPreview.ModelFrame:SetPoint("CENTER",0,0)
DMAMorphFrame.ModelPreview.ModelFrame:SetBackdrop( { 
  bgFile = "Interface\\FrameGeneral\\UI-Background-Marble.PNG",
  insets={bottom=-50, top=-40, left=-20, right=-20}
})
--
DMAMorphFrame.ModelPreview.Favorite=DMAMorphFrame.ModelPreview.ModelFrame:CreateTexture(nil,"ARTWORK")
DMAMorphFrame.ModelPreview.Favorite:SetPoint("TOPLEFT",-20,30)
DMAMorphFrame.ModelPreview.Favorite:SetSize(40,40)
DMAMorphFrame.ModelPreview.Favorite:SetTexture("Interface\\Collections\\Collections")
DMAMorphFrame.ModelPreview.Favorite:SetTexCoord(0.18, 0.02, 0.18, 0.07, 0.23, 0.02, 0.23, 0.07)
--
DMAMorphFrame.ModelPreview.AddToFavorite = CreateFrame("Button",nil,DMAMorphFrame.ModelPreview.ModelFrame, "UIPanelButtonTemplate")
DMAMorphFrame.ModelPreview.AddToFavorite:SetSize(120,30)
DMAMorphFrame.ModelPreview.AddToFavorite:SetPoint("BOTTOMLEFT",-10,-40)
DMAMorphFrame.ModelPreview.AddToFavorite:SetText("Добавить в избранное")
DMAMorphFrame.ModelPreview.AddToFavorite:SetScript("OnClick", function(self, Button, Down)
	DMAFavMorphs.FavoriteList[DMAMorphFrame.ModelPreview.ModelFrame.DisplayInfo] = 1
	DMAMorphFrame.ModelPreview.AddToFavorite:Hide()
	DMAMorphFrame.ModelPreview.RemoveFavorite:Show()
	DMAMorphFrame.ModelPreview.Favorite:Show()
	ModelID = OffsetModelID
	DMAMorphFrame.Gallery:Load()
end)
--
DMAMorphFrame.ModelPreview.RemoveFavorite = CreateFrame("Button",nil,DMAMorphFrame.ModelPreview.ModelFrame, "UIPanelButtonTemplate")
DMAMorphFrame.ModelPreview.RemoveFavorite:SetSize(120,30)
DMAMorphFrame.ModelPreview.RemoveFavorite:SetPoint("BOTTOMLEFT",-10,-40)
DMAMorphFrame.ModelPreview.RemoveFavorite:SetText("Убрать")
DMAMorphFrame.ModelPreview.RemoveFavorite:SetScript("OnClick", function(self, Button, Down)
	DMAFavMorphs.FavoriteList[DMAMorphFrame.ModelPreview.ModelFrame.DisplayInfo] = nil
	DMAMorphFrame.ModelPreview.AddToFavorite:Show()
	DMAMorphFrame.ModelPreview.RemoveFavorite:Hide()
	DMAMorphFrame.ModelPreview.Favorite:Hide()
	ModelID = OffsetModelID
	DMAMorphFrame.Gallery:Load()
end)
--
DMAMorphFrame.ModelPreview.CopyID = CreateFrame("Button",nil,DMAMorphFrame.ModelPreview.ModelFrame, "UIPanelButtonTemplate")
DMAMorphFrame.ModelPreview.CopyID:SetSize(70,30)
DMAMorphFrame.ModelPreview.CopyID:SetPoint("BOTTOMLEFT",120,-40)
DMAMorphFrame.ModelPreview.CopyID:SetText("Скопировать ID")
DMAMorphFrame.ModelPreview.CopyID:SetScript("OnClick", function(self, Button, Down)
	ChatFrame1EditBox:Show()
	ChatFrame1EditBox:SetFocus()
	ChatFrame1EditBox:SetText(".morph "..DMAMorphFrame.ModelPreview.ModelFrame.DisplayInfo)
	ChatFrame1EditBox:HighlightText()
end)
-- end ModelPreview

-- TitleFrame
DMAMorphFrame.TitleFrame = CreateFrame("Frame", nil, DMAMorphFrame)
DMAMorphFrame.TitleFrame:SetSize(DMAMorphFrame:GetWidth(), 40)
DMAMorphFrame.TitleFrame:SetPoint("TOP")
DMAMorphFrame.TitleFrame.Background = DMAMorphFrame.TitleFrame:CreateTexture(nil,"BACKGROUND")
DMAMorphFrame.TitleFrame.Background:SetColorTexture(1,0,0,0)
DMAMorphFrame.TitleFrame.Background:SetAllPoints(DMAMorphFrame.TitleFrame)
DMAMorphFrame.TitleFrame.FontString = DMAMorphFrame.TitleFrame:CreateFontString(nil,nil,"GameFontNormal")
DMAMorphFrame.TitleFrame.FontString:SetText("Taku Morph Catalog")
DMAMorphFrame.TitleFrame.FontString:SetAllPoints(DMAMorphFrame.TitleFrame)
DMAMorphFrame.TitleFrame.CloseButton = CreateFrame("Button", nil, DMAMorphFrame.TitleFrame, "UIPanelCloseButton")
DMAMorphFrame.TitleFrame.CloseButton:SetPoint("RIGHT", -3, 0)
DMAMorphFrame.TitleFrame.CloseButton:SetScript("OnClick", function(self, Button, Down)
	DMAMorphFrame:Hide()
end)
DMAMorphFrame.TitleFrame:SetScript("OnMouseDown", function(self, Button)
	DMAMorphFrame:StartMoving()
end)
DMAMorphFrame.TitleFrame:SetScript("OnMouseUp", function(self, Button)
	DMAMorphFrame:StopMovingOrSizing()
end)
-- end TitleFrame

--[[local ResizeFrame = CreateFrame("Button", nil, DMAMorphFrame)
ResizeFrame:SetSize(20,20)
ResizeFrame.Texture = ResizeFrame:CreateTexture(nil,"ARTWORK")
ResizeFrame.Texture:SetTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
ResizeFrame.Texture:SetAllPoints(ResizeFrame)
ResizeFrame:SetPoint("BOTTOMRIGHT", -10, 10)
ResizeFrame:SetScript("OnMouseDown", function(self, Button)
	DMAMorphFrame:StartSizing("BOTTOMRIGHT")
end)
ResizeFrame:SetScript("OnMouseUp", function(self, Button)
	DMAMorphFrame:StopMovingOrSizing()
end)--]]

--[[DMAMorphFrame:SetScript("OnSizeChanged", function(self, Width, Height)
	WindowWidth = Width
	WindowHeight = Height
	DMAMorphFrame.Gallery:Load()
	TitleFrame:SetSize(DMAMorphFrame:GetWidth(), 40)
	TitleFrame:SetPoint("TOP")
	DMAMorphFrame.PageController:SetSize(DMAMorphFrame:GetWidth(), 75)
	DMAMorphFrame.PageController:SetPoint("BOTTOM")
end)--]]

-- PageController
DMAMorphFrame.PageController = CreateFrame("Frame", nil, DMAMorphFrame)
DMAMorphFrame.PageController:SetSize(DMAMorphFrame:GetWidth(), 75)
DMAMorphFrame.PageController:SetPoint("BOTTOM")
DMAMorphFrame.PageController.FontString = DMAMorphFrame.PageController:CreateFontString(nil,nil,"GameFontWhite")
DMAMorphFrame.PageController.FontString:SetAllPoints(DMAMorphFrame.PageController)

function DMAMorphFrame.PageController:UpdateButtons()
	if (ModelID >= MaxModelID) then
		DMAMorphFrame.NextPageButton:SetBackdrop( { 
		  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled", 
		  insets = { left = 4, right = 4, top = 4, bottom = 4 }
		})
	else
		DMAMorphFrame.NextPageButton:SetBackdrop( { 
		  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up", 
		  insets = { left = 4, right = 4, top = 4, bottom = 4 }
		})
	end
	if (GoBackDepth == 0) then
		DMAMorphFrame.PreviousPageButton:SetBackdrop( { 
		  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled", 
		  insets = { left = 4, right = 4, top = 4, bottom = 4 }
		})
	else
		DMAMorphFrame.PreviousPageButton:SetBackdrop( { 
		  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up", 
		  insets = { left = 4, right = 4, top = 4, bottom = 4 }
		})
	end	
end

-- end PageController

-- NextPageButton
DMAMorphFrame.NextPageButton = CreateFrame("Button", nil, DMAMorphFrame.PageController)
--
DMAMorphFrame.NextPageButton:SetSize(45, 45)
DMAMorphFrame.NextPageButton:SetPoint("Center",100,0)
DMAMorphFrame.NextPageButton:SetBackdrop( { 
  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up", 
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
--
DMAMorphFrame.NextPageButton.HoverGlow = DMAMorphFrame.NextPageButton:CreateTexture(nil,"BACKGROUND")
DMAMorphFrame.NextPageButton.HoverGlow:SetTexture("Interface\\Buttons\\CheckButtonGlow")
DMAMorphFrame.NextPageButton.HoverGlow:SetAllPoints(DMAMorphFrame.NextPageButton)
DMAMorphFrame.NextPageButton.HoverGlow:SetAlpha(0)
--
DMAMorphFrame.NextPageButton:SetScript("OnEnter", function()
	if (ModelID < MaxModelID) then
		DMAMorphFrame.NextPageButton.HoverGlow:SetAlpha(1)
	end
end);
--
DMAMorphFrame.NextPageButton:SetScript("OnLeave", function()
	DMAMorphFrame.NextPageButton.HoverGlow:SetAlpha(0)
end);
--
DMAMorphFrame.NextPageButton:SetScript("OnClick", function(self, Button, Down)
	if (ModelID >= MaxModelID) then
		return
	end
	OffsetModelID = ModelID
	--
	GoBackStack[GoBackDepth] = {LastMaxModelID=LastMaxModelID, Zoom=NumberOfColumn}
	GoBackDepth = GoBackDepth + 1
	--
	DMAMorphFrame.Gallery:Load()
	--
end)
-- end NextPageButton

-- GoToEditBox
DMAMorphFrame.GoToEditBox = CreateFrame('EditBox', nil, DMAMorphFrame.PageController, "InputBoxTemplate")
--
DMAMorphFrame.GoToEditBox.FontString = DMAMorphFrame.GoToEditBox:CreateFontString(nil,nil,"GameFontWhite")
DMAMorphFrame.GoToEditBox.FontString:SetPoint("LEFT", -50, 0)
DMAMorphFrame.GoToEditBox.FontString:SetText("Go to :")
--
DMAMorphFrame.GoToEditBox:SetPoint("LEFT", 150, 0)
DMAMorphFrame.GoToEditBox:SetMultiLine(false)
DMAMorphFrame.GoToEditBox:SetAutoFocus(false)
DMAMorphFrame.GoToEditBox:EnableMouse(true)
DMAMorphFrame.GoToEditBox:SetMaxLetters(5)
--[[DMAMorphFrame.GoToEditBox:SetTextColor(0,0,0,1)--]]
DMAMorphFrame.GoToEditBox:SetTextInsets(0,0,0,0)
DMAMorphFrame.GoToEditBox:SetFont('Fonts\\ARIALN.ttf', 12, '')	
DMAMorphFrame.GoToEditBox:SetWidth(70)
DMAMorphFrame.GoToEditBox:SetHeight(20)
DMAMorphFrame.GoToEditBox:SetScript('OnEscapePressed', function() DMAMorphFrame.GoToEditBox:ClearFocus() end)
DMAMorphFrame.GoToEditBox:SetScript('OnEnterPressed', function()
	DMAMorphFrame.GoToEditBox:ClearFocus()
	--
	OffsetModelID = tonumber(DMAMorphFrame.GoToEditBox:GetText())
	if OffsetModelID >= MaxModelID then
		OffsetModelID = MaxModelID
	end
	NumberOfColumn = MaxNumberOfColumn
	ModelID = OffsetModelID
	DMAMorphFrame.Gallery:Load(true)
end)
-- end GoToEditBox

-- PreviousPageButton
DMAMorphFrame.PreviousPageButton = CreateFrame("Button", nil, DMAMorphFrame.PageController)
DMAMorphFrame.PreviousPageButton:SetSize(45, 45)
DMAMorphFrame.PreviousPageButton:SetPoint("Center",-100,0)
DMAMorphFrame.PreviousPageButton:SetBackdrop( { 
  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled", 
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
DMAMorphFrame.PreviousPageButton.HoverGlow = DMAMorphFrame.PreviousPageButton:CreateTexture(nil,"BACKGROUND")
DMAMorphFrame.PreviousPageButton.HoverGlow:SetTexture("Interface\\Buttons\\CheckButtonGlow")
DMAMorphFrame.PreviousPageButton.HoverGlow:SetAllPoints(DMAMorphFrame.PreviousPageButton)
DMAMorphFrame.PreviousPageButton.HoverGlow:SetAlpha(0)
DMAMorphFrame.PreviousPageButton:SetScript("OnEnter", function()
	if (GoBackDepth > 0) then
		DMAMorphFrame.PreviousPageButton.HoverGlow:SetAlpha(1)
	end
end);
DMAMorphFrame.PreviousPageButton:SetScript("OnLeave", function()
	DMAMorphFrame.PreviousPageButton.HoverGlow:SetAlpha(0)
end);
DMAMorphFrame.PreviousPageButton:SetScript("OnClick", function(self, Button, Down)
	OffsetModelID = GoBackStack[GoBackDepth - 1].LastMaxModelID
	--
	ModelID = OffsetModelID
	NumberOfColumn = MaxNumberOfColumn
	DMAMorphFrame.Gallery:Load(true)
	--
	ModelID = OffsetModelID
	NumberOfColumn = GoBackStack[GoBackDepth - 1].Zoom
	GoBackStack[GoBackDepth - 1] = nil
	GoBackDepth = GoBackDepth - 1
	DMAMorphFrame.Gallery:Load()
	--
end)
-- end PreviousPageButton

-- Gallery
DMAMorphFrame.Gallery = CreateFrame("Frame", nil, DMAMorphFrame)
DMAMorphFrame.Gallery:SetPoint("TOP", 0, -50)
DMAMorphFrame.Gallery:SetScript("OnMouseWheel", function(self, delta)
	NewNumberOfColumn = NumberOfColumn
	if (delta < 0) then
		if (NumberOfColumn == MaxNumberOfColumn) then
			return
		end
		NewNumberOfColumn = NumberOfColumn * 2
		-- pop all inferior zoom from gobackstack
		Depth = GoBackDepth - 1
		while Depth > 0 and GoBackStack[Depth].Zoom < NumberOfColumn do
			GoBackStack[Depth] = nil
			Depth = Depth - 1
			GoBackDepth = GoBackDepth - 1
		end
	else
		if (NumberOfColumn == MinNumberOfColumn) then
			return 
		end
		NewNumberOfColumn = NumberOfColumn / 2
	end
	ModelID = OffsetModelID
	NumberOfColumn = NewNumberOfColumn
	DMAMorphFrame.Gallery:Load()
end)

function DMAMorphFrame.Gallery:Load(Reset)
	if DMA.Debug then
		print("--- TakuMorphFrame.Gallery:Load ---")
		print("ModelID .. " .. ModelID)
		print("LastMaxModelID .. " .. LastMaxModelID)
		print("OffsetModelID .. " .. OffsetModelID)
	end
	DMAMorphFrame.Gallery:SetSize(DMAMorphFrame:GetWidth() - 50, DMAMorphFrame:GetHeight() - 125)
	local ColumnWidth = DMAMorphFrame.Gallery:GetWidth() / NumberOfColumn
	local MaxNumberOfRowsOnSinglePage = floor(DMAMorphFrame.Gallery:GetHeight() / ColumnWidth)
	LastMaxModelID = ModelID
	ModelID = OffsetModelID
	local CellIndex = 0
	while CellIndex < NumberOfColumn * MaxNumberOfRowsOnSinglePage do
		OffsetX = CellIndex % NumberOfColumn 
		OffsetY = floor(CellIndex / NumberOfColumn)
		if (OffsetY == MaxNumberOfRowsOnSinglePage) then
			break
		end
		local bNewWidget = (Cells[CellIndex] == nil)
		if bNewWidget then
			Cells[CellIndex] = CreateFrame("Button", nil, DMAMorphFrame.Gallery)
			Cells[CellIndex].Favorite=Cells[CellIndex]:CreateTexture(nil,"ARTWORK")
			Cells[CellIndex].Favorite:SetPoint("TOPLEFT",-5,0)
			Cells[CellIndex].Favorite:SetSize(20,20)
			Cells[CellIndex].Favorite:SetTexture("Interface\\Collections\\Collections")
			Cells[CellIndex].Favorite:SetTexCoord(0.18, 0.02, 0.18, 0.07, 0.23, 0.02, 0.23, 0.07)
			Cells[CellIndex]:SetFrameStrata("DIALOG")
			Cells[CellIndex].HighlightBackground = Cells[CellIndex]:CreateTexture(nil,"BACKGROUND")
			Cells[CellIndex].HighlightBackground:SetColorTexture(1,1,1,0.5)
			Cells[CellIndex].HighlightBackground:SetAllPoints(Cells[CellIndex])
			Cells[CellIndex]:SetHighlightTexture(Cells[CellIndex].HighlightBackground)
			Cells[CellIndex]:RegisterForClicks("AnyUp")
			Cells[CellIndex].ModelFrame = CreateFrame("PlayerModel", nil, Cells[CellIndex])
			Cells[CellIndex]:SetScript("OnClick", function(self, Button, Down)
				DMAMorphFrame.ModelPreview.ModelFrame:SetDisplayInfo(self.ModelFrame.DisplayInfo)
				DMAMorphFrame.ModelPreview.ModelFrame.DisplayInfo = self.ModelFrame.DisplayInfo
				DMAMorphFrame.ModelPreview.FontString:SetText(DMAMorphFrame.ModelPreview.ModelFrame.DisplayInfo)
				if DMAFavMorphs.FavoriteList[DMAMorphFrame.ModelPreview.ModelFrame.DisplayInfo] then
					DMAMorphFrame.ModelPreview.Favorite:Show()
					DMAMorphFrame.ModelPreview.AddToFavorite:Hide()
					DMAMorphFrame.ModelPreview.RemoveFavorite:Show()
				else
					DMAMorphFrame.ModelPreview.Favorite:Hide()
					DMAMorphFrame.ModelPreview.AddToFavorite:Show()
					DMAMorphFrame.ModelPreview.RemoveFavorite:Hide()
				end
				DMAMorphFrame.ModelPreview:Show()
			end)
		end
		-- always do
		Cells[CellIndex]:Show()
		if bNewWidget or Cells[CellIndex].ModelFrame.DisplayInfo < ModelID or Reset then
			Cells[CellIndex].ModelFrame:SetDisplayInfo(2418)
			BlankModelFileID = Cells[CellIndex].ModelFrame:GetModelFileID()
			if (DisplayFavorites) then
				while ModelID <= MaxModelID do
					if (DMAFavMorphs.FavoriteList[ModelID]) then
						Cells[CellIndex].ModelFrame:SetDisplayInfo(ModelID)
						ModelID = ModelID + 1
						break
					end
					ModelID = ModelID + 1
				end
			else
				while ModelID <= MaxModelID do
					Cells[CellIndex].ModelFrame:SetDisplayInfo(ModelID)
					ModelID = ModelID + 1
					if Cells[CellIndex].ModelFrame:GetModelFileID() ~= nil and Cells[CellIndex].ModelFrame:GetModelFileID() ~= BlankModelFileID then
						break
					end
				end
			end
			Cells[CellIndex].ModelFrame.DisplayInfo = ModelID - 1
		else
			ModelID = Cells[CellIndex].ModelFrame.DisplayInfo + 1
		end
		if (Cells[CellIndex].ModelFrame.DisplayInfo == MaxModelID) then
			Cells[CellIndex]:Hide()
		end
		Cells[CellIndex]:SetWidth(ColumnWidth)
		Cells[CellIndex]:SetHeight(ColumnWidth)
		Cells[CellIndex]:SetPoint("TOPLEFT",OffsetX * ColumnWidth,OffsetY * -ColumnWidth)
		if (DMAFavMorphs.FavoriteList[Cells[CellIndex].ModelFrame.DisplayInfo]) then
			Cells[CellIndex].Favorite:Show()
		else
			Cells[CellIndex].Favorite:Hide()
		end
		Cells[CellIndex].ModelFrame:SetAllPoints()
		CellIndex = CellIndex + 1
	end --while
	while Cells[CellIndex] ~= nil do
		Cells[CellIndex]:Hide()
		CellIndex = CellIndex + 1
	end
	--
	DMAMorphFrame.PageController.FontString:SetText(LastMaxModelID .. " - " .. ModelID - 1)
	DMAMorphFrame.PageController:UpdateButtons()
end
-- end Gallery

if DMA.Debug then
	print("ModelFrames OK")
end

function DMA:ProcessDMAMorph()
	if DMAMorphFrame:IsShown() then
		DMAMorphFrame:Hide()
	else
		DMAMorphFrame:Show()
	end
end

-- slash commands
SLASH_DMAMORPHCATALOG1 = '/darkmoonmorph'
function SlashCmdList.DMAMORPHCATALOG()
	DMAMorphFrame:Show()
	ModelID=LastMaxModelID
	DMAMorphFrame.Gallery:Load()
end