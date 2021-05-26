reverse([], []) :- !.
reverse([Head|[]], [Head]) :- !.
reverse([Head|[Head2|[]]], [Head2, Head]) :- !.
reverse([Head|Tail], ReversedList) :-
    reverse(Tail, ReversedTail),
    append(ReversedTail, [Head], ReversedList).

min([A|[]], A) :- !.
min([A|[B|[]]], A) :- A < B, !.
min([A|[B|[]]], B) :- A > B, !.
min([Head|Tail], Min) :- min(Tail, TailMin), min([Head, TailMin], Min).

%% Thanks to nickknw! It's so great :*
%% https://github.com/nickknw/seven-languages-in-seven-weeks/blob/master/week-3-prolog/day2.pl
takeout(X, [X|R], R) :- !.
takeout(X, [F|R], [F|S]) :- takeout(X,R,S).

mySort([A], [A]) :- !.
mySort(List, [Min|Sorted]) :-
    min(List, Min),
    takeout(Min, List, Rest),
    mySort(Rest, Sorted).
