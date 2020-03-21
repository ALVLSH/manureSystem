----------------------------------------------------------------------------------------------------
-- ManureSystemLiquidTank
----------------------------------------------------------------------------------------------------
-- Purpose: Insert fertilizer function into the pallets.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemLiquidTank
ManureSystemLiquidTank = {}

function ManureSystemLiquidTank.prerequisitesPresent(specializations)
    return true
end

function ManureSystemLiquidTank.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemLiquidTank)
end

function ManureSystemLiquidTank:onPreLoad(savegame)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLINGFERTILIZER")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLInt(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#id"):format(0), 3)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "0.638 0.33 0")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "0 0 0")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_1")

    -- Don't delete the pallet when empty but make it refillable.
    setXMLBool(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d).fillUnits#removeVehicleIfEmpty"):format(0), false)
end
