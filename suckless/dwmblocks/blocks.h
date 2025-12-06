//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "~/dotfiles/suckless/dwmblocks/modules/net.sh", 		60, 1},
	{"", "~/dotfiles/suckless/dwmblocks/modules/temp.sh", 		30, 1},
	{"", "~/dotfiles/suckless/dwmblocks/modules/volume.sh", 	 0, 10},
	{"", "~/dotfiles/suckless/dwmblocks/modules/memory.sh", 	5, 1},
     	{"",  "~/dotfiles/suckless/dwmblocks/modules/datetime.sh",      60, 1},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
