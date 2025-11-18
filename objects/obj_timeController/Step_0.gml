///@description calculate time

if(instance_exists(obj_menu_pause) && obj_menu_pause.menuIsUp){
	return;
}

//advance time
currentTime += 1 / game_get_speed(gamespeed_fps);

//the ingame minutes count should only display every x minutes:
var minMinutesChange = 5;

metaTimeHours = (7 + floor((conversionRatio * currentTime)/60)) % 24;

metaTimeMinutes = minMinutesChange*floor(((conversionRatio * currentTime)%60)/minMinutesChange);
