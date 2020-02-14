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

local function SysChatFilter(self, event, msg, author, ...)
   if(DMAUserVars["GPS-Scan"] == true and not (tonumber(DMAUserVars["LastGPS-Z"]) == tonumber(0))) then
      return true;
   end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", SysChatFilter)

function DMA:InitializeHooks()
	DMAUserVars["LastGPS-O"] = 0;
end

function DMA:SendCoreMessage(msg)
   msg = "."..msg;
   C_ChatInfo.SendAddonMessage(DMA.Prefix, msg, "WHISPER", UnitName("player"));
end