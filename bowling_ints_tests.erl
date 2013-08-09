-module(bowling_ints_tests).
-compile([export_all]).
-include_lib("eunit/include/eunit.hrl").

all_zeros_test() ->
	?assert(0 =:= bowling_ints:score_game([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])).

all_ones_test() -> 
	?assert(20 =:= bowling_ints:score_game([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])).

spare_test() ->
	?assert(16 =:= bowling_ints:score_game([5,5,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])).

mixed_test() ->
	?assert(24 =:= bowling_ints:score_game([10,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])).

perfect_game_test() ->
	?assert(300 =:= bowling_ints:score_game([10,10,10,10,10,10,10,10,10,10,10,10])).

flub_end_test() ->
	?assert(270 =:= bowling_ints:score_game([10,10,10,10,10,10,10,10,10,10,0,0])).