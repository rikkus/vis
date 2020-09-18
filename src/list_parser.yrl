Nonterminals list elems elem.
Terminals '[' ']' ',' int null.
Rootsymbol list.

list -> '[' ']'       : [].
list -> '[' elems ']' : '$2'.

elems -> elem           : ['$1'].
elems -> elem ',' elems : ['$1'|'$3'].

elem -> int  : extract_token('$1').
elem -> null : nil.
elem -> list : '$1'.

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.