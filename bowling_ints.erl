-module(bowling_ints).
-export([score_game/1]).

-spec score_game(Rolls) -> FinalScore when
      Rolls :: [non_neg_integer()],
      FinalScore ::  non_neg_integer().

score_game(Rolls) ->
	score_game(Rolls, 0).

-spec score_game(Rolls, ScoreAcc) -> FinalScore when
      Rolls      :: [non_neg_integer()],
      ScoreAcc   ::  non_neg_integer(),
      FinalScore ::  non_neg_integer().

score_game([10, R2, R3 | Rest], Score) ->
	score_game([R2, R3 | Rest], Score + 10 + R2 + R3);

score_game([R1, R2, R3 | Rest], Score) when R1 + R2 =:= 10 ->
	score_game([R3 | Rest], Score + 10 + R3);

score_game([R1, R2 | Rest], Score) when R1 + R2 < 10 ->
	score_game(Rest, Score + R1 + R2);

score_game([_,_], Score) -> Score;
score_game([],Score) -> Score.





