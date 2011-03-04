--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    unitdefgen.lua
--  brief:   procedural generation of unitdefs for modular comms
--  author:  KingRaptor (L.J. Lim)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Spring.Utilities = Spring.Utilities or {}
VFS.Include("LuaRules/Utilities/base64.lua")
--------------------------------------------------------------------------------
--	HOW IT WORKS: 
--	First, it makes unitdefs as specified by the decoded modoption string, one for each unique comm type.
--		The unitdefs are named: <name>
--	It then modifies each unitdef based on the upgrades selected for that comm type.
--	Upgrade types are defined in gamedata/modularcomms/moduledefs.lua.
--
--	Comms are later assigned to players in start_unit_setup.lua.
--
--	TODO:
--		Figure out how modstats should handle procedurally generated comms
--			* Teach gadget to treat them as baseline comms
--
--------------------------------------------------------------------------------
--	PROPOSED SPECS FOR TEMPLATE UNITDEFS
--	Weapon 1: fake laser
--	Weapon 2: shield
--	Weapon 3: special weapon (uses CEG 3 and 4)
--	Weapon 4: main weapon (no CEG)
--	Weapon 5: main weapon (uses CEG 1 and 2)
--	Weapon 6: flamethrower only?
--------------------------------------------------------------------------------
VFS.Include("gamedata/modularcomms/moduledefs.lua")

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local commDataRaw = Spring.GetModOptions().commandertypes
local commDataFunc, err, success, commData
if not (commDataRaw and type(commDataRaw) == 'string') then
	err = "Comm data entry in modoption is empty or in invalid format"
	commData = {}
else
	commDataRaw = string.gsub(commDataRaw, '_', '=')
	commDataRaw = Spring.Utilities.Base64Decode(commDataRaw)
	--Spring.Echo(commDataRaw)
	commDataFunc, err = loadstring("return "..commDataRaw)
	if commDataFunc then
		success, commData = pcall(commDataFunc)
		if not success then	-- execute Borat
			err = commData
			commData = {}
		end
	end
end
if err then 
	Spring.Echo('Modular Comms error: ' .. err)
end

if not commData then commData = {} end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
commDefs = {}	--holds precedurally generated comm defs

local function ProcessComm(name, config)
	if config.chassis and UnitDefs[config.chassis] then
		Spring.Echo("Processing comm: "..name)
		local name = name
		commDefs[name] = CopyTable(UnitDefs[config.chassis], true)
		commDefs[name].customparams = commDefs[name].customparams or {}
		local cp = commDefs[name].customparams
		cp.basespeed = tostring(commDefs[name].maxvelocity)
		cp.basehp = tostring(commDefs[name].maxdamage)
		for i,v in pairs(commDefs[name].weapondefs or {}) do
			v.customparams = v.customparams or {}
			v.customparams.baserange = tostring(v.range)
			for armorname,dmg in pairs(v.damage) do
				v.customparams["basedamage_"..armorname] = tostring(dmg)
				--Spring.Echo(armorname, v.customparams["basedamage_"..armorname])
			end
		end
		
		if config.modules then
			-- sort: weapons first, weapon mods next, regular modules last
			table.sort(config.modules,
				function(a,b)
					return (a:find("commweapon_") and (not b:find("commweapon"))
					or (a:find("weaponmod_") and b:find("module_")) )
				end )

			-- process all modules (including weapons)
			for _,moduleName in ipairs(config.modules) do
				if moduleName:find("commweapon_",1,true) then
					if weapons[moduleName] then
						--Spring.Echo("\tApplying weapon: "..moduleName)
						ApplyWeapon(commDefs[name], moduleName)
					else
						Spring.Echo("\tERROR: Weapon "..moduleName.." not found")
					end
				end
				if upgrades[moduleName] then
					--Spring.Echo("\tApplying upgrade: "..moduleName)
					if upgrades[moduleName].func then upgrades[moduleName].func(commDefs[name]) end	--apply upgrade function
				else
					Spring.Echo("\tERROR: Upgrade "..moduleName.." not found")
				end
			end
		end
		if config.name then
			commDefs[name].name = config.name
		end
		config.cost = config.cost or 0
		commDefs[name].buildcostmetal = commDefs[name].buildcostmetal + config.cost
		commDefs[name].buildcostenergy = commDefs[name].buildcostenergy + config.cost
		commDefs[name].buildtime = commDefs[name].buildtime + config.cost
	end
end

for name, config in pairs(commData) do
	ProcessComm(name, config)
end


--stress test: try every possible module to make sure it doesn't crash
local stressTestDef = {
	chassis = "armcom",
	name = "Quality Assurance",
	modules = {},
}
for name in pairs(upgrades) do
	stressTestDef.modules[#stressTestDef.modules+1] = name
end
ProcessComm("stresstestdef", stressTestDef)
commDefs.stresstestdef = nil

-- for easy testing; creates a comm with unitName testcomm
local testDef = {
	chassis = "armcom",
	name = "Skunkworker",
	modules = {"commweapon_disruptor", "commweapon_concussion", "weaponmod_high_frequency_beam", "module_resurrect", "module_improved_optics"},
}
ProcessComm("testcomm", testDef)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- postprocessing
for name, data in pairs(commDefs) do
	Spring.Echo("\tPostprocessing commtype: ".. name)
	-- set weapon1 range	- may need exception list in future depending on what weapons we add
	if data.weapondefs then
		local minRange = 999999
		local weaponNames = {}
		local wep1Name
		-- first check if the comm is actually using the weapon
		if data.weapons then
			for index, weaponData in pairs(data.weapons) do
				weaponNames[string.lower(weaponData.def)] = true
			end
		end
		for name, weaponData in pairs(data.weapondefs) do
			if (weaponData.range or 999999) < minRange and weaponNames[name] and not (string.lower(weaponData.name):find('fake')) then
				minRange = weaponData.range 
			end
		end
		-- lame-ass hack, because the obvious methods don't work
		for name, weaponData in pairs(data.weapondefs) do
			if string.lower(weaponData.name):find('fake') then
				weaponData.range = minRange
			end
		end
	end
	-- set wreck values
	for featureName,array in pairs(data.featuredefs or {}) do
		local mult = 0.4
		if featureName == "HEAP" then mult = 0.2 end
		array.metal = data.buildcostmetal * mult
		array.reclaimtime = data.buildcostmetal * mult
		array.damage = data.maxdamage
	end
	-- misc
	if data.canresurrect then data.resurrectspeed = data.workertime * 5/6 end
end


-- splice back into unitdefs
for name, data in pairs(commDefs) do
	UnitDefs[name] = data
end
