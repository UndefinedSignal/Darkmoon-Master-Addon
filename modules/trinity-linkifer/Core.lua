--[[
          \.   \.      __,-"-.__      ./   ./
       \.   \`.  \`.-'"" _,="=._ ""`-.'/  .'/   ./
       \`.  \_`-''      _,="=._      ``-'_/  .'/
        \ `-',-._   _.  _,="=._  ,_   _.-,`-' /
      \. /`,-',-._"""  \ _,="=._ /  """_.-,`-,'\ ./
       \`-'  /   `-._  "       "  _.-'   \  `-'/
       /)   (        \   ,-.   /        )   (\
   ,-'"    `-.       \  /   \  /       .-'    "`-,
  ,'_._        `-.____/ /  _  \ \____.-'        _._`,
 /,'   `.              \_/ \_/              .'   `,\
/'       )                _        TestUnit (       `\
       /   _,-'"`-.  ,++|T|||T|++.  .-'"`-,_   \
       / ,-'       \/|`|`|`|'|'|'|\/       `-, \
      /,'            | | | | | | |            `,\
    /'              ` | | | | | '              `\
                     ` | | | '
                        ` | '
]]--

-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- DMA.Linkifier is a derivative of TrinityAdmin.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official Forums: http://groups.google.com/group/trinityadmin
-- GoogleCode Website: http://code.google.com/p/trinityadmin/
-- Subversion Repository: http://trinityadmin.googlecode.com/svn/
-- Dev Blog: http://trinityadmin.blogspot.com/
-------------------------------------------------------------------------------------------------------------

local cWorking = 0
local cMap = 0
local cX = 0
local cY = 0
local cZ = 0
local incX = 0
local incY = 0
local incZ = 0
local fID = 0
local gettingGOBinfo=0
local gettingGOBinfoinfo=0

local cont = ""
--if not LibStub then error(MAJOR_VERSION .. " requires LibStub") end

-- Register Translations
--Locale:EnableDynamicLocales(true)
--Locale:EnableDebugging()
--Locale:RegisterTranslations("enUS", function() return Return_enUS() end)
--Locale:RegisterTranslations("ruRU", function() return Return_ruRU() end)
--Strings:EnableDynamicLocales(true)
--Strings:RegisterTranslations("enUS", function() return ReturnStrings_enUS() end)
--Strings:RegisterTranslations("ruRU", function() return ReturnStrings_ruRU() end)
--Locale:Debug()
--Locale:SetLocale("ruRU")


local defaults = {
  char = {
   functionQueue = {},
   msgDeltaTime = time(),  
  },
  profile = {
      style = {
       showtooltips = false,
       showchat = false,
       color = {
         buffer = {},
         buttons = {
          r = 0.99, 
          g = 0.99, 
          b = 0.99
         },
         frames = {
          r = 0.102,
          g = 0.102,
          b = 0.102
         },
         backgrounds = {
          r = 0.10,
          g = 0.10,
          b = 0.10
         },
         linkifier = {
          r = 0.00,
          g = 0.55,
          b = 0.50
         }
       }
      }
   }
}

Locale       = LibStub("AceLocale-3.0"):NewLocale("DMA.Linkifier", "ruRU");
Locale       = Return_enUS();

Strings      = LibStub("AceLocale-3.0"):NewLocale("TEST", "ruRU");


function DMA.Linkifier:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("DMA.LinkifierDB", defaults)
  if (IsAddOnLoaded("Prat-3.0")) then
    Strings    = ReturnPratStrings_enUS();
  else
    Strings    = ReturnStrings_enUS();
  end

   for i=1,NUM_CHAT_WINDOWS do
      local cf = getglobal("ChatFrame"..i)
      self:RawHook(cf, "AddMessage", true)
   end

   --clear color buffer
   self.db.profile.style.color.buffer = {}
   --altering the function setitemref, to make it possible to click links
   MangLinkifier_SetItemRef_Original = SetItemRef
   SetItemRef = MangLinkifier_SetItemRef
end

