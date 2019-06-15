#include "acronym.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char*
abbreviate(const char* phrase) {
  // Check for NULL or empty
  if (!phrase || '\0' == *phrase) {
    return NULL;
  }

  size_t elems = 1;
  char delims[] = "- ";
  // Use p to scan phrase
  const char* p = phrase;

  // count delimiters
  for (; '\0' != *p; ++p) {
    if (strchr(delims, *p)) {
      ++elems;
    }
  }

  // Adds an additional placeholder for \0
  elems += 1;

  // reset p
  p = phrase;

  // allocate space for each letter of the acronym
  char* acronym = (char*)malloc(elems);
  // Use r for filling acronym
  char* r = acronym;
  *(r++) = toupper(*p);

  // scan phrase looking for boundaries
  for (; '\0' != *p; ++p) {
    if (strchr(delims, *p)) {
      // at a word boundary, copy the _next_ character
      *(r++) = toupper(*(p + 1));
    }
  }

  return acronym;
}
