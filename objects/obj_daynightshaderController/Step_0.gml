///@description Mix Colors

//get key times (time ranges from 0 to 1 (midnight to midnight)
var time = (obj_timeController.metaTimeHours + obj_timeController.metaTimeMinutes/60)/24;

key_previous = min(floor(time * number_of_key_times), number_of_key_times - 1);
key_next = (key_previous + 1) mod number_of_key_times;

//mix colors
var lerpAmount = (time - key_previous/number_of_key_times) * number_of_key_times;
color_mix = [lerp(color[key_previous,0], color[key_next,0], lerpAmount), 
			 lerp(color[key_previous,1], color[key_next,1], lerpAmount), 
			 lerp(color[key_previous,2], color[key_next,2], lerpAmount)];


