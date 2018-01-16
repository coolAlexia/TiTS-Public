//yoma written by savin

/*Flags:
	MET_YOMA_JUNGLE			: 1 if pc met Yoma
	YOMA_JUNGLE_TIMES_SEXED	: Number of times PC had sex with yoma
	YOMA_JUNGLE_TALKED_ABOUT_HIM:	how often pc asked about yoma
	YOMA_JUNGLE_GAMES_PLAYED:
	YOMA_JUNGLE_TALKED_MASTER
*/


//meeting Yoma
public function yomaJungleHeader(nude:Boolean = false):void {
	author("Savin");
	userInterface.showName("\nYoma");
	if(!nude)
		userInterface.showBust("YOMA");
	else
		userInterface.showBust("YOMA_NUDE");
}

public function yomaJungleMeeting():void 
{
	clearOutput();
	yomaJungleHeader();
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
	yomaJungleHeader();
	
	output("You’re making your way through the jungle when you hear a crack behind you. Whipping around suddenly, you see a figure, too far away to make out in perfect detail but not far over five feet tall, slowly lifting their foot back off of a snapped twig. It’s definitely not a native, you realise - unless you’ve somehow missed a species with big fennec fox ears and tails.");
	output("\n\n“Damn it,” they - no, he, that’s a distinctly rich, masculine voice - say, “I really must ask master for less clumsy feet.”");
	output("\n\nFor a moment, you don’t say anything, but then decide that since he doesn’t seem to have registered your presence at all, you ought to call out a greeting.");
	output("\n\n“Oh! Hello there!” is the surprised response, and now that he’s talking a little louder, you can make out a rather posh sounding Terran accent: you’d guess British if pushed. “Who are you?” he asks.");
	output("\n\nYou introduce yourself, but not without asking for his name back too.");
	output("\n\nHe moves closer, extending a slender hand. “Well, [pc.name], I will assume you are asking for what I am addressed as, and not my serial number...” Indeed, on closer look, the ridges on his face and his glowing green eyes point him out as an android. “It is Yoma.”");
	output("\n\nHis hand hasn’t dropped yet, it looks like he wants you to shake it.");

	this.clearMenu();
	this.addButton(0, "Shake it", yomaFirstTimeShakeHands);
	this.addButton(1,"Don't", yomaFirstTimeDontShakeHands);
}

//[Shake it]
public function yomaFirstTimeShakeHands():void 
{
	clearOutput();
	yomaJungleHeader();
	
	output("yomaShakeHands");
	
	clearMenu();
	addButton(0, "Next", yomaMainTalkMenu);
}

//[Don't]
public function yomaFirstTimeDontShakeHands():void 
{
	clearOutput();
	yomaJungleHeader();
	
	output("He waits another five, ten seconds with his hand outstretched before dropping it to his side. ");
	output("\n\n“As uncivilised as the natives...? Brilliant.” His face twists into a slight snarl, showing his artificially white and wicked sharp canines in stark contrast to his dark skin.");
	output("\n\nYou ");
/*
{//If Misch or Kind: apologise, saying}
{say}
output("\n\n you’re just not a very touchy person ");
{//IfPC Misch or Kind: and that you didn’t mean to offend him}
	output("\n\n.");
	*/
	output("\n\nHe sighs, fluffy pale blond tail drooping behind him. “That is fair. Just… do not go trying to jump me like they have been.”");
	output("\n\nYou nod.");
	output("\n\n“You would probably be disappointed too, Creator knows they have been.”");
	output("\n\nWait, what? Disappointed why?");
	output("\n\nHe must have noticed your confusion. “Shall we say that while my master prefers the company of men…” he pauses, flicking a platinum blond dreadlock behind a large ear, “he would much rather fuck pussy.”");
	output("\n\nHuh, looks like you’ve got a robotic cunt boy here.");
	output("\n\nIs there anything you want to talk about?");

	clearMenu();
	addButton(0, "Next", yomaMainTalkMenu);
}

public function yomaRepeatMeeting():void 
{
	clearOutput();
	yomaJungleHeader();
	
	output("You’re walking through the jungle when a familiar voice calls out: “Greetings, [pc.name]!” ");
	output("\n\nYoma is standing a several feet behind you, hands on hips.");
	output("\n\nDo you want to stay and talk?");
	
	clearMenu();
	addButton(0, "Stay", yomaMainTalkMenu);
	addButton(1, "Leave", yomaRepeatMeetingLeave);
	
}

