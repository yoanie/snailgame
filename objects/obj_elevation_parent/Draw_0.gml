
var deltaElevation = self.elevationLevel - obj_snail.elevationLevel;
if(deltaElevation > 0){
	shader_set(shd_transparency);
	shader_set_uniform_f(shdTransParams, 1/(1+deltaElevation) );
} else if(deltaElevation < 0){
	shader_set(shd_dim);
	shader_set_uniform_f(shdDimParams, (1.75) * (1/(1-deltaElevation)) );
}
draw_self();
shader_reset();
