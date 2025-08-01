extends Node

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



#timer
var timerMinutes = 999.0
var timerSeconds = 999.0