public function yomaRepeatMeetingLeave():void {
	clearOutput();
	yomaJungleHeader();
	
	output("You apologise to Yoma, saying you’re busy.");
	output("\n\n“No problem, I will see you around!” And without further ado, he’s gone again, vanishing into the jungle.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function yomaMainTalkMenu():void{
	yomaJungleHeader();
	
	this.clearMenu();
	this.addButton(0, "Appearance", yomaAppearanceOutput);
	this.addButton(1, "Talk", yomaMainTalkTalkMenu);
	if (pc.lust() >= 33)
		this.addButton(2,"Sex",yomaSexyTime);
	else 
		this.addDisabledButton(2,"Sex","Sex","You aren’t turned on enough for sex.");
	this.addButton(3,"Hugs", yomaHugs);
	this.addButton(14,"Leave",yomaRepeatMeetingLeave);
}

public function yomaAppearanceOutput():void 
{
	clearOutput();
	yomaJungleHeader();
	
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
	clearOutput();
	yomaJungleHeader();
	
	output("You tell Yoma that you’re interested in learning more about him.");
	output("\n\n“Of course,” he says, tail swishing from side to side. “What do you want to know?”");

	clearMenu();
	addButton(0, "Him", yomaTalkTalkHim);
	addButton(1, "Master?", yomaTalkTalkMaster);
	addButton(2, "Mengha", yomaTalkTalkMengha);
	
	addButton(3, "Probe?", yomaTalkTalkProbe);
	
	if (flags["YOMA_JUNGLE_TALKED_MASTER"] != undefined)
	{
			if (silly)
				addButton(4, "Game", yomaTalkTalkGame, undefined, "Game", "“I’m sure nothing could go wrong with playing D&D in the middle of a jungle”");
			else
				addButton(4, "Game", yomaTalkTalkGame);
	}
	
	
	addButton(14, "Back", yomaMainTalkMenu);
}

public function yomaTalkTalkHim(): void {
	clearOutput();
	yomaJungleHeader();
	
	output("You ask him about himself.");
	output("\n\n“Me?” He pauses for a moment. “Well… I am an android, I have fox bits, I, uh…”");
	output("\n\nHe seems stumped so you try to press for something that you couldn’t tell already.");
	output("\n\n“I am a custom built unit, an AI rather than a VI - but do not worry, I am very well programmed in order to stop me from malfunctioning like some earlier… defective models.” ");
	if (flags["BESS_LOVER"] != undefined && flags["BESS_LOVER"] == 1) {
		output("\n\nYou flinch, realising he’s essentially just trash talked the ");
		if (flags["BESS_CONFIGURED"] == 2)
			output("Bess 13");
		else
			output("Ben 14");
		output(" unit you love.");
	}
	output("\n\n “And, ah, yes, I am technically a medical and companion android.”");
	output("\n\nThat’s interesting. You ask him what he likes doing, wanting to know more about him.");
	output("\n\n“Hm. That is not a question I am used to, most people do not think I can actively like or dislike things,” he says, before a gentle smile creeps up onto his face. “I suppose I enjoy exploring, there is always a sense of satisfaction in being the first to have been recorded reaching somewhere. That and sewing, but there is much less to talk about there.”");
	if(flags["YOMA_JUNGLE_TALKED_ABOUT_HIM"] == undefined) 
	{
		flags["YOMA_JUNGLE_TALKED_ABOUT_HIM"] == 1;
	} 
	else 
	{
		output("\n\nOkay, you can’t hold back on this question any more, just why does he never use contractions? The absolute shit eating grin that spreads across his face is inhumanly wide, and it takes a while for it to fade enough for him to actually speak.");
		output("\n\n“It pisses people off!”");
		output("\n\nWell. That answers that question.");
	}
	
	clearMenu();
	addButton(0, "Next", yomaMainTalkTalkMenu);
}

public function yomaTalkTalkMaster():void {
	flags["YOMA_JUNGLE_TALKED_MASTER"] == 1;
	
	clearOutput();
	yomaJungleHeader();
	
	output("You ask him about the man he keeps referring to as his ‘master’.");
	output("\n\n“My master is a relatively wealthy Terran human, but he is plagued by a very serious immune condition that doesn’t seem to respond to any treatment that has been attempted thus far.” His shoulders sag a little, the trademark grin fading as he sighs. “He probably will not live very long.”");
	output("\n\nThat’s quite the bombshell, and the android looks upset, so you try to steer him towards another topic, asking him what he does.");
	output("\n\n“Well, with his condition he is not employed, but he has quite the interest in robotics! The amount of times he has tried to take me apart is bordering on ridiculous.” Considering that he’s laughing as he says it though, it looks like he doesn’t actually mind. “He sells the odd patent though, despite the fortune his parents make, he prefers not to feel indebted to them.”");
	output("\n\nWhat’s he like?");
	output("\n\nYou’ve really asked the golden question here, as Yoma absolutely <i>beams</i>. “I fucking love him, [pc.name]. This is not just because I was made specifically for him, he is simply the most exemplary member of the human race I have ever met. He has such a genuine kindness about him, he is just… wonderful.”");
	if(flags["YOMA_JUNGLE_TIMES_SEXED"] != undefined)
		output("\n\nYou ask when you’ll get to meet him, and Yoma laughs. “Now, now, I cannot bring back everyone I have slept with to meet my owner.");
	output("\n\nIt does look like he cares an awful lot about his owner, and you ask him what the two of them like doing together");
	if (pc.isBimbo())
		output(", and you can’t stop the mildly flirtatious tone in your voice");
	output(".");
	output("\n\nYoma pauses before answering. “Well, the… less explicit answer to that question is that we, well, adapted a tabletop roleplaying game so that’d it’d work for just two players”");
	if (flags["YOMA_JUNGLE_GAMES_PLAYED"] != undefined)
		output(", but you already know about that");
	else
		output(".");

	clearMenu();
	addButton(0, "Next", yomaMainTalkMenu);
}

public function yomaTalkTalkMengha():void {
	clearOutput();
	yomaJungleHeader();
	
	clearMenu();
	addButton(0, "Next", yomaMainTalkMenu);
}

public function yomaTalkTalkProbe():void {
	clearOutput();
	yomaJungleHeader();
	
	clearMenu();
	addButton(0, "Next", yomaMainTalkMenu);
}

public function yomaTalkTalkGame():void {
	clearOutput();
	yomaJungleHeader();
	
	clearMenu();
	addButton(0, "Next", yomaMainTalkMenu);
}

public function yomaSexyTime():void
{
	
}

public function yomaHugs():void {
	
}