function DMA:AddMinimapIcon()
	LDBObject = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("DMA", {
		type = "data source",
		icon = "Interface\\AddOns\\DMA\\Resources\\IMG\\dma.tga",
		tocname = "dma",
		OnClick = function(_, button)
			DMA:ProcessDmaMenu(button);
		end,
		OnTooltipShow = function(tooltip)
			tooltip:AddLine("|cffCD661DDarkmoon Master Addon|r");
			tooltip:AddLine("|cffffcc00ПКМ\\ЛКМ: |cffFFC125открыть\\закрыть меню|r");
		end,
	})

	if (DMAIconData == nil) then
		DMAIconData = { hide = false }	
	end

	icon = LibStub("LibDBIcon-1.0");
	icon:Register("DMAIcon", LDBObject, DMAIconData);
	icon:Show("DMAIcon");
end