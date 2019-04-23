-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- TrinityAdmin is a derivative of MangAdmin.
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

local genv = getfenv(0)
local Mang = genv.Mang
GPS = '.gps'
cWorking = 0
cMap = 0
cX = 0
cY = 0
cZ = 0
incX = 0
incY = 0
incZ = 0
fID = 0
gettingGOBinfo=0
gettingGOBinfoinfo=0

MAJOR_VERSION = "Darkmoon Master Addon |cFF38FE62Legion|r v0.9.5"
MINOR_VERSION = "$Revision: 3 $"
ROOT_PATH     = "Interface\\AddOns\\DMA\\"
local cont = ""
if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end
if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

MangAdmin    = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceDB-2.0", "AceHook-2.1", "AceDebug-2.0", "AceEvent-2.0")
Locale       = AceLibrary("AceLocale-2.2"):new("MangAdmin")
Strings      = AceLibrary("AceLocale-2.2"):new("TEST")
local Tablet = AceLibrary("Tablet-2.0")

MangAdmin:RegisterDB("MangAdminDb", "MangAdminDbPerChar")
MangAdmin:RegisterDefaults("char", 
  {
    functionQueue = {},
    requests = {
      tpinfo = false,
      ticket = false,
      ticketbody = 0,
      item = false,
      favitem = false,
      itemset = false,
      spell = false,
      skill = false,
      quest = false,
      creature = false,
      object = false,
      tele = false,
      toggle = false
    },
    nextGridWay = "ahead",
    selectedZone = nil,
    newTicketQueue = {},
    instantKillMode = false,
    msgDeltaTime = time(),
    
  }
)
MangAdmin:RegisterDefaults("account", 
  {
    language = nil,
    localesearchstring = true,
    favorites = {
      items = {},
      itemsets = {},
      spells = {},
      skills = {},
      quests = {},
      creatures = {},
      objects = {},
      teles = {}
    },
    buffer = {
      tickets = {},
      items = {},
      itemsets = {},
      spells = {},
      skills = {},
      quests = {},
      creatures = {},
      objects = {},
      teles = {},
      counter = 0
    },
    tickets = {
      selected = 0,
      count = 0,
      requested = 0,
      playerinfo = {},
      loading = false
    },
    style = {
      updatedelay = "4000",
      showtooltips = true,
      showchat = false,
      showminimenu = true,
      transparency = {
        buttons = 1.0,
        frames = 0.7,
        backgrounds = 0.5
      },
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
          r = 0.8705882352941177,
          g = 0.3725490196078432,
          b = 0.1411764705882353
        }
      }
    }
  }
)

-- Register Translations
Locale:EnableDynamicLocales(true)
--Locale:EnableDebugging()
Locale:RegisterTranslations("enUS", function() return Return_enUS() end)
Locale:RegisterTranslations("ruRU", function() return Return_ruRU() end)
Strings:EnableDynamicLocales(true)
Strings:RegisterTranslations("enUS", function() return ReturnStrings_enUS() end)
Strings:RegisterTranslations("ruRU", function() return ReturnStrings_ruRU() end)
--Locale:Debug()
--Locale:SetLocale("enUS")

MangAdmin.consoleOpts = {
  type = 'group',
  args = {
    toggle = {
      name = "toggle",
      desc = Locale["cmd_toggle"],
      type = 'execute',
      func = function() MangAdmin:OnClick() end
    },
    transparency = {
      name = "transparency",
      desc = Locale["cmd_transparency"],
      type = 'execute',
      func = function() MangAdmin:ToggleTransparency() end
    },
    tooltips = {
      name = "tooltips",
      desc = Locale["cmd_tooltip"],
      type = 'execute',
      func = function() MangAdmin:ToggleTooltips() end
    },
    minimenu = {
      name = "tooltips",
      desc = "Toogle the toolbar/minimenu",
      type = 'execute',
      func = function() MangAdmin:ToggleMinimenu() end
    }
  }
}

function MangAdmin:OnInitialize()
  -- initializing MangAdmin
  --self:CreateFrames()
  self:RegisterChatCommand(Locale["slashcmds"], self.consoleOpts) -- this registers the chat commands
  --self:InitButtons()  -- this prepares the actions and tooltips of nearly all MangAdmin buttons  
  --InitControls()
  --self:SearchReset()
  MangAdmin.db.account.buffer.who = {}
  -- FuBar plugin config