function DMA.Linkifier:AddMessage(frame, text, r, g, b, id)
  -- frame is the object that was hooked (one of the ChatFrames)  
  local catchedSth = false
  local output = false
  if id == 1 then --make sure that the message comes from the server, message id = 1

--***************************************************************   
   -- hook .gps for gridnavigation
   for x, y in string.gmatch(text, Strings["ma_GmatchGPS"]) do
      for k,v in pairs(self.db.char.functionQueue) do
       if v == "GridNavigate" then
         GridNavigate(string.format("%.1f", x), string.format("%.1f", y), nil)
         table.remove(self.db.char.functionQueue, k)
         break
       end
      end
   end

   if DMA.Linkifier:ID_Setting_Start_Read() then   
       local b1,e1,pattern = string.find(text, "GUID: (%d+)%.")
       --local b1,e1,pattern = string.find(text, "GUID:")
       if b1 then
          b1,e1,pattern = string.find(text, "([0-9]+)")
          if b1 then
              DMA.Linkifier:ID_Setting_Start_Write(0)
              
              DMA.Linkifier:ID_Setting_Write(0,pattern)
              --ma_NPC_guidbutton:SetText(pattern)
              --self:LogAction("NPC_GUID_Get id "..pattern..".")
          end	
       end
   
       b1,e1,pattern = string.find(text, "Entry: (%d+)%.")
       if b1 then
          b1,e1,pattern = string.find(text, "([0-9]+)")
          if b1 then
              
              DMA.Linkifier:ID_Setting_Write(1,pattern)
              --ma_NPC_idbutton:SetText(pattern)
              --self:LogAction("NPC_EntryID_Get id "..pattern..".")
          end	
       end
   
       b1,e1,pattern = string.find(text, "DisplayID: (%d+).*")
       if b1 then
          b1,e1,pattern = string.find(text, "([0-9]+)")
          if b1 then
              
              --DMA.Linkifier:ID_Setting_Write(1,pattern)
              --ma_npcdisplayid:SetText(pattern)
              --self:LogAction("NPC_DisplayID_Get id "..pattern..".")
          end	
       end
   
   end

   if DMA.Linkifier:OID_Setting_Start_Read() then   
       local b1,e1,pattern = string.find(text, "GUID: (%d+) ")
       --local b1,e1,pattern = string.find(text, "GUID:")
       if b1 then
          b1,e1,pattern = string.find(text, "([0-9]+)")
          if b1 then
              DMA.Linkifier:OID_Setting_Start_Write(0)
              DMA.Linkifier:OID_Setting_Write(0,pattern)
              --ma_Obj_guidbutton:SetText(pattern)
              --self:LogAction("OBJECT_GUID_Get id "..pattern..".")
          end	
       end
       
       --b1,e1,pattern = string.find(text, "ID: (%d+)% ")
       --b1,e1,pattern = string.find(text, "GUID: (%d+) ID: (%d+)")
       b1,e1,xpattern = string.find(text, " ID: (%d+)")
       if b1 then
          --b1,e1,pattern = string.find(text, "([0-9]+)")
          b1,e1,pattern = string.find(xpattern, "([0-9]+)")
          if b1 then
              
   --      		DMA.Linkifier:OID_Setting_Write(1,pattern)
              --ma_Obj_idbutton:SetText(pattern)
              --self:LogAction("OBJECT_EntryID_Get id "..pattern..".")
              
          end	
       end
   
       b1,e1,xpattern = string.find(text, "DisplayID: (%d+)")
       if b1 then
          --b1,e1,pattern = string.find(text, "([0-9]+)")
          b1,e1,pattern = string.find(xpattern, "([0-9]+)")
          if b1 then
   --      		DMA.Linkifier:OID_Setting_Write(1,pattern)
   --      		ma_Obj_idbutton:SetText(pattern)
              --ma_gobdisplayid:SetText(pattern)
              --self:LogAction("OBJECT DisplayID"..pattern..".")
          end	
       end
   end

   for diff in string.gmatch(text, Strings["ma_GmatchUpdateDiff"]) do
       --ma_difftext:SetText(diff)
       catchedSth = true
