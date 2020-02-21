function DMA:ProcessDMAGobjectList(chatstring)
	local entryid = strsub(chatstring, string.find(chatstring, "_entry:")+7, string.find(chatstring, "|h")-1);
	local entryname = strsub(chatstring, string.find(chatstring, "|h")+3, string.find(chatstring, "|h|r")-2);
	table.insert(DMA.GOB.ObjectList.Data, {DMA.GOB.Counter, entryid, entryname});
  table.insert(DMA.GOB.ObjectList.ToShow, {DMA.GOB.Counter, entryid, entryname});
	DMA.GOB.Counter = DMA.GOB.Counter + 1;
end

function DMA:GenerateObjectsScrollMenu()
  FauxScrollFrame_Update(DMA_MiniMenuContentGameobjectObjectSearchSceneScrollBar,#DMA.GOB.ObjectList.ToShow,13,32);

  for jBtn=1, 13 do
    lineplusoffset = jBtn + FauxScrollFrame_GetOffset(DMA_MiniMenuContentGameobjectObjectSearchSceneScrollBar);
    DMA.lineplusoffset[jBtn] = tonumber(lineplusoffset);
  end

  DMA:ObjectsScrollBar_Update();
end

function DMA:ObjectsScrollBar_Update()
  if DMA.GOB.ObjectListInitialized then
      for line=1,#DMA.lineplusoffset do
          local lineplusoffset = DMA.lineplusoffset[line];
          if (lineplusoffset <= #DMA.GOB.ObjectList.ToShow) then
              _G["DMA_MiniMenuContentGameobjectObjectSearchSceneGOB"..line.."Number"]:SetText("|cFFFD8A00" .. lineplusoffset .. "|r");
              _G["DMA_MiniMenuContentGameobjectObjectSearchSceneGOB"..line.."Name"]:SetText(DMA.GOB.ObjectList.ToShow[lineplusoffset][3]);
              _G["DMA_MiniMenuContentGameobjectObjectSearchSceneGOB"..line]:Show();
          else
              _G["DMA_MiniMenuContentGameobjectObjectSearchSceneGOB"..line]:Hide();
          end
      end
  end
end

function DMA:ProcessDMAGOBSpawn(chatstring)
  DMASave = chatstring;
  DMAUserVars["LastGOB-X"], DMAUserVars["LastGOB-Y"], DMAUserVars["LastGOB-Z"] = string.match(chatstring, "addgoxyz:([0-9 -]+.%d+).([0-9 -]+.%d+).([0-9 -]+.%d+)|h");
  DMAUserVars["LastGOB-GUID"] = string.match(chatstring, "|cff008c7f|Haddgoguidgo:(%d+)|h");
  DMAUserVars["LastGOB-ID"] = string.match(chatstring, "|cff008c7f|Haddgoid:(%d+)|h");
  DMA:UpdateGOBEditBox();
end