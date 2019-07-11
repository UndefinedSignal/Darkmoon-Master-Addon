SLASH_DMA1 = '/dma'

SlashCmdList["DMA"] = function(msg)
	if DMA_MiniMenu:IsShown() then
		DMA_MiniMenu:Hide();
	else
		DMA_MiniMenu:Show();
	end
end 