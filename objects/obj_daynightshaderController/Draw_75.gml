///@description Draw Application Surface

shader_set(shader);
shader_set_uniform_f_array(u_col, color_mix);
draw_surface(application_surface, 0, 0);
shader_reset();