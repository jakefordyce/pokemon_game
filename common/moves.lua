local M = {}

--List of all of the available moves

effects = {}
effects[0] = {}
effects[0]["id"] = 1
effects[0]["target"] = 1
effects[0]["param1"] = 100
effects[0]["param2"] = 1

M[1] = {
	["name"] = "tackle",
	["effects"] = effects,
	["cooldown"] = 0,
	["default"] = true,
	["type"] = 1,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		return "Deals "..damage.."% of Attack to target enemy."
	end
}


return M