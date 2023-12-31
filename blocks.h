//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",	"sb-packages",	1800,	8},
	{"",	"sb-memory",	10,	14},

	{"",	"sb-internet",	5,	4},
	{"",	"sb-vpn",	5,	2},
	{"",	"sb-volume",	0,	10},
	{"",	"sb-battery",	5,	3},
	{"",	"sb-weather",	1800,	5},
	{"",	"sb-datetime",	5,	1},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "|";
static unsigned int delimLen = 5;
