var cellSize = 32;

grid = mp_grid_create(0, 0, room_width/cellSize, room_height/cellSize, cellSize, cellSize);

mp_grid_add_instances(grid, obj_wall_parent, false)