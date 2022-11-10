/// @description Setup pieces and coord system

BOARD_SIZE = 8

// set up data
square_grid = ds_grid_create(BOARD_SIZE, BOARD_SIZE)
black_piece_list = ds_list_create()
white_piece_list = ds_list_create()
selected = -1


//create all the squares at target positions
for (i = 0; i < BOARD_SIZE; i++) {
		for (j = 0; j < BOARD_SIZE; j++) {
			curr_square = instance_create_depth(x + coord_to_pixel_pos(i), y + coord_to_pixel_pos(j), 100, obj_Square)
			ds_grid_add(square_grid, i, j, curr_square)
		}
}

//link all the squares
for (i = 0; i < BOARD_SIZE; i++) {
		for (j = 0; j < BOARD_SIZE; j++) {
			curr_square = ds_grid_get(square_grid, i, j)
			//set neighbors
			if j > 0 curr_square.top_neighbor = ds_grid_get(square_grid, i, j - 1)
			if j < BOARD_SIZE - 1 curr_square.bottom_neighbor = ds_grid_get(square_grid, i, j + 1)
			if i > 0 curr_square.left_neighbor = ds_grid_get(square_grid, i - 1, j)
			if i < BOARD_SIZE - 1 curr_square.bottom_neighbor = ds_grid_get(square_grid, i + 1, j)
		}
}

//create black pawns
for (i = 0; i < BOARD_SIZE; i++) {
	current_pawn = instance_create_depth(x + coord_to_pixel_pos(i), y + coord_to_pixel_pos(1), 50, obj_Pawn)
	with current_pawn {
		controller = "Black" 
		board = other
	}
	ds_list_add(black_piece_list, current_pawn)
	with ds_grid_get(square_grid, i, 1) {
		piece = other.current_pawn
	}
}

//create white pawns
for (i = 0; i < BOARD_SIZE; i++) {
	current_pawn = instance_create_depth(x + coord_to_pixel_pos(i), y + coord_to_pixel_pos(BOARD_SIZE - 2), 50, obj_Pawn)
	with current_pawn {
		controller = "White" 
		board = other
	}
	ds_list_add(white_piece_list, current_pawn)
	with ds_grid_get(square_grid, i, BOARD_SIZE - 2) {
		piece = other.current_pawn
	}
}