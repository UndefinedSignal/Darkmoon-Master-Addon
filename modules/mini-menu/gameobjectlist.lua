function DMA:ProcessDMAGobjectList(chatstring)
	local entryid = strsub(chatstring, string.find(chatstring, "_entry:")+7, string.find(chatstring, "|h")-1);
	local entryname = strsub(chatstring, string.find(chatstring, "|h")+3, string.find(chatstring, "|h|r")-2);
	table.insert(DMA.GObjectList, {DMA.GOBCounter, entryid, entryname});
	DMA.GOBCounter = DMA.GOBCounter + 1;
end

function DMA:GenerateObjectsScrollMenu()
  FauxScrollFrame_Update(DMA_MiniMenuContentGameobjectObjectSceneScrollBar,#DMA.GObjectList,13,32);

  for jBtn=1, 13 do
    lineplusoffset = jBtn + FauxScrollFrame_GetOffset(DMA_MiniMenuContentGameobjectObjectSceneScrollBar);
    DMA.lineplusoffset[jBtn] = tonumber(lineplusoffset)
  end

  DMA:ObjectsScrollBar_Update()
end

function DMA:ObjectsScrollBar_Update()
    if DMA.GObjectListInitialized then
        for line=1,#DMA.lineplusoffset do
            local lineplusoffset = DMA.lineplusoffset[line];
            if lineplusoffset <= #DMA.GObjectList then
                _G["DMA_MiniMenuContentGameobjectObjectSceneGOB"..line.."Number"]:SetText("|cFFFD8A00" .. DMA.GObjectList[lineplusoffset][1] .. "|r");
                _G["DMA_MiniMenuContentGameobjectObjectSceneGOB"..line.."Name"]:SetText(DMA.GObjectList[lineplusoffset][3]);
                _G["DMA_MiniMenuContentGameobjectObjectSceneGOB"..line]:Show();
            else
                _G["DMA_MiniMenuContentGameobjectObjectSceneGOB"..line]:Hide();
            end
        end
    end
end