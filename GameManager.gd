extends Node

var player: Node                   = null
var closest_interactable_npc: Node = null

var is_in_conversation: bool = false

# meeting room stuff
var endedConversation = false
var currentTurn = "boss"

# known words
var wordFoundDict = {
	"word1": false,
	"word2": false,
	"word3": false,
	"word4": false,
	"word5": false,
	"word6": false,	
}