--       output = DMA.Linkifier.db.profile.style.showchat
       output = DMA.Linkifier.db.profile.style.showchat  
   end

   -- Check for possible UrlModification
   if catchedSth then
      if output == false then
      -- don't output anything
      elseif output == true then
         text = MangLinkifier_Decompose(text)
         if DMA.Linkifier.isShowing then
            self.hooks[frame].AddMessage(frame, text, r, g, b, id)
         end
      end
   else
      text = MangLinkifier_Decompose(text)
      if DMA.Linkifier.isShowing then
         self.hooks[frame].AddMessage(frame, text, r, g, b, id)
      end
   end
  else
      -- message is not from server
      --Linkifier should be used on non server messages as well to catch links suc as items in chat
      text = MangLinkifier_Decompose(text)
      -- Returns the message to the client, or else the chat frame never shows it
      self.hooks[frame].AddMessage(frame, text, r, g, b, id)
   end
end

function DMA.Linkifier:ChatMsg(msg, msgt, recipient)
  if not msgt then local msgt = "say" end
  if msgt == "addon" then
   if recipient then
      SendAddonMessage("", msg, "WHISPER", recipient)
   else
      SendAddonMessage("", msg, "GUILD")
   end
  else
   if recipient then 
      SendChatMessage(msg, "WHISPER", nil, recipient)
   else
      SendChatMessage(msg, msgt, nil, nil)
   end
  end
end

function DMA.Linkifier:AndBit(value, test) 
  return mod(value, test*2) >= test 
end

-- Как бы и не используется, но может быть полезным
function DMA.Linkifier:SendMailLinkifieril(recipient, subject, body)
  recipient = string.gsub(recipient, " ", "")
  subject = string.gsub(subject, " ", "")
  body = string.gsub(body, "\n", " ")
  subject = '"'..subject..'"'
  body = '"'..body..'"'
  self:ChatMsg(".send mail "..recipient.." "..subject.." "..body)
  --self:LogAction("Sent a mail to "..recipient..". Subject was: "..subject)
end

function DMA.Linkifier:UpdateMailBytesLeft()
   local bleft = 246 - strlen(ma_searcheditbox:GetText()) - strlen(ma_var1editbox:GetText()) - strlen(ma_maileditbox:GetText())
   if bleft >= 0 then
      ma_lookupresulttext:SetText(Locale["ma_MailBytesLeft"].."|cff00ff00"..bleft.."|r")
   else
      ma_lookupresulttext:SetText(Locale["ma_MailBytesLeft"].."|cffff0000"..bleft.."|r")
   end
end


local mang_ID_start = 0
local mang_ID_guid = ""
local mang_ID_entryid = ""
local mang_OID_start = 0
local mang_OID_guid = ""
local mang_OID_entryid = ""

function DMA.Linkifier:ID_Setting_Start_Read()
   return mang_ID_start
end  

function DMA.Linkifier:ID_Setting_Write(num,val)
   if num == 0 then
   -- GUID
      mang_ID_guid = val
   elseif num == 1 then
   -- ID
      mang_ID_entryid = val
   end

end

function DMA.Linkifier:ID_Setting_Read(num)
          
local val = "" 
          
   if num == 0 then
   -- GUID
      val = mang_ID_guid
   elseif num == 1 then
   -- ID
      val = mang_ID_entryid
   end
   
   return val
end

function DMA.Linkifier:OID_Setting_Start_Read()
   return mang_OID_start
end

function DMA.Linkifier:OID_Setting_Start_Write(num)
   mang_OID_start = num
end

function DMA.Linkifier:OID_Setting_Write(num,val)
   if num == 0 then
   -- GUID
      mang_OID_guid = val
   elseif num == 1 then
   -- ID
      mang_OID_entryid = val
   end
end

function DMA.Linkifier:OID_Setting_Read(num)
          
local val = "" 
          
   if num == 0 then
   -- GUID
      val = mang_OID_guid
   elseif num == 1 then
   -- ID
      val = mang_OID_entryid
   end
   
   return val
end