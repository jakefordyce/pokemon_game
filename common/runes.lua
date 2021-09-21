local M = {}

M.stat_names = {
	"Attack",
	"HP",
	"Defense",
	"Speed",
	"Accuracy",
	"Resistance",
	"Crit Chance",
	"Crit Dmg",
	"Attack",
	"HP",
	"Defense"
}

function M.substat_value(stat, rank)
	value = rank * 5
	return value
end

function M.mainstat_value(stat, level)
	value = level * 5
	if stat == 1 or stat == 2 or stat == 3 then
		value = value * 2
	end
	if stat == 2 then
		value = value * 20
	end
	return value
end

function M.description(rune)
	desc_text = "" .. M.stat_names[rune.main_stat] .. " + " .. M.mainstat_value(rune.main_stat, rune.level)
	if rune.main_stat > 6 then
		desc_text = desc_text .. "%"
	end
	for i, ss in ipairs(rune.substats) do
		desc_text = desc_text .. "\n" .. M.stat_names[ss.stat].." + " .. M.substat_value(ss.stat, ss.rank)
		if ss.stat > 6 then
			desc_text = desc_text .. "%"
		end
	end

	return desc_text
end

return M