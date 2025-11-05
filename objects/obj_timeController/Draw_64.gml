///@description FOR NOW: display time as text

//meta minute should always be two digits to display as in real life
var tempMetaMinute = string(metaTimeMinutes);
if(metaTimeMinutes < 10){
	tempMetaMinute = "0" + tempMetaMinute;
}
//if am/pm is enabled, simply append either am/pm to the end of tempMetaMinute.
if(self.AMPM){
	tempMetaMinute = tempMetaMinute + (metaTimeHours < 12 ? "AM" : "PM");
}


//if am/pm is enabled, meta hour shouldn't be 13 or more.
var tempMetaHour;
if(self.AMPM){
	tempMetaHour = string((metaTimeHours-1)%12 + 1);
	if(metaTimeHours == 0){
		tempMetaHour = "12";
	}
} else {
	tempMetaHour = string(metaTimeHours);
	
	//in 24 hours mode, meta hours should always be 2 digits.
	if(metaTimeHours < 10){
		tempMetaHour = "0" + tempMetaHour;
	}
}




draw_text(0,0, "Time: " + tempMetaHour + ":" + tempMetaMinute);
