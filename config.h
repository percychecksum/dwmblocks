#define PATH(name)                      "<bricks path>"name
#define CMDOUTLENGTH                    100
#define DELIMITERENDCHAR                24
#define INTERVALs                       1
#define INTERVALn                       0

static const char delimiter[] = { ' ', '|', ' ', DELIMITERENDCHAR };

#include "block.h"

static Block blocks[] = {
/* pathu				    pathc                           interval    signal */
   { NULL } /* just to mark the end of the array */
};
