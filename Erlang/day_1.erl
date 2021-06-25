-module(day_1).
-export([count_words/1]).
-export([count_number/0]).
-export([status/1]).

count_words(nomatch) -> 0;
count_words(Text) -> 1 + count_words(string:find(string:trim(Text), " ")).

count_number() -> count_number(1).

count_number(11) -> counted;
count_number(N) -> io:fwrite("~B~n", [N]), count_number(N + 1).

status(success) -> io:fwrite("success~n");
status({error, Message}) -> io:fwrite("error: ~s~n", [Message]).
