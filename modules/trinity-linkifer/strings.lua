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
function ReturnPratStrings_enUS()
  return {
    ["ma_GmatchRevision"] = "TrinityCore Rev: (%d+)",
    --    ["ma_GmatchRevision"] = "TrinityCore Rev: (.*) Release",
    ["ma_GmatchGPS"] = "X: (.*) Y: (.*) Z",
    ["ma_GmatchItem"] = "%|cffffffff%|Hitem:(%d+).*%[(.*)%]%|h%|r",
    ["ma_GmatchQuest"] = ".-(%d+).*%[(.*)%]%|h%|r",
    ["ma_GmatchItemSet"] = "|cffffffff|Hitemset:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchSpell"] = "|cffffffff|Hspell:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchSkill"] = "|cffffffff|Hskill:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchCreature"] = "|cffffffff|Hcreature_entry:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchGameObject"] = "|cffffffff|Hgameobject_entry:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchTele"] = "%|cffffffff%|Htele:(.*)%|h%[(.*)%]%|h%|r",
    ["ma_GmatchTeleFound"] = "Locations found are:",
    ["ma_GmatchUpdateDiff"] = "Update time diff: (.*)",
    ["ma_GmatchNewTicket"] = "New ticket from(.+)",
    ["ma_GmatchTicketsFull"] = "Ticket Message.-:.-|c(.*)",
    ["ma_GmatchTickets"] = ".+Ticket.-:(.*)Created by.-:|cff00ccff (.*)|r.+Created.-:(.*)Last change.-:(.*)",
    ["ma_GmatchAccountInfo"] = "Player(.*) %(guid: (%d+)%) Account: (.*) %(id: (%d+)%) Email: (.*) GMLevel: (%d+) Last IP: (.*) Last login: (.*) Latency: (%d+)ms",
    ["ma_GmatchAccountInfo2"] = "Race: (.*) Class: (.*) Played time: (.*) Level: (%d+) Money: (.*)",
    ["ma_GmatchOnlinePlayers"] = "Online players: (%d+) %(max: (%d+)%)",
    ["ma_GmatchUptime"] = "Server uptime: (.*)",
    ["ma_GmatchActiveConnections"] = "Active connections.*",
    ["ma_GmatchWho"] = "%-%[(.*)%]%[(.*)%]%[(.*)%]%[(.*)%]%[(.*)%]%[(.*)%]%[(.*)%]-",

    --linkifier
    ----------====~~GO Target Command Match Text ~~====----------
    ["lfer_GOtargid1"] = "GUID: |cffffffff|Hpos:|h(%d+)|h|r ID: |cffffffff|Hpos:|h(%d+)|h|r",
    ["lfer_GOtargid2"] = "GUID: |cffffffff|Hpos:|h(%d+)|h|r ID: |cffffffff|Hpos:|h(%d+)|h|r",
    ["lfer_GOtargid3"] = "GUID: %1 ID: %2",
    ["lfer_GOtargguid1"] = "GUID: (%d+) ID",
    ["lfer_GOtargguid1"] = "GUID: (%d+) ",
    ["lfer_GOtargguid3"] = "GUID: %1", "%1",
    ["lfer_GOtargxyz1"] = "X: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Y: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Z: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r MapId: |cffffffff|Hpos:|h(%d+)",
    ["lfer_GOtargxyz2"] = "X: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Y: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Z: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r MapId: |cffffffff|Hpos:|h(%d+)",
    ["lfer_GOtargxyz3"] = "X: %1  Y: %2  Z: %3 MapId: %4", "%1 %2 %3 %4",
    ----------====~~ NPC Info Command Match Text ~~====----------
    ["lfer_NPCInfoguid1"] = "GUID: (%d+)%.",
    ["lfer_NPCInfoguid2"] = "GUID: (%d+)%.",
    ["lfer_NPCInfoguid3"] = "GUID: %1.",
    ["lfer_NPCInfoentry1"] = "Entry: (%d+)%.",
    ["lfer_NPCInfoentry2"] = "Entry: (%d+)%.",
    ["lfer_NPCInfoentry3"] = "Entry: %1.",
    ["lfer_NPCInfodisplay1"] = "DisplayID: (%d+)",
    ["lfer_NPCInfodisplay2"] = "DisplayID: (%d+)",
    ["lfer_NPCInfodisplay3"] = "DisplayID: %1.",
    ["lfer_NPCInfodisplay21"] = "%(Native: (%d+)%)",
    ["lfer_NPCInfodisplay22"] = "%(Native: (%d+)%)",
    ["lfer_NPCInfodisplay23"] = "(Native: (%1))",
    ----------====~~ ADD GO Command Match Text ~~====----------
    ["lfer_AddGoguid1"] = "%) %(GUID: (%d+)%)",
    ["lfer_AddGoguid2"] = "%(GUID: (%d+)%)",
    ["lfer_AddGoguid3"] = "(GUID: %1)",
    ["lfer_AddGoid1"] = "Object '(%d+)'",
    ["lfer_AddGoid2"] = "Object '(%d+)'",
    ["lfer_AddGoid3"] = "Object '%1')",
    ["lfer_AddGoxyz1"] = "'([%p%d.%d]+) ([%p%d.%d]+) ([%p%d.%d]+)'",
    ["lfer_AddGoxyz2"] = "'([%p%d.%d]+) ([%p%d.%d]+) ([%p%d.%d]+)'",
    ["lfer_AddGoxyz3"] = "'%1 %2 %3'",
    ----------====~~ GPS Command Match Text ~~====----------

    ["lfer_GPSxyz1"] = "X: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Y: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Z: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Orientation: |cffffffff|Hpos:|h[%p%d.%d]+|h|r",
    ["lfer_GPSxyz2"] = "X: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Y: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Z: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Orientation: |cffffffff|Hpos:|h[%p%d.%d]+|h|r",
    ["lfer_GPSxyz3"] = "X: %1 Y: %2 Z: %3",

    ["lfer_pinfo1"] = "Account: (.*) .ID: (%d+)., GMLevel: (%d)",
    ["lfer_pinfo2"] = "Account: (.*) .ID: (%d+)., GMLevel: (%d)",
    ["lfer_pinfo3"] = "Account: %1 (ID: %2), GMLevel: %3",

    ["lfer_rotate1"] = "Рысканье .oZ.: ([0-9 -]+.%d+) Тангаж .oY.: ([0-9 -]+.%d+) Крен .oX.: ([0-9 -]+.%d+)",
    ["lfer_rotate2"] = "Рысканье .oZ.: ([0-9 -]+.%d+) Тангаж .oY.: ([0-9 -]+.%d+) Крен .oX.: ([0-9 -]+.%d+)",
    ["lfer_rotate3"] = "Рысканье (oZ): %1 Тангаж (oY): %2 Крен (oX): %3"
}
end

