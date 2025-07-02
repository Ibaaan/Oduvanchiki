extends Node

enum Tile{
	WALL,
	EMPTY,
	FLOWER,
	SEED
}

func _generate_empty_matrix(n:int):
	# generates n*n matrix
	var grid := Array()
	var width := n
	var height := n
	
	grid.resize(height)
	for i in range(height):
		grid[i] = Array()
		grid[i].resize(width)
		for j in range(width):
			grid[i][j] = Tile.EMPTY
	
	return grid

func give_level(level: int):
	match level:
		#####################
		#  5 next tutorial  #
		#####################
		1:
			var matrix = _generate_empty_matrix(3)
			matrix[0][0] = Tile.WALL
			matrix[1][0] = Tile.WALL
			matrix[2][0] = Tile.WALL
			matrix[0][2] = Tile.WALL
			matrix[1][2] = Tile.WALL
			matrix[2][2] = Tile.WALL
			return matrix
		2:
			var matrix = _generate_empty_matrix(3)
			matrix[0][0] = Tile.WALL
			matrix[2][0] = Tile.WALL
			matrix[0][2] = Tile.WALL
			matrix[2][2] = Tile.WALL
			return matrix
		3:
			var matrix = _generate_empty_matrix(3)
			matrix[1][0] = Tile.WALL
			matrix[0][1] = Tile.WALL
			matrix[1][2] = Tile.WALL
			matrix[2][1] = Tile.WALL
			return matrix
		4:
			return _generate_empty_matrix(3)
		5:
			var matrix = _generate_empty_matrix(3)
			matrix[1][1] = Tile.WALL
			return matrix
		_:
			return _generate_empty_matrix(3)
