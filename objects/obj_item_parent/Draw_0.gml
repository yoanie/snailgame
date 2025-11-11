///@description Apply outline shaders

if(!self.isMouseHovering || distance_to_object(obj_snail) > 64){ 
	draw_self(); 
	return; 
}

//SHADER IS BY MATHAROO
var THICKNESS = 4;
var COLOR = c_yellow;
var ACCURACY = 16;
var TOLERANCE = 0;

var _spr = sprite_index;

shader_set(sh_outline);

var _tex = sprite_get_texture(_spr, image_index);

var _w = texture_get_texel_width(_tex);
var _h = texture_get_texel_height(_tex);

shader_set_uniform_f(uni_size, _w, _h);

shader_set_uniform_f(uni_thick, THICKNESS);

shader_set_uniform_f(uni_color, color_get_red(COLOR)/255, color_get_green(COLOR)/255, color_get_blue(COLOR)/255);

var acc = ACCURACY;

shader_set_uniform_f(uni_acc, acc);

var tol = TOLERANCE;

shader_set_uniform_f(uni_tol, tol);

var uvs = sprite_get_uvs(_spr, image_index);

shader_set_uniform_f(uni_uvs, uvs[0], uvs[1], uvs[2], uvs[3]);


draw_self();
shader_reset();
