extends Node2D

signal flower_pressed()	

enum Tile{
	WALL,
	EMPTY,
	FLOWER,
	SEED
}

@onready var tile_map :TileMap = $TileMap
# @onready var interactive_tile := $InteractiveTileSet

var interactive_tile_tscn := preload("res://InteractiveTileSet.tscn")
var grid = Array()
var tiles:Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var width := 5
	var height := 5
	grid.resize(height)
	for i in range(height):
		grid[i]=Array()
		grid[i].resize(width)
		for j in range(width):
			grid[i][j] = Tile.EMPTY
	
	grid[0][0] = Tile.WALL
	
	
	for x in range(len(grid)):
		for y in range(len(grid[x])):
			if grid[y][x] == Tile.EMPTY:
				var tile := interactive_tile_tscn.instantiate()
				var v = Vector2(x, y)
				tile.global_position = v * 128
				add_child(tile)
				tiles[v] = tile
				tile.connect("flower_pressed", _on_flower_pressed)
	
	
func get_grid():
	return grid

func get_tiles() -> Dictionary:
	return tiles

func _on_flower_pressed(coords:Vector2) -> void:
	grid[coords.y][coords.x] = Tile.FLOWER
	#print(grid)
	flower_pressed.emit()

func place_seeds(direction:Vector2):
	
	var len_grid := len(grid)
	for x in range(len_grid):
		var len_grid_x := len(grid[x]) 
		for y in range(len_grid_x):
			
			if grid[y][x] != Tile.FLOWER:
				continue
				
			var v = Vector2(x, y) + direction
			
			while 0 <= v.x and v.x < len_grid_x and 0 <= v.y and v.y < len_grid:
				
				if grid[v.y][v.x] == Tile.WALL:
					break
					
				print("Coord", v)
					
				grid[v.y][v.x] = Tile.SEED
				tiles[v].show_seed()
				
				v += direction
	print_grid()

func print_grid():
	print()
	print("GRID")
	for x in range(len(grid)):
		var res :String = ""
		for y in range(len(grid[x])):
			res += str(grid[x][y]) + " "
		print(res)
	print()


func is_fulled():
	var len_grid := len(grid)
	
	for x in range(len_grid):
		var len_grid_x := len(grid[x]) 
		for y in range(len_grid_x):
			if grid[y][x] == Tile.EMPTY:
				print(grid[y][x])
				return false
	return true
