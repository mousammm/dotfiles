static const Block blocks[] = {
    /*Icon*/        /*Command*/                                       /*Update Interval*/   /*Update Signal*/
    
     {"", "./modules/datetime.sh",              60,                   1},
};

// sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 3;

    //{"", "nmcli -t -f STATE general",                                 60,                   1},
    //{"", "pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'",   10,                   0},
    //{"", "sensors | grep Tctl | awk '{print $2}' | tr -d '+'",        10,                   0},
    //{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g", 30,                0},
    //{"", "date '+%b %d (%a) %I:%M%p'",                                60,                   1},
