extends Node2D

signal flower_pressed()	

enum Tile{
	WALL,
	EMPTY,
	FLOWER,
	SEED
}

#@onready var tile_map :TileMap = $TileMap
# @onready var interactive_tile := $InteractiveTileSet

var interactive_tile_tscn := preload("res://scenes/InteractiveTileSet.tscn")
var wall_tile_tscn := preload("res://scenes/wall.tscn")

var grid = Array()
var tiles:Dictionary

func set_grid_by_level(level:int):
	
	grid = HcLevels.give_level(level)
	print(grid)
	
	for x in range(len(grid)):
		for y in range(len(grid[x])):
			if grid[y][x] == Tile.EMPTY:
				var tile := interactive_tile_tscn.instantiate()
				tile.set_color(y + x)
				var v = Vector2(x, y)
				tile.global_position = v * 128
				add_child(tile)
				tiles[v] = tile
				tile.connect("flower_pressed", _on_flower_pressed)
			else:
				var tile := wall_tile_tscn.instantiate()
				var v = Vector2(x, y)
				tile.global_position = v * 128
				add_child(tile)
				tiles[v] = tile

func get_tiles() -> Dictionary:
	return tiles

func _on_flower_pressed(coords:Vector2) -> void:
	grid[coords.y][coords.x] = Tile.FLOWER
	
	# Not the best
	var len_grid := len(grid)
	for x in range(len_grid):
		var len_grid_x := len(grid[x]) 
		for y in range(len_grid_x):
			if grid[y][x] == Tile.FLOWER:
				tiles[Vector2(x, y)].show_flower()
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
