--[[
───────────▒▒▒▒▒▒▒▒
─────────▒▒▒──────▒▒▒
────────▒▒───▒▒▒▒──▒░▒
───────▒▒───▒▒──▒▒──▒░▒
──────▒▒░▒──────▒▒──▒░▒
───────▒▒░▒────▒▒──▒░▒
─────────▒▒▒▒▒▒▒───▒▒
─────────────────▒▒▒
─────▒▒▒▒────────▒▒
───▒▒▒░░▒▒▒─────▒▒──▓▓▓▓▓▓▓▓
──▒▒─────▒▒▒────▒▒▓▓▓▓▓░░░░░▓▓──▓▓▓▓
─▒───▒▒────▒▒─▓▓▒░░░░░░░░░█▓▒▓▓▓▓░░▓▓▓
▒▒──▒─▒▒───▓▒▒░░▒░░░░░████▓▓▒▒▓░░░░░░▓▓
░▒▒───▒──▓▓▓░▒░░░░░░█████▓▓▒▒▒▒▓▓▓▓▓░░▓▓
──▒▒▒▒──▓▓░░░░░░███████▓▓▓▒▒▒▒▒▓───▓▓░▓▓
──────▓▓░░░░░░███████▓▓▓▒▒▒▒▒▒▒▓───▓░░▓▓
─────▓▓░░░░░███████▓▓▓▒▒▒▒▒▒▒▒▒▓▓▓▓░░▓▓
────▓▓░░░░██████▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▓░░░░▓▓
────▓▓▓░████▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓
─────▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓
─────▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓
──────▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓
───────▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓
─────────▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓
───────────▓▓▓▓▓▓▒▒▒▒▒▓▓▓▓
───────────────▓▓▓▓▓▓▓▓
-- Made by TestUnit
]]--

MAJOR_VERSION = "Darkmoon Master Addon |cFF38FE62BFA|r v0.9.5";
MINOR_VERSION = "$Revision: 3 $";
ROOT_PATH     = "Interface\\AddOns\\DMA\\";

DMA = LibStub("AceAddon-3.0"):NewAddon("DMA", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0");
DMA.HBD = LibStub("HereBeDragons-2.0d");
DMA.Linkifier = DMA;
DMA.Prefix = "DMA";
DMA.User = {};
DMA.Debug = false;
DMA.Timers = {};
DMA.Timers["GPS-Timer"] = nil;

DMA.PlayerMovement = {}
DMA.PlayerMovement.Distance = 1;
DMA.Version = 0.91;

DMA.GOB = {}
DMA.GOB.Counter = 1;
DMA.GOB.ObjectListInitialized = false
--DMA.GOB.ObjectList[number] = { id, name }
DMA.GOB.ObjectList = {};
DMA.GOB.ObjectList.Data = {};
DMA.GOB.ObjectList.ToShow = {};
DMA.lineplusoffset = {
  [1] = 1,
  [2] = 2,
  [3] = 3,
  [4] = 4,
  [5] = 5,
  [6] = 6,
  [7] = 7,
  [8] = 8,
  [9] = 9,
  [10] = 10,
  [11] = 11,
  [12] = 12
}
DMA.Linkifier.isShowing = true;

DMAUserVars = {};
DMAUserVars["Version"] = DMA.Version;
DMAUserVars["Darkmoon"] = true;
DMAUserVars["BackgroundAlpha"] = 1;
DMAUserVars["Gm-mode"] = false;
DMAUserVars["Fly-mode"] = false;
DMAUserVars["Whisper"] = false;
DMAUserVars["GmChat"] = false;
DMAUserVars["Invisibility"] = false;
DMAUserVars["LastGPS-X"] = 0;
DMAUserVars["LastGPS-Y"] = 0;
DMAUserVars["LastGPS-Z"] = 0;
DMAUserVars["LastGPS-O"] = 0;
DMAUserVars["MoveDistance"] = 1;
DMAUserVars["GPS-Scan"] = true;
DMAUserVars["LastNPC"] = nil;
DMAUserVars["LastGOB-ID"] = 0;
DMAUserVars["LastGOB-GUID"] = 0;
DMAUserVars["LastGOB-X"] = 0;
DMAUserVars["LastGOB-Y"] = 0;
DMAUserVars["LastGOB-Z"] = 0;
DMAUserVars["LastGOB-SCALE"] = 1;
-- Rotate
DMAUserVars["LastGOB-OX"] = 0;
DMAUserVars["LastGOB-OY"] = 0;
DMAUserVars["LastGOB-OZ"] = 0;

DMAGOBButtons = {};

function DMA:OnEnable()
	DMA:InitializeHooks();
	DMA:AlphaSlider();
	DMA:BackGroundAlphaInitialize();
	DMA:AddMinimapIcon();
	DMA.GOB.ObjectListInitialized = true;
	DMA:GenerateObjectsScrollMenu();
	C_ChatInfo.RegisterAddonMessagePrefix(RPSCoreFramework.Prefix);
end
