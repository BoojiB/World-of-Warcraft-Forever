-------------------------------------------------------------------------------
-- Client detection (Forever only)
-------------------------------------------------------------------------------

-- Runtime build number for diagnostics / load message only.
SMARTBUFF_CLIENTVER = select(4, GetBuildInfo()) or 0;

SMARTBUFF_IS_MAINLINE = false;
SMARTBUFF_CLIENT_SUPPORTED = true;
SMARTBUFF_CLIENTTBCC = false;
SMARTBUFF_CLIENTLABEL = "Forever";