--[[  MangAdmin.hasNoColor = true
  MangAdmin.hasNoText = false
  MangAdmin.clickableTooltip = true
  MangAdmin.hasIcon = true
  MangAdmin.hideWithoutStandby = true
  MangAdmin:SetIcon(ROOT_PATH.."Textures\\icon.tga")
  -- make MangAdmin frames closable with escape key
  tinsert(UISpecialFrames,"ma_bgframe")
  tinsert(UISpecialFrames,"ma_popupframe")]]
  -- those all hook the AddMessage method of the chat frames.
  -- They will be redirected to MangAdmin:AddMessage(...)
  for i=1,NUM_CHAT_WINDOWS do
    local cf = getglobal("ChatFrame"..i)
    self:Hook(cf, "AddMessage", true)
  end
  --[[ initializing Frames, like DropDowns, Sliders, aso
  self:InitDropDowns()
  self:InitSliders()
  self:InitScrollFrames()
  self:InitCheckButtons()
  ma_gobmovedistforwardback:SetText("1")
  ma_gobmovedistleftright:SetText("1")
  ma_gobmovedistupdown:SetText("1")]]
  MangAdmin.db.account.buffer.who = {}
  --clear color buffer
  self.db.account.style.color.buffer = {}
  --altering the function setitemref, to make it possible to click links
  MangLinkifier_SetItemRef_Original = SetItemRef
  SetItemRef = MangLinkifier_SetItemRef
end

function MangAdmin:AddMessage(frame, text, r, g, b, id)
  -- frame is the object that was hooked (one of the ChatFrames)  
  local catchedSth = false
  local output = MangAdmin.db.account.style.showchat
  if id == 1 then --make sure that the message comes from the server, message id = 1
    --Catches if Toggle is still on for some reason, but search frame is not up, and disables it so messages arent caught
    if self.db.char.requests.toggle and not ma_popupframe:IsVisible() then
      self.db.char.requests.toggle = false
    end

--********************************************************************    
    if gettingGOBinfoinfo > 0 then
        if gettingGOBinfoinfo == 1 then
            ma_gobinfoinfo:SetText('')
            ma_gobinfoinfo:SetText(ma_gobinfoinfo:GetText()..text)
        else
            ma_gobinfoinfo:SetText(ma_gobinfoinfo:GetText().."\n"..text)
        end
        gettingGOBinfoinfo=gettingGOBinfoinfo+1
        if gettingGOBinfoinfo>=5 then 
            gettingGOBinfoinfo=0
        end
    end
    if gettingGOBinfo > 0 then
        if gettingGOBinfo==1 then
            ma_gobtargetinfo:SetText("")
            ma_gobtargetinfo:SetText(ma_gobtargetinfo:GetText().."|cffffffff"..string.gsub(text, ']', ']\n|cffffffff'))
        else
            ma_gobtargetinfo:SetText(ma_gobtargetinfo:GetText().."\n|cffffffff"..string.gsub(text, ']', ']\n|cffffffff'))
        end
        gettingGOBinfo=gettingGOBinfo+1
        if gettingGOBinfo>=7 then 
            gettingGOBinfo=0
            gettingGOBinfoinfo=1
        end
    end

    if cWorking == 1 then
        WorkString = string.gsub(text, '(|.........)', '') -- This removes any color formating
        --SendChatMessage("Workstring:"..WorkString)
        for cMap in string.gmatch(WorkString,'Map: %d')do
            --SendChatMessage("Mapo: "..cMap)
        end
        t = {}
        cnt = 1
         for cX, cY, cZ, cO in string.gmatch(WorkString, 'X: (.*) Y: (.*) Z: (.*) .*Orientation: (.*)') do
