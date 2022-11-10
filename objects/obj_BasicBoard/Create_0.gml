/// @description Setup pieces and coord system

BOARD_SIZE = 8

// create squares
square_grid = ds_grid_create(BOARD_SIZE, BOARD_SIZE)
//create all the squares at target positions
for (i = 0; i < BOARD_SIZE; i++) {
		for (j = 0; j < BOARD_SIZE; j++) {
			curr_square = instance_create_depth(x + coord_to_pixel_pos(i), y + coord_to_pixel_pos(j), 0, obj_Square)
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