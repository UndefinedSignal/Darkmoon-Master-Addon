SLASH_DMA1 = '/dma'

function DMA:ProcessDmaMenu(button)
	if button == nil then
		button = "LeftButton";
	end
	if DMA_MiniMenu:IsShown() then
		DMA_MiniMenu:Hide();
	else
		DMA_MiniMenu:Show();
	end
end

SlashCmdList["DMA"] = function(msg)
	DMA:ProcessDmaMenu();
end 