--[[            for w in string.gmatch(WorkString,'%s.%d*%p%d%d') do
                t[cnt] = string.gsub(w," ","")
                cnt = cnt + 1
            end
            cX = t[1]
            cY = t[2]
            cZ = t[3]
            cO = t[4] ]]
            --Calulate the new x y bassed on incX
        --SendChatMessage(cX)
        --SendChatMessage(cY)
        --SendChatMessage(cZ)
        --SendChatMessage(cO)
        nX = cX + (math.cos(cO) * incX)
        nY = cY + (math.sin(cO) * incX)
        --rotate the O so we can do some math
        tD = math.deg(cO) + 90
        if tD > 360 then tD = tD - 360 end
        nO = math.rad(tD)
        --Calulate the new x y bassed on incX
        nX = nX + (math.cos(nO) * incY)
        nY = nY + (math.sin(nO) * incY)
        --Send the port
        SendChatMessage('.go xyz '..' '..nX..' '..nY..' '..(cZ+incZ))
        --console reloadui
        incX = 0
        incY = 0
        incZ = 0
        isChecked = ma_spawnonmovecheck:GetChecked()
        isChecked2 = ma_moveonmovecheck:GetChecked()
        if isChecked == 1 then  --AddonMove
            ObjectN = ma_Obj_idbutton:GetText()
            SendChatMessage('.gob add '..ObjectN)
        elseif isChecked2 == 1 then --MoveonMove
            SendChatMessage('.gob del '..ma_Obj_guidbutton:GetText())
            ObjectN = ma_Obj_idbutton:GetText()
            SendChatMessage('.gob add '..ObjectN)
        else -- Just move player
        end
        cWorking = 0
        end
        OBJTarget()
        
    end
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

    if MangAdmin:ID_Setting_Start_Read() then    
        local b1,e1,pattern = string.find(text, "GUID: (%d+)%.")
        --local b1,e1,pattern = string.find(text, "GUID:")
        if b1 then
            b1,e1,pattern = string.find(text, "([0-9]+)")
            if b1 then
                MangAdmin:ID_Setting_Start_Write(0)
                
                MangAdmin:ID_Setting_Write(0,pattern)
                --ma_NPC_guidbutton:SetText(pattern)
                --self:LogAction("NPC_GUID_Get id "..pattern..".")
            end	
        else
        end
    
        b1,e1,pattern = string.find(text, "Entry: (%d+)%.")
        if b1 then
            b1,e1,pattern = string.find(text, "([0-9]+)")
            if b1 then
                
                MangAdmin:ID_Setting_Write(1,pattern)
                --ma_NPC_idbutton:SetText(pattern)
                --self:LogAction("NPC_EntryID_Get id "..pattern..".")
            end	
        else
        end
    
        b1,e1,pattern = string.find(text, "DisplayID: (%d+).*")
        if b1 then
            b1,e1,pattern = string.find(text, "([0-9]+)")
            if b1 then
                
                --MangAdmin:ID_Setting_Write(1,pattern)
                --ma_npcdisplayid:SetText(pattern)
                --self:LogAction("NPC_DisplayID_Get id "..pattern..".")
            end	
        else
        end
    
    end

    if MangAdmin:OID_Setting_Start_Read() then    
        local b1,e1,pattern = string.find(text, "GUID: (%d+) ")
        --local b1,e1,pattern = string.find(text, "GUID:")
        if b1 then
            b1,e1,pattern = string.find(text, "([0-9]+)")
            if b1 then
                MangAdmin:OID_Setting_Start_Write(0)
                MangAdmin:OID_Setting_Write(0,pattern)
                --ma_Obj_guidbutton:SetText(pattern)
                --self:LogAction("OBJECT_GUID_Get id "..pattern..".")
            end	
        else
        end
        
        --b1,e1,pattern = string.find(text, "ID: (%d+)% ")
        --b1,e1,pattern = string.find(text, "GUID: (%d+) ID: (%d+)")
        b1,e1,xpattern = string.find(text, " ID: (%d+)")
        if b1 then
            --b1,e1,pattern = string.find(text, "([0-9]+)")
            b1,e1,pattern = string.find(xpattern, "([0-9]+)")
            if b1 then
                
    --      		MangAdmin:OID_Setting_Write(1,pattern)
                --ma_Obj_idbutton:SetText(pattern)
                --self:LogAction("OBJECT_EntryID_Get id "..pattern..".")
                
            end	
        else
        end
    
        
        b1,e1,xpattern = string.find(text, "DisplayID: (%d+)")
        if b1 then
            --b1,e1,pattern = string.find(text, "([0-9]+)")
            b1,e1,pattern = string.find(xpattern, "([0-9]+)")
            if b1 then
                
    --      		MangAdmin:OID_Setting_Write(1,pattern)
    --      		ma_Obj_idbutton:SetText(pattern)
                --ma_gobdisplayid:SetText(pattern)
                --self:LogAction("OBJECT DisplayID"..pattern..".")
                
            end	
        else
        end
    
    end

    for diff in string.gmatch(text, Strings["ma_GmatchUpdateDiff"]) do
        --ma_difftext:SetText(diff)
        catchedSth = true
