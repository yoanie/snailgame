///@description Apply elevation/outline shaders & give tooltip if applicable

//If item on different elevation, apply elevation shaders and return
var deltaElevation = self.elevationLevel - obj_snail.elevationLevel;
if(deltaElevation != 0){
	if(deltaElevation > 0){
		shader_set(shd_ghost);
		shader_set_uniform_f(shdGhostParams, 1/(1+deltaElevation) );
	} else if(deltaElevation < 0){
		shader_set(shd_dim);
		shader_set_uniform_f(shdDimParams, (1.75) * (1/(1-deltaElevation)) );
	}
	draw_self();
	shader_reset();
	return;
}


var COLOR = c_yellow;

//If pickup allowed, give player tooltip on action
if(self.isSelfInteractable){
	//isSelfInteractable implies that item is within snail's item reach range
	//and that prereqs for each cursorState is met (see begin step)
	
	if(obj_cursorStateController.cursorState=="normal"){
		obj_cursorStateController.tooltip_left += "[Left-click] Pick up "+self.name+"\n";
	} else if(obj_cursorStateController.cursorState=="item"){
		COLOR = c_aqua;
		obj_cursorStateController.tooltip_left += "[Left-click] Combine "+self.name+" with "+self.item_combines_with_name+"\n";
	}
} else {
	//If not selecting item or out of reach, just return
	draw_self();
	return;
}

//SHADER IS BY MATHAROO
var THICKNESS = 4;
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
