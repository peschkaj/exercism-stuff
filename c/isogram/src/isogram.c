#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "isogram.h"

bool
is_isogram(const char phrase[]) {
  if (!phrase) {
    return false;
  }

  size_t wl = strlen(phrase), i = 0;
  bool iso = true;
  char* p = malloc(wl);
  strncpy(p, phrase, wl);
  for (i = 0; i < wl; ++i) {
    p[i] = tolower(p[i]);
  }

  for (i = 0; i < wl && iso == true; ++i) {
    if (isalnum(p[i]) && strchr(p + i + 1, p[i])) {
      iso = false;
    }
  }

  return iso;
}
