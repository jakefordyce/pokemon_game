local M = {}

M[1] = {
	text = "OAK: Hello. Thank you for coming all this way. We need all of the help we can get. Did anyone tell you why I asked you to come here?",
	next = nil,
	has_choices = true
}
M[2] = {
	text = "OAK: Right so let's get to it. You'll need some Pokemon before you go any further. Here, you can have your pick of these. Go ahead and take a full party, you'll need it.",
	next = nil,
	has_choices = false
}
M[3] = {
	text = "OAK: We need help with some research. No, it has nothing to do with the Pokedex. That's working just fine.",
	next = 4,
	has_choices = false
}
M[4] = {
	text = "OAK: Something is disrupting the Pokemon in the area. Their behavior, growth, and evolution have all been affected.",
	next = 5,
	has_choices = false
}
M[5] = {
	text = "OAK: It has also affected the ways in which Pokemon react to the elemental stones. Now that you know all of that, I'm sure you know what I'll say next.",
	next = 6,
	has_choices = false
}
M[6] = {
	text = "OAK: We need you to go out into the wild and see if you can find what is causing this disturbance.",
	next = 2,
	has_choices = false
}
M[7] = {
	text = "BEN: I like shorts. They're comfy and easy to wear.",
	next = nil,
	has_choices = false
}
M[8] = {
	text = "OAK: Good luck!",
	next = nil,
	has_choices = false
}
M[9] = {
	text = "BEN: Wow, you're tough!",
	next = nil,
	has_choices = false
}

return M