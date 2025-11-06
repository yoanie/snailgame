var cellSize = 32;

grid = mp_grid_create(0, 0, room_width/cellSize, room_height/cellSize, int64(cellSize), int64(cellSize));

mp_grid_add_instances(grid, obj_wall_parent, true);
mp_grid_add_instances(grid, obj_grid_parent, true);