extends Node

var current_level = 1

var level_1 = [
	[1,0,3,2,2,3,0,1],
	[0,1,0,4,4,0,1,0],
]

var level_2 = [
	[5,2,3,4,4,3,2,5],
	[0,0,0,0,0,0,0,0],
	[0,0,3,5,5,3,0,0],
	[0,0,0,0,0,0,0,0],
	[1,1,1,1,1,1,1,1]
]

var level_3 = [
	[5,1,5,1,1,5,1,5],
	[1,2,3,4,4,3,2,1],
	[0,0,3,2,2,3,0,0],
	[2,2,3,4,4,3,2,2],
	[0,0,1,1,1,1,0,0],
	[5,0,5,0,0,5,0,5],
	[1,3,2,4,4,2,3,1]
]
var levels = [level_1, level_2, level_3]

func get_current_level():
	print(levels[0])
	return levels[current_level - 1]
