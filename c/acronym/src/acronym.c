#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "acronym.h"

char *abbreviate(const char *phrase) {
  // Check for NULL or empty
  if (!phrase || *phrase == '\0') {
    return NULL;
  }

  size_t elems = 1, i = 0, len = strlen(phrase);
  char delims[2] = "- ";

  char* p = malloc(len);
  strncpy(p, phrase, len);

  // count delimiters for building the acronym
  for (; i < len; ++i) {
    if (strchr(delims, p[i])) {
      ++elems;
      // standardize on ' ' as the delimiter
      if (p[i] != ' ') {
        p[i] = ' ';
      }
    }
  }

  // Adds an additional placeholder for the last word and then \0
  elems += 1;

  // allocate space for each word
  char* acronym = (char*)malloc(elems);
  memset(acronym, 'a', elems);
  acronym[elems] = '\0';

  // tokenize the phrase into words
  i = 0;
  char* token = strtok(p, " ");
  while (token) {
    acronym[i++] = toupper(*token);
    token = strtok(NULL, " ");
  }

  acronym[i] = '\0';

  free(p);

  return acronym;
}
