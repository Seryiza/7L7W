-module(day_3).
-export([translate_service/0]).
-export([translate_monitor/0]).
-export([translate/2]).

translate_service() ->
    receive
        {From, "casa"} ->
            From ! "house",
            translate_service();
        {From, _} ->
            From ! unknown,
            exit({empty_input})
    end.

translate_monitor() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating translate_service..."),
            register(translator, spawn_link(fun translate_service/0)),
            translate_monitor();

        {'EXIT', _, _} ->
            io:format("translate_service is died, restarting..."),
            self() ! new,
            translate_monitor()
    end.

translate(To, Word) ->
    To ! {self(), Word},
    receive
        Translation -> Translation
    end.