function ReturnStrings_enUS()
  return {
    ["ma_GmatchRevision"] = "TrinityCore Rev: (%d+)",
    --    ["ma_GmatchRevision"] = "TrinityCore Rev: (.*) Release",
    ["ma_GmatchGPS"] = "X: (.*) Y: (.*) Z",
    ["ma_GmatchItem"] = "%|cffffffff%|Hitem:(%d+).*%[(.*)%]%|h%|r",
    ["ma_GmatchQuest"] = ".-(%d+).*%[(.*)%]%|h%|r",
    ["ma_GmatchItemSet"] = "|cffffffff|Hitemset:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchSpell"] = "|cffffffff|Hspell:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchSkill"] = "|cffffffff|Hskill:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchCreature"] = "|cffffffff|Hcreature_entry:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchGameObject"] = "|cffffffff|Hgameobject_entry:(%d+)|h%[(.-)%]|h|r",
    ["ma_GmatchTele"] = "%|cffffffff%|Htele:(.*)%|h%[(.*)%]%|h%|r",
    ["ma_GmatchTeleFound"] = "Locations found are:",
    ["ma_GmatchUpdateDiff"] = "Update time diff: (.*)",
    ["ma_GmatchNewTicket"] = "New ticket from(.+)",
    ["ma_GmatchTicketsFull"] = "Ticket Message.-:.-|c(.*)",
    ["ma_GmatchTickets"] = ".+Ticket.-:(.*)Created by.-:|cff00ccff (.*)|r.+Created.-:(.*)Last change.-:(.*)",
    ["ma_GmatchAccountInfo"] = "Player(.*) %(guid: (%d+)%) Account: (.*) %(id: (%d+)%) Email: (.*) GMLevel: (%d+) Last IP: (.*) Last login: (.*) Latency: (%d+)ms",
    ["ma_GmatchAccountInfo2"] = "Race: (.*) Class: (.*) Played time: (.*) Level: (%d+) Money: (.*)",
    ["ma_GmatchOnlinePlayers"] = "Online players: (%d+) %(max: (%d+)%)",
    ["ma_GmatchUptime"] = "Server uptime: (.*)",
    ["ma_GmatchActiveConnections"] = "Active connections.*",
    ["ma_GmatchWho"] = "%-%[(.*)%]%[(.*)%]%[(.*)%]%[(.*)%]%[(.*)%]%[(.*)%]%[(.*)%]-",

    --linkifier
    ----------====~~GO Target Command Match Text ~~====----------
    ["lfer_GOtargid1"] = "GUID: |cffffffff|Hpos:|h(%d+).+ ID: |cffffffff|Hpos:|h(%d+)|h",
    ["lfer_GOtargid2"] = "GUID: |cffffffff|Hpos:|h(%d+).+ ID: |cffffffff|Hpos:|h(%d+)|h",
    ["lfer_GOtargid3"] = "GUID: %1 ID: %2",
    ["lfer_GOtargguid1"] = "GUID: (%d+) ID",
    ["lfer_GOtargguid1"] = "GUID: (%d+) ",
    ["lfer_GOtargguid3"] = "GUID: %1", "%1",
    ["lfer_GOtargxyz1"] = "X: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Y: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Z: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r MapId: |cffffffff|Hpos:|h(%d+)",
    ["lfer_GOtargxyz2"] = "X: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Y: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Z: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r MapId: |cffffffff|Hpos:|h(%d+)",
    ["lfer_GOtargxyz3"] = "X: %1  Y: %2  Z: %3 MapId: %4", "%1 %2 %3 %4",
    ----------====~~ NPC Info Command Match Text ~~====----------
    ["lfer_NPCInfoguid1"] = "GUID: (%d+)%.",
    ["lfer_NPCInfoguid2"] = "GUID: (%d+)%.",
    ["lfer_NPCInfoguid3"] = "GUID: %1.",
    ["lfer_NPCInfoentry1"] = "Entry: (%d+)%.",
    ["lfer_NPCInfoentry2"] = "Entry: (%d+)%.",
    ["lfer_NPCInfoentry3"] = "Entry: %1.",
    ["lfer_NPCInfodisplay1"] = "DisplayID: (%d+)",
    ["lfer_NPCInfodisplay2"] = "DisplayID: (%d+)",
    ["lfer_NPCInfodisplay3"] = "DisplayID: %1.",
    ["lfer_NPCInfodisplay21"] = "%(Native: (%d+)%)",
    ["lfer_NPCInfodisplay22"] = "%(Native: (%d+)%)",
    ["lfer_NPCInfodisplay23"] = "(Native: (%1))",
    ----------====~~ ADD GO Command Match Text ~~====----------
    ["lfer_AddGoguid1"] = "%) %(GUID: (%d+)%)",
    ["lfer_AddGoguid2"] = "%(GUID: (%d+)%)",
    ["lfer_AddGoguid3"] = "(GUID: %1)",
    ["lfer_AddGoid1"] = "Object '(%d+)'",
    ["lfer_AddGoid2"] = "Object '(%d+)'",
    ["lfer_AddGoid3"] = "Object '%1')",
    ["lfer_AddGoxyz1"] = "'([%p%d.%d]+) ([%p%d.%d]+) ([%p%d.%d]+)'",
    ["lfer_AddGoxyz2"] = "'([%p%d.%d]+) ([%p%d.%d]+) ([%p%d.%d]+)'",
    ["lfer_AddGoxyz3"] = "'%1 %2 %3'",
    ----------====~~ GPS Command Match Text ~~====----------

    ["lfer_GPSxyz1"] = "X: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Y: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Z: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Orientation: |cffffffff|Hpos:|h[%p%d.%d]+|h|r",
    ["lfer_GPSxyz2"] = "X: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Y: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Z: |cffffffff|Hpos:|h([%p%d.%d]+)|h|r Orientation: |cffffffff|Hpos:|h[%p%d.%d]+|h|r",
    ["lfer_GPSxyz3"] = "X: %1 Y: %2 Z: %3",

    ["lfer_pinfo1"] = "Account: (.*) .ID: (%d+)., GMLevel: (%d)",
    ["lfer_pinfo2"] = "Account: (.*) .ID: (%d+)., GMLevel: (%d)",
    ["lfer_pinfo3"] = "Account: %1 (ID: %2), GMLevel: %3",

    ["lfer_rotate1"] = "Рысканье .oZ.: ([0-9 -]+.%d+) Тангаж .oY.: ([0-9 -]+.%d+) Крен .oX.: ([0-9 -]+.%d+)",
    ["lfer_rotate2"] = "Рысканье .oZ.: ([0-9 -]+.%d+) Тангаж .oY.: ([0-9 -]+.%d+) Крен .oX.: ([0-9 -]+.%d+)",
    ["lfer_rotate3"] = "Рысканье (oZ): %1 Тангаж (oY): %2 Крен (oX): %3"
}
end