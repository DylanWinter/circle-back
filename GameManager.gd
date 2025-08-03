extends Node

var enable_sound = true

var first_loop : bool = true

var player: Node                   = null
var closest_interactable_npc: Node = null

var is_in_conversation: bool = false

# meeting room stuff
var currentTurn = "boss"
var talkedToSiren = false
# known words
var wordFoundDict = {
	"RDC - Rival Demonic Company": false,
	"SDR - Successful Demon Ritual":false,
	"SCS - Styx Corporate Soulutions":false,
}

var convoDialogueDict = {
	"Something about apples" : load("res://dialogue/applesConvoExample.dialogue")
}

var found_key : bool = false
var door_open: bool = false
var start_meeting_early : bool = false

#timer
var timerMinutes = 999.0
var timerSeconds = 999.0


var talkedInKitchen = false
var peptalkedsadmanager = false

func reset_loop():
	closest_interactable_npc = null
	is_in_conversation = false
	found_key = false
	door_open = false
	start_meeting_early = false
	timerMinutes = 999.0
	timerSeconds = 999.0
	talkedToSiren=false
	talkedInKitchen=false
	
func full_reset():
	reset_loop()
	for term in wordFoundDict:
		wordFoundDict[term] = false
		
		
var curVisibleThings = []
func changeVisibility(node,boolean):
	node.visible = boolean
	
