local M = {}
local common_moves = require "common/moves"

-- this should only be used for hp, attack, defense, spattack, spdefense
function M.stat_by_level(pokedex, stat, level)
	calc_stat = (5 + (M[pokedex][stat] * level * 0.01) * 2)
	if stat=="hp" then
		calc_stat = calc_stat * 20
	end
	
	return math.ceil(calc_stat)
end

function M.known_moves_by_level(pokedex, level)
	known_moves = {}
	for i, m in ipairs(M[pokedex].moves) do
		if m.level <= level then
			table.insert(known_moves, { id = m.id, level = 0})
		end
	end
	return known_moves
end

-- returns a table with up to 4 numbers designating the id of the known moves which are to be equipped
function M.equipped_moves_by_level(pokedex, level)
	known_moves = M.known_moves_by_level(pokedex, level)

	equipped_moves = { nil, nil, nil, nil }
	
	local move_rotation = 2
	for i, m in ipairs(known_moves) do
		if common_moves[m.id].default == true then
			equipped_moves[1] = i
		else
			equipped_moves[move_rotation] = i

			move_rotation = move_rotation + 1
			if move_rotation > 4 then
				move_rotation = 2
			end
		end
	end
	
	return equipped_moves
end

function M.exp_reward_by_level(level)
	return math.ceil(math.pow(1.05, (level - 1)) * 20)
end

function M.exp_to_next_level(level)
	--return math.ceil(math.pow(1.05, (level - 1)) * (50 + level) / 50 * 200)
	return math.ceil(math.pow(1.05, (level - 1)) * (50 + level) / 50 * 10) -- for testing
end

M.base_crit_chance = 5
M.base_crit_damage = 100

--List of all pokemon by pokedex ID.
moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 9}

M[1] = {
	name = "bulbasaur",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves,
	evolutions = {
		{target = 2, stone_type1 = 11, stone_cost1 = 20}
	}
}
M[2] = {
	name = "ivysaur",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves,
	evolutions = {
		{target = 3, stone_type1 = 11, stone_cost1 = 20}
	}
}
M[3] = {
	name = "venusaur",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 12}

M[4] = {
	name = "charmander",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 9,
	moves = moves,
	evolutions = {
		{target = 5, stone_type1 = 9, stone_cost1 = 20}
	}
}
M[5] = {
	name = "charmeleon",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 9,
	moves = moves,
	evolutions = {
		{target = 6, stone_type1 = 9, stone_cost1 = 10, stone_type2 = 8, stone_cost2 = 10}
	}
}
M[6] = {
	name = "charizard",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 8,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 13}

M[7] = {
	name = "squirtle",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}

M[8] = {
	name = "wartortle",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}

M[9] = {
	name = "blastoise",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}
moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}

M[10] = {
	name = "caterpie",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 6,
	type2 = 6,
	moves = moves
}
M[11] = {}
M[12] = {}
M[13] = {
	name = "weedle",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 6,
	type2 = 4,
	moves = moves
}
M[14] = {}
M[15] = {}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 16}
M[16] = {
	name = "pidgey",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 3,
	type2 = 3,
	moves = moves
}
M[17] = {}
M[18] = {}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 14}
M[19] = {
	name = "rattata",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 1,
	type2 = 1,
	moves = moves
}
M[20] = {}
M[21] = {}
M[22] = {}
M[23] = {}
M[24] = {}
M[25] = {}
M[26] = {}
M[27] = {}
M[28] = {}
M[29] = {}
M[30] = {}
M[31]={}
M[32]={}
M[33]={}
M[34]={}
M[35]={}
M[36]={}
M[37]={}
M[38]={}
M[39]={}
M[40]={}
M[41]={}
M[42]={}
M[43]={}
M[44]={}
M[45]={}
M[46]={}
M[47]={}
M[48]={}
M[49]={}
M[50]={}
M[51]={}
M[52]={}
M[53]={}
M[54]={}
M[55]={}
M[56]={}
M[57]={}
M[58]={}
M[59]={}
M[60]={}
M[61]={}
M[62]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 18}
M[63] = {
	name = "abra",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 13,
	type2 = 13,
	moves = moves
}
M[64]={}
M[65]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 19}
M[66] = {
	name = "machop",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 2,
	type2 = 2,
	moves = moves
}
M[67]={}
M[68]={}
M[69]={}
M[70]={}
M[71]={}
M[72]={}
M[73]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 21}
M[74] = {
	name = "geodude",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 5,
	type2 = 5,
	moves = moves
}
M[75]={}
M[76]={}
M[77]={}
M[78]={}
M[79]={}
M[80]={}
M[81]={}
M[82]={}
M[83]={}
M[84]={}
M[85]={}
M[86]={}
M[87]={}
M[88]={}
M[89]={}
M[90]={}
M[91]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 20}
M[92] = {
	name = "gastly",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 15,
	type2 = 4,
	moves = moves
}
M[93]={}
M[94]={}
M[95]={}
M[96]={}
M[97]={}
M[98]={}
M[99]={}
M[100]={}
M[101]={}
M[102]={}
M[103]={}
M[104]={}
M[105]={}
M[106]={}
M[107]={}
M[108]={}
M[109]={}
M[110]={}
M[111]={}
M[112]={}
M[113]={}
M[114]={}
M[115]={}
M[116]={}
M[117]={}
M[118]={}
M[119]={}
M[120]={}
M[121]={}
M[122]={}
M[123]={}
M[124]={}
M[125]={}
M[126]={}
M[127]={}
M[128]={}
M[129]={}
M[130]={}
M[131]={}
M[132]={}
M[133]={
	name = "eevee",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 1,
	type2 = 1,
	moves = moves,
	evolutions = {
		{target = 134, stone_type1 = 10, stone_cost1 = 30},
		{target = 135, stone_type1 = 12, stone_cost1 = 30},
		{target = 136, stone_type1 = 9, stone_cost1 = 30}
	}
}
M[134]={
	name = "vaporeon",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}