--        output = MangAdmin.db.account.style.showchat
        output = MangAdmin.db.account.style.showchat  
    end

    -- get results of ticket list. In Trinity, everything will be constructed off the list
    for id, char, create, update in string.gmatch(text, Strings["ma_GmatchTickets"]) do
        table.insert(MangAdmin.db.account.buffer.tickets, {tNumber = id, tChar = char, tLCreate = create, tLUpdate = update, tMsg = ""})
        local ticketCount = 0
        table.foreachi(MangAdmin.db.account.buffer.tickets, function() ticketCount = ticketCount + 1 end)
        ticketCount = 0
        catchedSth = true
        output = MangAdmin.db.account.style.showchat
        self.db.char.requests.ticketbody = id
        self.db.char.msgDeltaTime = time()
    end

    for acc, char, ip, map, zone, exp, gmlevel in string.gmatch(text, Strings["ma_GmatchWho"]) do
    	acc= string.gsub(acc, " ", "")
    	char= string.gsub(char, " ", "")
    	ip= string.gsub(ip, " ", "")
        map=string.gsub(map, " ", "")
        zone=string.gsub(zone, " ", "")
    	exp= string.gsub(exp, " ", "")
    	gmlevel= string.gsub(gmlevel, " ", "")
        gmlevel=strtrim(gmlevel, "]-")
        --self:ChatMsg("Matched Who")
        if acc == "Account" then
        else
            table.insert(MangAdmin.db.account.buffer.who, {tAcc = acc, tChar = char, tIP = ip, tMap = map, tZone = zone, tExp = exp, tGMLevel = gmlevel})
        end
            catchedSth = true
            output = MangAdmin.db.account.style.showchat
            WhoUpdate()
    end
