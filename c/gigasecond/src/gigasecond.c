#include "gigasecond.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <sys/types.h>

time_t gigasecond_after(time_t start) {
  return start + 1000000000;
}
