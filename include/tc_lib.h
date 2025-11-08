#ifndef TC_LIB_H
#define TC_LIB_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char** tc_keywords = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void"};
int tc_keywords_count = 21;

char** tc_symbols = {"(", ")", "{", "}", ",", "!", ".", "[", "]", "\"", ";", "_", "+", "-", "*", "/", "%", "==", "!=", "<", ">", "<=", ">=", "&&", "||", "=", "+=", "-=", "*=", "/=", "%="};
int tc_symbols_count = 31;

#endif  // TC_LIB_H
