extends Node

var first_loop : bool = true

var player: Node                   = null
var closest_interactable_npc: Node = null

var is_in_conversation: bool = false

# meeting room stuff
var currentTurn = "boss"

# known words
var wordFoundDict = {
	"word1": false,
	"word2": false,
	"word3": false
}

var convoDialogueDict = {
	"Something about apples" : load("res://dialogue/applesConvoExample.dialogue")
}

var found_key : bool = false
var door_open: bool = false

#timer
var timerMinutes = 999.0
var timerSeconds = 999.0
