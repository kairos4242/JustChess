/// @description Setup pieces and coord system

BOARD_SIZE = 8

// set up data
square_grid = ds_grid_create(BOARD_SIZE, BOARD_SIZE)
black_piece_list = ds_list_create()
white_piece_list = ds_list_create()
selected = -1
last_moved = -1
players_list = ds_list_create()
ds_list_add(players_list, "White")
ds_list_add(players_list, "Black")
turn_queue = ds_queue_create()//will this even get used? Is it necessary? Could be helpful down the line for turn order shenanigans
ds_queue_enqueue(turn_queue, "White")
ds_queue_enqueue(turn_queue, "Black")


//create all the squares at target positions
for (i = 0; i < BOARD_SIZE; i++) {
		for (j = 0; j < BOARD_SIZE; j++) {
			curr_square = instance_create_depth(x + coord_to_pixel_pos(i), y + coord_to_pixel_pos(j), 100, obj_Square)
			with curr_square {
				x_pos = other.i
				y_pos = other.j
			}
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
			if i < BOARD_SIZE - 1 curr_square.right_neighbor = ds_grid_get(square_grid, i + 1, j)
		}
}

//create black pawns
for (i = 0; i < BOARD_SIZE; i++) {
	create_piece(i, 1, obj_Pawn, "Black", "Down")
}

//create white pawns
for (i = 0; i < BOARD_SIZE; i++) {
	create_piece(i, BOARD_SIZE - 2, obj_Pawn, "White", "Up")
}

//create black rooks
create_piece(0, 0, obj_Rook, "Black", "Down")
create_piece(BOARD_SIZE - 1, 0, obj_Rook, "Black", "Down")

//create white rooks
create_piece(0, BOARD_SIZE - 1, obj_Rook, "White", "Up")
create_piece(BOARD_SIZE - 1, BOARD_SIZE - 1, obj_Rook, "White", "Up")

//create kings
create_piece(4, 0, obj_King, "Black", "Down")
create_piece(4, BOARD_SIZE - 1, obj_King, "White", "Up")

//create queens
create_piece(3, 0, obj_Queen, "Black", "Down")
create_piece(3, BOARD_SIZE - 1, obj_Queen, "White", "Up")

//create bishops
create_piece(2, 0, obj_Bishop, "Black", "Down")
create_piece(5, 0, obj_Bishop, "Black", "Down")
create_piece(2, BOARD_SIZE - 1, obj_Bishop, "White", "Up")
create_piece(5, BOARD_SIZE - 1, obj_Bishop, "White", "Up")

//create knights
create_piece(1, 0, obj_Knight, "Black", "Down")
create_piece(6, 0, obj_Knight, "Black", "Down")
create_piece(1, BOARD_SIZE - 1, obj_Knight, "White", "Up")
create_piece(6, BOARD_SIZE - 1, obj_Knight, "White", "Up")