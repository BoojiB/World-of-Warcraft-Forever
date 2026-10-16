-------------------------------------------------------------------------------
-- Client detection (Forever only)
-------------------------------------------------------------------------------

local SG = SMARTBUFF_GLOBALS;

-- Runtime build number for diagnostics / load message only.
SMARTBUFF_CLIENTVER = select(4, GetBuildInfo()) or 0;

-- WoW: Forever uses the Camelot project identifier.
SG.isWoWProjectForever = WOW_PROJECT_CAMELOT ~= nil and WOW_PROJECT_ID == WOW_PROJECT_CAMELOT;

SMARTBUFF_IS_MAINLINE = false;
SMARTBUFF_CLIENT_SUPPORTED = true;
SMARTBUFF_CLIENTTBCC = false;
SMARTBUFF_CLIENTLABEL = "Forever";