M[135]={
	name = "jolteon",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 12,
	type2 = 12,
	moves = moves
}
M[136]={
	name = "flareon",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 9,
	moves = moves
}
M[137]={}
M[138]={}
M[139]={}
M[140]={}
M[141]={}
M[142]={}
M[143]={}
M[144]={}
M[145]={}
M[146]={}
M[147]={}
M[148]={}
M[149]={}
M[150]={}
M[151]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 22}
M[152] = {
	name = "chikorita",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves
}
M[153]={}
M[154]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 23}
M[155] = {
	name = "cyndaquil",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 9,
	moves = moves
}
M[156]={}
M[157]={}
M[158] = {
	name = "totodile",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}
M[159]={}
M[160]={}
M[161]={}
M[162]={}
M[163]={}
M[164]={}
M[165]={}
M[166]={}
M[167]={}
M[168]={}
M[169]={}
M[170]={}
M[171]={}

moves = {
	{["level"] = 1, ["id"] = 1},
	{["level"] = 1, ["id"] = 15}
}
M[172] = {
	name = "pichu",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 12,
	type2 = 12,
	moves = moves
}

moves = {
	{["level"] = 1, ["id"] = 1},
	{["level"] = 1, ["id"] = 2}
}
M[173] = {
	name = "cleffa",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 1,
	type2 = 1,
	moves = moves
}
M[174]={}
M[175]={}
M[176]={}
M[177]={}
M[178]={}
M[179]={}
M[180]={}
M[181]={}
M[182]={}
M[183]={}
M[184]={}
M[185]={}
M[186]={}
M[187]={}
M[188]={}
M[189]={}
M[190]={}
M[191]={}
M[192]={}
M[193]={}
M[194]={}
M[195]={}
M[196]={}
M[197]={}
M[198]={}
M[199]={}
M[200]={}
M[201]={}
M[202]={}
M[203]={}
M[204]={}
M[205]={}
M[206]={}
M[207]={}
M[208]={}
M[209]={}
M[210]={}
M[211]={}
M[212]={}
M[213]={}
M[214]={}
M[215]={}
M[216]={}
M[217]={}
M[218]={}
M[219]={}
M[220]={}
M[221]={}
M[222]={}
M[223]={}
M[224]={}
M[225]={}
M[226]={}
M[227]={}
moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 7}
moves[3] = {["level"] = 1, ["id"] = 8}
M[228] = {
	name = "houndour",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 15,
	moves = moves
}
M[229]={}
M[230]={}
M[231]={}
M[232]={}
M[233]={}
M[234]={}
M[235]={}
M[236]={}
M[237]={}
M[238]={}
M[239]={}
M[240]={}
M[241]={}
M[242]={}
M[243]={}
M[244]={}
M[245]={}
M[246]={}
M[247]={}
M[248]={}
M[249]={}
M[250]={}
M[251]={}
M[252]={}
M[253]={}
M[254]={}
M[255]={}
M[256]={}
M[257]={}
M[258]={}
M[259]={}
M[260]={}
M[261]={}
M[262]={}
M[263]={}
M[264]={}
M[265]={}
M[266]={}
M[267]={}
M[268]={}
M[269]={}
M[270]={}
M[271]={}
M[272]={}
M[273]={}
M[274]={}
M[275]={}
M[276]={}
M[277]={}
M[278]={}
M[279]={}
moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}

M[280] = {
	name = "ralts",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 13,
	type2 = 13,
	moves = moves
}
M[281]={}
M[282]={}
M[283]={}
M[284]={}
M[285]={}
M[286]={}
M[287]={}
M[288]={}
M[289]={}
M[290]={}
M[291]={}
M[292]={}
M[293]={}
M[294]={}
M[295]={}
M[296]={}
M[297]={}
M[298]={}
M[299]={}
M[300]={}
M[301]={}
M[302]={}
M[303]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 13}

M[304] = {
	name = "aron",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 7,
	type2 = 5,
	moves = moves
}
M[305]={}
M[306]={}
M[307]={}
M[308]={}
M[309]={}
M[310]={}
M[311]={}
M[312]={}
M[313]={}
M[314]={}
M[315]={}
M[316]={}
M[317]={}
M[318]={}
M[319]={}
M[320]={}
M[321]={}
M[322]={}
M[323]={}
M[324]={}
M[325]={}
M[326]={}
M[327]={}
M[328]={}
M[329]={}
M[330]={}
M[331]={}
M[332]={}
M[333]={}
M[334]={}
M[335]={}
M[336]={}
M[337]={}
M[338]={}
M[339]={}
M[340]={}
M[341]={}
M[342]={}
M[343]={}
M[344]={}
M[345]={}
M[346]={}
M[347]={}
M[348]={}
M[349]={}
M[350]={}
M[351]={}
M[352]={}
M[353]={}
M[354]={}
M[355]={}
M[356]={}
M[357]={}
M[358]={}
M[359]={}
M[360]={}
M[361]={}
M[362]={}
M[363] = {
	name = "spheal",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 14,
	type2 = 14,
	moves = moves
}
M[364]={}
M[365]={}
M[366]={}
M[367]={}
M[368]={}
M[369]={}
M[370]={}
M[371]={}
M[372]={}
M[373]={}
M[374]={}
M[375]={}
M[376]={}
M[377]={}
M[378]={}
M[379]={}
M[380]={}
M[381]={}
M[382]={}
M[383]={}
M[384]={}
M[385]={}
M[386]={}

return M