Definitions.

INT         = [0-9]+
NULL        = null
WHITESPACE  = [\s\t\n\r]

Rules.

{INT}         : {token, {int,  TokenLine, list_to_integer(TokenChars)}}.
{NULL}        : {token, {null, TokenLine, nil}}.
\[            : {token, {'[',  TokenLine}}.
\]            : {token, {']',  TokenLine}}.
,             : {token, {',',  TokenLine}}.
{WHITESPACE}+ : skip_token.

Erlang code.