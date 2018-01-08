//yoma written by savin

//Flags:
//MET_YOMA_JUNGLE			: 1 if pc met Yoma
//YOMA_JUNGLE_TIMES_SEXED	: Number of times PC had sex with yoma


//meeting Yoma
public function yomaJungleMeeting():void 
{
	clearOutput();
	author("Savin");
	userInterface.showName("\nYoma");
	//userInterface.showBust("YOMA");
	if (flags["MET_YOMA_JUNGLE"] == undefined) {
		flags["MET_YOMA_JUNGLE"] = 1;
		yomaFirstTimeMeeting();
	} 
	yomaRepeatMeeting();
}

//meeting Yoma for the first time
public function yomaFirstTimeMeeting():void 
{
	clearOutput();
	output("yomaFirstTimemeet");
	this.clearMenu();
	this.addButton(0, "Shake it", yomaFirstTimeShakeHands);
	this.addButton(1,"Don't", yomaFirstTimeDontShakeHands);
}

//[Shake it]
public function yomaFirstTimeShakeHands():void 
{
	output("yomaShakeHands");
	clearMenu();
	addButton(0, "next", mainGameMenu);
}

//[Don't]
public function yomaFirstTimeDontShakeHands():void 
{
	output("yomaDontShakeHands");
	
}


public function yomaRepeatMeeting():void 
{
	
}

public function yomaMainTalkMenu():void{
	this.clearMenu();
	this.addButton(0, "Appearance", yomaAppearanceOutput);
	this.addButton(1, "Talk", yomaMainTalkTalkMenu);
	if(pc.lust() >= 33) this.addButton(2,"Sex",yomaSexyTime);
	else this.addDisabledButton(2,"Sex","Sex","You aren’t turned on enough for sex.");
	this.addButton(3,"Hugs", yomaFirstTimeDontShakeHands);
	this.addButton(14,"Leave",mainGameMenu);
}

public function yomaAppearanceOutput():void 
{
	clearOutput();
	output("Yoma is a 5 foot and 3 inch tall dark-skinned android with big, pointed fennec fox ears and a long, fluffy tail sprouting from just above his soft, well proportioned ass. His fur and chin-length dreadlocks are a pale, platinum blond.")
	output("\n\nHe has solid glowing green eyes with only a paler line marking where he’s actually looking. Combined with the grooves running down his cheeks, it’s very apparent that he’s not organic.")
	output("\nHe’s wearing a red, high-necked but armless cropped shirt that leaves his flat stomach exposed, with matching flared shorts that do nothing to cover his wide hips. The android has no noticeable muscle tone and is remarkably thin waisted.")
	output("\n\nYou know that his shorts cover a")
	if (flags["YOMA_JUNGLE_TIMES_SEXED"] != undefined) output(" human");
	output(" pussy lying between his legs");
	if (flags["YOMA_JUNGLE_TIMES_SEXED"] != undefined) {
		output(" with a heart shaped patch of pubic hair above it  as well as a welcoming asshole.");
	} else {
		output(" as well as an asshole.")
	}
	output("\n\nHe must have caught you checking him out, because he tugs at his shirt collar and jokingly fans himself with his other hand.")
	this.clearMenu();
	this.addButton(0, "Next", yomaMainTalkMenu);
}

public function yomaMainTalkTalkMenu():void 
{
	
}


public function yomaSexyTime():void
{
	
}