--    ["ma_GmatchAccountInfo"] = "Player(.*) %(guid: (%d+)%) Account: (.*) %(id: (%d+)%) Email: (.*) GMLevel: (%d+) Last IP: (.*) Last login: (.*) Latency: (%d+)ms",
--    ["ma_GmatchAccountInfo2"] = "Race: (.*) Class: (.*) Played time: (.*) Level: (%d+) Money: (.*)",
    for charname, charguid, account, accountid, email, gmlvl, lastip, lastlogin, latency in string.gmatch(text, Strings["ma_GmatchAccountInfo"]) do
       ma_whodetail:SetText("|c00ff00ffCharacter:|r"..charname.." |cffffffff("..charguid..")|r\n".."|c00ff0000Acct:|r|cffffffff"..account.." ("..accountid..")|r\n".."|c00ff0000IP:|r|cffffffff"..lastip.."|r\n".."|c00ff0000Login:|r|cffffffff"..lastlogin.."|r\n".."|c00ff0000Latency:|r|cffffffff"..latency.."ms|r\n")  
       catchedSth = true
       output = MangAdmin.db.account.style.showchat
    end
    
    for race, class, playedtime, level, money in string.gmatch(text, Strings["ma_GmatchAccountInfo2"]) do
        --self:ChatMsg("Matched Who")
       ma_whodetail2:SetText("|c00ff0000Race:|r|cffffffff"..race.."|r\n".."|c00ff0000Class|r|cffffffff"..class.."|r\n".."|c00ff0000Level:|r|cffffffff"..level.."|r\n".."|c00ff0000Money:|r|cffffffff"..money.."|r\n".."|c00ff0000Played Time:|r|cffffffff"..playedtime.."|r\n")  
       catchedSth = true
       output = MangAdmin.db.account.style.showchat
    end
    for mymatch in string.gmatch(text, "=====") do
        catchedSth = true
        output = MangAdmin.db.account.style.showchat
    end
    for mymatch in string.gmatch(text, "Characters Online:") do
        catchedSth = true
        output = MangAdmin.db.account.style.showchat
    end
 --[[   
    -- get ticket content
    if self.db.char.requests.ticket then
      local delta = time() - self.db.char.msgDeltaTime
      ----self:LogAction("Delta: "..delta)
      if self.db.char.requests.ticketbody > 0 then
        if delta <= 300 then
          if not catchedSth then
            ----self:LogAction(text)
            local ticketCount = 0
            table.foreachi(MangAdmin.db.account.buffer.tickets, function() ticketCount = ticketCount + 1 end)
            ----self:LogAction("Prepare to add text to DB ticket: "..ticketCount)
            for k,v in ipairs(self.db.account.buffer.tickets) do
              if k == ticketCount then
                local oldmsg = v.tMsg
                self.db.account.buffer.tickets[k].tMsg = oldmsg..text.."\n"
                ----self:LogAction("Added text to ticket in DB: "..k.." Ticket id:"..self.db.account.buffer.tickets[k].tNumber)
              end
            end
            catchedSth = true
            output = false
          end
        else
          ----self:LogAction("Time passed. Getting next ticket...")
          --self:RequestTickets()
        end
      end
    end
]]    
    -- Check for possible UrlModification
    if catchedSth then
      if output == false then
        -- don't output anything
      elseif output == true then
        text = MangLinkifier_Decompose(text)
        self.hooks[frame].AddMessage(frame, text, r, g, b, id)
      end
    else
      text = MangLinkifier_Decompose(text)
      self.hooks[frame].AddMessage(frame, text, r, g, b, id)
    end
  else
    -- message is not from server
    --Linkifier should be used on non server messages as well to catch links suc as items in chat
    text = MangLinkifier_Decompose(text)
    -- Returns the message to the client, or else the chat frame never shows it
    self.hooks[frame].AddMessage(frame, text, r, g, b, id)
  end
end

function MangAdmin:ChatMsg(msg, msgt, recipient)
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

function MangAdmin:AndBit(value, test) 
  return mod(value, test*2) >= test 
end

function MangAdmin:SetSkill(value, skill, maxskill)
  if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local class = UnitClass("target") or UnitClass("player")
    if not skill then
      skill = ma_var1editbox:GetText()
      if ma_var1editbox:GetText() == "" then
        skill = 375
      end
    end
    if not maxskill then
      maxskill = ma_var2editbox:GetText()
      if ma_var2editbox:GetText() == "" then
        maxskill = 375
      end
    end
    if type(value) == "string" then
      self:ChatMsg(".setskill "..value.." "..skill.." "..maxskill)
      --self:LogAction("Set skill "..value.." of "..player.." to "..skill.." with a maximum of "..maxskill..".")
    elseif type(value) == "table" then
      for k,v in pairs(value) do
        self:ChatMsg(".setskill "..v.." "..skill.." "..maxskill)
        --self:LogAction("Set skill "..v.." of "..player.." to "..skill.." with a maximum of "..maxskill..".")
      end
    end
  else
    self:Print(Locale["selectionerror1"])
  end
end

function MangAdmin:Quest(value, state)
  if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local class = UnitClass("target") or UnitClass("player")
    local command = ".quest add"
    local logcmd = "Added"
    local logcmd2 = "to"
    if state == "RightButton" then
      command = ".quest remove"
      logcmd = "Removed"
      logcmd2 = "from"
    end
    if type(value) == "string" then
      self:ChatMsg(command.." "..value)
      --self:LogAction(logcmd.." quest with id "..value.." "..logcmd2.." "..player..".")
    elseif type(value) == "table" then
      for k,v in pairs(value) do
        self:ChatMsg(command.." "..v)
        --self:LogAction(logcmd.." quest with id "..value.." "..logcmd2.." "..player..".")
      end
    elseif type(value) == "number" then
      self:ChatMsg(command.." "..value)
      --self:LogAction(logcmd.." quest with id "..value.." "..logcmd2.." "..player..".")
    end
  else
    self:Print(Locale["selectionerror1"])
  end
end

