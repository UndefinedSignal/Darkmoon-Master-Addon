--[[
           \.   \.      __,-"-.__      ./   ./
       \.   \`.  \`.-'"" _,="=._ ""`-.'/  .'/   ./
        \`.  \_`-''      _,="=._      ``-'_/  .'/
         \ `-',-._   _.  _,="=._  ,_   _.-,`-' /
      \. /`,-',-._"""  \ _,="=._ /  """_.-,`-,'\ ./
       \`-'  /    `-._  "       "  _.-'    \  `-'/
       /)   (         \    ,-.    /         )   (\
    ,-'"     `-.       \  /   \  /       .-'     "`-,
  ,'_._         `-.____/ /  _  \ \____.-'         _._`,
 /,'   `.                \_/ \_/                .'   `,\
/'       )                  _         TestUnit (       `\
        /   _,-'"`-.  ,++|T|||T|++.  .-'"`-,_   \
       / ,-'        \/|`|`|`|'|'|'|\/        `-, \
      /,'             | | | | | | |             `,\
     /'               ` | | | | | '               `\
                        ` | | | '
                          ` | '
]]--

function DMA:AddMinimapIcon()
	--icon = "Interface\\AddOns\\DMA\\Resources\\IMG\\dma.tga"
	LDBObject = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("DMA", {
		type = "data source",
		icon = "Interface\\ICONS\\INV_AzeriteDebuff",
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