
//because this is a post-processing shader, we want to 
//have control over when we apply this shader.
application_surface_draw_enable(false);
//gpu_set_blendenable(false);

shader = shd_daynight;
u_col  = shader_get_uniform(shader, "col");

//color vars
color_mix = -1;
color[0,0] = undefined;
key_previous = -1;
key_next = -1;

//add key times (because we want to interpolate colors)
color[0,0] = 010; color[0,1] = 070; color[0,2] = 200; //midnight
color[1,0] = 250; color[1,1] = 235; color[1,2] = 200; //dawn
color[2,0] = 250; color[2,1] = 240; color[2,2] = 200; //later afternoon

//scale to be 0 to 1 for usability
for(var i = 0; i < array_length(color); i++){
	for(var j = 0; j < array_length(color[0]); j++){
		color[i,j] /= 255;
	}
}

number_of_key_times = array_length(color);