function MangAdmin:Creature(value, state)
    local command = ".npc add"
    local logcmd = "Spawned"
    if state == "RightButton" then
      command = ".list creature"
      logcmd = "Listed"
    end
    if type(value) == "string" then
      self:ChatMsg(command.." "..value)
      --self:LogAction(logcmd.." creature with id "..value..".")
    elseif type(value) == "table" then
      for k,v in pairs(value) do
        self:ChatMsg(command.." "..v)
        --self:LogAction(logcmd.." creature with id "..value..".")
      end
    elseif type(value) == "number" then
      self:ChatMsg(command.." "..value)
      --self:LogAction(logcmd.." creature with id "..value..".")
    end

end

function MangAdmin:AddItem(value, state)
  if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local amount = ma_var1editbox:GetText()
    if state == "RightButton" then
      if amount == "" then
        self:ChatMsg(".additem "..value.." -1")
    --      self:ChatMsg(".list item "..value)
        --self:LogAction("Removed item with id "..value.." from "..player..".")
    --      --self:LogAction("Listed item with id "..value..".")
      else
        local amt=tonumber(amount)
        if amt >0 then 
           amt=amt*-1
           amount=tostring(amt)
        end
        self:ChatMsg(".additem "..value.." "..amount)
        --self:LogAction("Removed "..amount.." items with id "..value.." to "..player..".")
      
      end
      
    else
      if amount == "" then
        self:ChatMsg(".additem "..value)
        --self:LogAction("Added item with id "..value.." to "..player..".")
      else
        self:ChatMsg(".additem "..value.." "..amount)
        --self:LogAction("Added "..amount.." items with id "..value.." to "..player..".")
      end
    end
  else
    self:Print(Locale["selectionerror1"])
  end
end

function MangAdmin:AddItemSet(value)
  if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    self:ChatMsg(".additemset "..value)
    --self:LogAction("Added itemset with id "..value.." to "..player..".")
  else
    self:Print(Locale["selectionerror1"])
  end
end

function MangAdmin:AddObject(value, state)
  local loot = ma_var1editbox:GetText()
  local _time = ma_var2editbox:GetText()
  if state == "RightButton" then
    self:ChatMsg(".gobject add "..value.." "..value)
    --self:LogAction("Added object id "..value.." with loot template.")
  else
    if loot ~= "" and _time == "" then
      self:ChatMsg(".gobject add "..value.. " "..loot)
      --self:LogAction("Added object id "..value.." with loot "..loot..".")
    elseif loot ~= "" and _time ~= "" then
      self:ChatMsg(".gobject add "..value.. " "..loot.." ".._time)
      --self:LogAction("Added object id "..value.." with loot "..loot.." and spawntime ".._time..".")
    else
      self:ChatMsg(".gobject add "..value)
      --self:LogAction("Added object id "..value..".")
    end
  end
end

function MangAdmin:TelePlayer(value, player)
  if value == "gochar" then
    self:ChatMsg(".appear "..player)
    --self:LogAction("Teleported to player "..player..".")
  elseif value == "getchar" then
    self:ChatMsg(".summon "..player)
    --self:LogAction("Summoned player "..player..".")
  end
end

function MangAdmin:CreateGuild(leader, name)
  self:ChatMsg(".guild create "..leader.." "..name)
  --self:LogAction("Created guild '"..name.."' with leader "..leader..".")
end

function MangAdmin:SendMail(recipient, subject, body)
  recipient = string.gsub(recipient, " ", "")
  subject = string.gsub(subject, " ", "")
  body = string.gsub(body, "\n", " ")
  subject = '"'..subject..'"'
  body = '"'..body..'"'
  self:ChatMsg(".send mail "..recipient.." "..subject.." "..body)
  --self:LogAction("Sent a mail to "..recipient..". Subject was: "..subject)
end

function MangAdmin:UpdateMailBytesLeft()
  local bleft = 246 - strlen(ma_searcheditbox:GetText()) - strlen(ma_var1editbox:GetText()) - strlen(ma_maileditbox:GetText())
  if bleft >= 0 then
    ma_lookupresulttext:SetText(Locale["ma_MailBytesLeft"].."|cff00ff00"..bleft.."|r")
  else
    ma_lookupresulttext:SetText(Locale["ma_MailBytesLeft"].."|cffff0000"..bleft.."|r")
  end
