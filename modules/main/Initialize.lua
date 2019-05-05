MAJOR_VERSION = "Darkmoon Master Addon |cFF38FE62Legion|r v0.9.5"
MINOR_VERSION = "$Revision: 3 $"
ROOT_PATH     = "Interface\\AddOns\\DMA\\"

DMA = LibStub("AceAddon-3.0"):NewAddon("DMA", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
DMA.Linkifier = DMA;
DMA.User = {};

if DMAUserBackgroundAlpha == nil then
	DMAUserBackgroundAlpha = 1;
end

function DMA:OnEnable()
	DMA:AlphaSlider();
	DMA:BackGroundAlphaInitialize();
end
