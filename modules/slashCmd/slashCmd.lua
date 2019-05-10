SLASH_DMAG1 = '/darkmoonadmin'
function SlashCmdList.DMA()
	if DMA_MiniMenu:IsShown() then
		DMA_MiniMenu:Hide();
	else
		DMA_MiniMenu:Show();
	end
end