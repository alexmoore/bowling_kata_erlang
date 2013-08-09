-module(bowling_tests).
-compile([export_all]).
-include_lib("eunit/include/eunit.hrl").

all_zeros_test() ->
	?assert(0 =:= bowling:score_game([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])).

all_ones_test() -> 
	?assert(20 =:= bowling:score_game([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])).

spare_test() ->
	?assert(16 =:= bowling:score_game([5,"/",3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])).

mixed_test() ->
	?assert(24 =:= bowling:score_game(["X",3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])).

perfect_game_test() ->
	?assert(300 =:= bowling:score_game(["X","X","X","X","X","X","X","X","X","X","X","X"])).

flub_end_test() ->
	?assert(270 =:= bowling:score_game(["X","X","X","X","X","X","X","X","X","X",0,0])).