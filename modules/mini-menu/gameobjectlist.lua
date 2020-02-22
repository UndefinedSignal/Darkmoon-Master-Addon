function DMA:ProcessDMAGobjectList(chatstring)
  DMASave = chatstring;
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
  DMAGOBButtons = {};
  if DMA.GOB.ObjectListInitialized then
      for line=1,#DMA.lineplusoffset do
          local lineplusoffset = DMA.lineplusoffset[line];
          if (lineplusoffset <= #DMA.GOB.ObjectList.ToShow) then
              table.insert(DMAGOBButtons, {DMA.GOB.ObjectList.ToShow[lineplusoffset][3], DMA.GOB.ObjectList.ToShow[lineplusoffset][2]});
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
  DMAUserVars["LastGOB-X"], DMAUserVars["LastGOB-Y"], DMAUserVars["LastGOB-Z"] = string.match(chatstring, "addgoxyz:([0-9 -]+.%d+).([0-9 -]+.%d+).([0-9 -]+.%d+)|h");
  DMAUserVars["LastGOB-GUID"] = string.match(chatstring, "|cff008c7f|Haddgoguidgo:(%d+)|h");
  DMAUserVars["LastGOB-ID"] = string.match(chatstring, "|cff008c7f|Haddgoid:(%d+)|h");
  DMA:UpdateGOBEditBox();
end

function DMA:ProcessDMAGOBTargetGUIDID(chatstring)
  DMAUserVars["LastGOB-GUID"], DMAUserVars["LastGOB-ID"] = string.match(chatstring, "GUID: (%d+) ID: (%d+)");
  DMA:UpdateGOBEditBox();
end

function DMA:ProcessDMAGOBTargetXYZ(chatstring)
  DMAUserVars["LastGOB-X"], DMAUserVars["LastGOB-Y"], DMAUserVars["LastGOB-Z"] = string.match(chatstring, " X: ([0-9 -]+.%d+).+Y: ([0-9 -]+.%d+).+Z: ([0-9 -]+.%d+)");
  DMA:UpdateGOBEditBox();
end

function DMA:SetGOBScale()
  local msg = ".gob set scale "..DMAUserVars["LastGOB-GUID"].." "..DMAUserVars["LastGOB-SCALE"];
  SendChatMessage(msg, "WHISPER", nil, GetUnitName("PLAYER"));
  DMA:UpdateGOBParameters();
end

--.gob turn guid oz oy ox
function DMA:SetGOBManipulation()
  local msg = ".gob turn "..DMAUserVars["LastGOB-GUID"].." "..DMAUserVars["LastGOB-OZ"].." "..DMAUserVars["LastGOB-OY"].." "..DMAUserVars["LastGOB-OX"];
  SendChatMessage(msg, "WHISPER", nil, GetUnitName("PLAYER"));
  DMA:UpdateGOBParameters();
end

function DMA:UpdateGOBParameters()
  DMA_GOBScaleSliderCounter:SetText(tonumber(string.format("%.2f", DMAUserVars["LastGOB-SCALE"])));
  DMA_GOBRotateSlider_OXCounter:SetText(tonumber(string.format("%.2f", DMAUserVars["LastGOB-OX"])));
  DMA_GOBRotateSlider_OYCounter:SetText(tonumber(string.format("%.2f", DMAUserVars["LastGOB-OY"])));
  DMA_GOBRotateSlider_OZCounter:SetText(tonumber(string.format("%.2f", DMAUserVars["LastGOB-OZ"])));
  DMA_GOBScaleSlider:SetValue(DMAUserVars["LastGOB-SCALE"]);
  DMA_GOBRotateSlider_OX:SetValue(DMAUserVars["LastGOB-OX"]);
  DMA_GOBRotateSlider_OY:SetValue(DMAUserVars["LastGOB-OY"]);
  DMA_GOBRotateSlider_OZ:SetValue(DMAUserVars["LastGOB-OZ"]);
end