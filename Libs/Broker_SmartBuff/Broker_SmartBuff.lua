-------------------------------------------------------------------------------
-- Broker: SmartBuff
-- Created by Aeldra (EU-Proudmoore)
--
-- Data Broker support
-------------------------------------------------------------------------------

if (not SMARTBUFF_TITLE) then return end

local F = CreateFrame("Frame", "Broker_SmartBuff");

function SMARTBUFF_BROKER_SetIcon()
  if (not F.LS) then return end
  local icons = SMARTBUFF_GLOBALS;
  local onIcon = (icons and icons.imgIconOn) or "Interface\\AddOns\\SmartBuff\\Icons\\MiniMapButtonEnabled";
  local offIcon = (icons and icons.imgIconOff) or "Interface\\AddOns\\SmartBuff\\Icons\\MiniMapButtonDisabled";
  if (SMARTBUFF_Options and SMARTBUFF_Options.Toggle) then
    F.LS.icon = onIcon;
  else
    F.LS.icon = offIcon;
  end
end

F.LS = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("SmartBuff", {
	type = "launcher",
	label = SMARTBUFF_TITLE,
	OnClick = function(_, msg)
    if (msg == "RightButton") then
      SMARTBUFF_OToggle();
      SMARTBUFF_BROKER_SetIcon();
      if (SmartBuffOptionsFrame and SmartBuffOptionsFrame:IsVisible()) then
        SMARTBUFF_Options_OnShow();
      end
    elseif (msg == "LeftButton" and IsAltKeyDown()) then
      -- Check if SmartDebuff is loaded before attempting to toggle
      if (C_AddOns.IsAddOnLoaded("SmartDebuff")) then
        SMARTDEBUFF_ToggleSF();
      end
    elseif (msg == "LeftButton" and IsShiftKeyDown()) then
      if (SMARTBUFF_PaladinAssign_Toggle) then
        SMARTBUFF_PaladinAssign_Toggle();
      end
    elseif (msg == "LeftButton") then
      SMARTBUFF_OptionsFrame_Toggle();
    end
	end,
	icon = "Interface\\AddOns\\SmartBuff\\Icons\\MiniMapButtonDisabled",
	OnTooltipShow = function(tooltip)
		if (not tooltip or not tooltip.AddLine) then return end
		tooltip:AddLine("|cffffffff"..SMARTBUFF_TITLE.."|r");
		local owner = tooltip.GetOwner and tooltip:GetOwner();
		if (owner and owner.GetName and owner:GetName() == "LibDBIcon10_SmartBuff") then
		  tooltip:AddLine(SMARTBUFF_MINIMAP_TT);
		else
		  tooltip:AddLine(SMARTBUFF_TITAN_TT);
		end
	end,
});

F:Hide();
--print("Borker - SmartBuff loaded");
