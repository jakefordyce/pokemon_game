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
M[10] = {
	text = "BEN: Hey don't sweat it, Rattata hits hard!",
	next = nil,
	has_choices = false
}
M[11] = {
	text = "SHOPKEEPER: Lookin' to shop Runes?",
	next = nil,
	has_choices = true
}
M[12] = {
	text = "SHOPKEEPER: Thank you, come again.",
	next = nil,
	has_choices = false
}
M[13] = {
	text = "BILL: Hey, you look like a skilled trainer. Want to battle a special pokemon? You'll be helping science!",
	next = nil,
	has_choices = true
}
M[14] = {
	text = "BILL: Oh... Let me know if you change your mind.",
	next = nil,
	has_choices = false
}
M[15] = {
	text = "BILL: Wow, you did it! Hey it looks like it dropped something interesting. You can keep that, it may come in handy.",
	next = nil,
	has_choices = false
}
M[16] = {
	text = "BILL: Don't feel bad, I designed it to be very powerful. Let me know if you'd like a rematch.",
	next = nil,
	has_choices = false
}
M[17] = {
	text = "OAK: Please come speak with me before you leave...",
	next = nil,
	has_choices = false
}
M[18] = {
	text = "MOVE TUTOR: Hello. Would you like me to help your pokemon improve their moves?",
	next = nil,
	has_choices = true
}
M[19] = {
	text = "MOVE TUTOR: Be safe out there.",
	next = nil,
	has_choices = false
}
M[20] = {
	text = "RECEPTIONIST: Welcome to Poke League. Are you interested in battling today?",
	next = nil,
	has_choices = true
}
M[21] = {
	text = "RECEPTIONIST: Come back whenever you are ready.",
	next = nil,
	has_choices = false
}
M[22] = {
	text = "RECEPTIONIST: Nice battle!",
	next = nil,
	has_choices = false
}
M[23] = {
	text = "RECEPTIONIST: Don't let it get you down. These trainers are some of the best.",
	next = nil,
	has_choices = false
}
M[24] = {
	text = "WHITNEY: Hi! I'm Whitney! Welcome to my gym. Is this your first time in one of the new gyms?",
	next = nil,
	has_choices = true
}
M[25] = {
	text = "WHITNEY: Oh my! It looks like you have defeated all of the other trainers here. You want to battle me? I'll warn you-I'm good!",
	next = nil,
	has_choices = false
}
M[26] = {
	text = "WHITNEY: Well things work a little differently here. In each gym you are only allowed to use Pokemon that match the gym's type.",
	next = 27,
	has_choices = false
}
M[27] = {
	text = "WHITNEY: For example: this is the Normal-type gym so you must only use Pokemon that are Normal type.",
	next = 28,
	has_choices = false
}
M[28] = {
	text = "WHITNEY: Sounds fun right? When they told me this was where all the new trainers were going I had to come too.",
	next = 29,
	has_choices = false
}
M[29] = {
	text = "WHITNEY: Oh a battle? Well you will have to defeat the rest of the trainers here first.",
	next = nil,
	has_choices = false
}
M[30] = {
	text = "WHITNEY: Hey Don't feel bad. I used to cry when I lost battles. Keep training and you'll get there.",
	next = nil,
	has_choices = false
}
M[31] = {
	text = "WHITNEY: ...Sniff...No I'm not crying. I've matured a lot. Here's your badge. You should be proud, very few trainers have one of those.",
	next = nil,
	has_choices = false
}
M[32] = {
	text = "VICTORIA: I already only use Normal-type Pokemon so this Gym challenge should be easy.",
	next = nil,
	has_choices = false
}
M[33] = {
	text = "VICTORIA: Oh, this may be harder than I thought...",
	next = nil,
	has_choices = false
}
M[34] = {
	text = "VICTORIA: See, no sweat!",
	next = nil,
	has_choices = false
}
return M