end

function MangAdmin:SearchStart(var, value)
  self.db.char.requests.toggle = true
  if var == "item" then
    self.db.char.requests.item = true
    self.db.account.buffer.items = {}
    self:ChatMsg(".lookup item "..value)
  elseif var == "itemset" then
    self.db.char.requests.itemset = true
    self.db.account.buffer.itemsets = {}
    self:ChatMsg(".lookup itemset "..value)
  elseif var == "spell" then
    self.db.char.requests.spell = true
    self.db.account.buffer.spells = {}
    self:ChatMsg(".lookup spell "..value)
  elseif var == "skill" then
    self.db.char.requests.skill = true
    self.db.account.buffer.skills = {}
    self:ChatMsg(".lookup skill "..value)
  elseif var == "quest" then
    self.db.char.requests.quest = true
    self.db.account.buffer.quests = {}
    self:ChatMsg(".lookup quest "..value)
  elseif var == "creature" then
    self.db.char.requests.creature = true
    self.db.account.buffer.creatures = {}
    self:ChatMsg(".lookup creature "..value)
  elseif var == "object" then
    self.db.char.requests.object = true
    self.db.account.buffer.objects = {}
    self:ChatMsg(".lookup object "..value)
  elseif var == "tele" then
    self.db.char.requests.tele = true
    self.db.account.buffer.teles = {}
    self:ChatMsg(".lookup tele "..value)
  end
  self.db.account.buffer.counter = 0
  --self:LogAction("Searching for "..var.."s with the keyword '"..value.."'.")
end

function MangAdmin:SearchReset()
  ma_searcheditbox:SetScript("OnTextChanged", function() end)
  ma_var1editbox:SetScript("OnTextChanged", function() end)
  ma_searcheditbox:SetText("")
  ma_var1editbox:SetText("")
  ma_var2editbox:SetText("")
  ma_lookupresulttext:SetText(Locale["searchResults"].."0")
  self.db.char.requests.item = false
  self.db.char.requests.favitem = false
  self.db.char.requests.itemset = false
  self.db.char.requests.favitemset = false
  self.db.char.requests.spell = false
  self.db.char.requests.favspell = false
  self.db.char.requests.skill = false
  self.db.char.requests.favskill = false
  self.db.char.requests.quest = false
  self.db.char.requests.favquest = false
  self.db.char.requests.creature = false
  self.db.char.requests.favcreature = false
  self.db.char.requests.object = false
  self.db.char.requests.favobject = false
  self.db.char.requests.tele = false
  self.db.char.requests.favtele = false
  self.db.char.requests.toggle = false
  self.db.account.buffer.items = {}
  self.db.account.buffer.itemsets = {}
  self.db.account.buffer.spells = {}
  self.db.account.buffer.skills = {}
  self.db.account.buffer.quests = {}
  self.db.account.buffer.creatures = {}
  self.db.account.buffer.objects = {}
  self.db.account.buffer.teles = {}
  self.db.account.buffer.counter = 0
  PopupScrollUpdate()
end

function MangAdmin:PrepareScript(object, text, script)

    if type(script) == "function" then
      object:SetScript("OnClick", script)
    elseif type(script) == "table" then
      for k,v in pairs(script) do
        object:SetScript(unpack(v))
      end
    end
  --end
end

function pairsByKeys(t, f)
  if t == Nil then
  else
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
    end
    return iter
  end
end

local mang_ID_start = 0
local mang_ID_guid = ""
local mang_ID_entryid = ""
local mang_OID_start = 0
local mang_OID_guid = ""
local mang_OID_entryid = ""

function MangAdmin:ID_Setting_Start_Read()
    
    return mang_ID_start
end  

function MangAdmin:OID_Setting_Start_Read()
    
    return mang_OID_start

end   

function MangAdmin:OID_Setting_Start_Write(num)
    
    mang_OID_start = num

end    

function MangAdmin:OID_Setting_Write(num,val)
    
    if num == 0 then
    -- GUID
      mang_OID_guid = val
    elseif num == 1 then
    -- ID
      mang_OID_entryid = val
    end

end    

function MangAdmin:OID_Setting_Read(num)
           
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