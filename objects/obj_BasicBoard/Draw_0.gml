/// @description Insert description here
// You can write your code in this editor

draw_self()

//if piece selected, highlight possible moves
if selected != -1 {
	draw_set_colour(c_green)
	draw_set_alpha(0.5)
	for (i = 0; i < BOARD_SIZE; i++) {
		for (j = 0; j < BOARD_SIZE; j++) {
			var square_to_highlight = ds_grid_get(square_grid, i, j)
			if is_legal_move(selected.square.x_pos, selected.square.y_pos, i, j, selected, false) {
				draw_rectangle(square_to_highlight.bbox_left, square_to_highlight.bbox_top, square_to_highlight.bbox_right, square_to_highlight.bbox_bottom, false)
			}
		}
	}
	draw_set_alpha(1)
}