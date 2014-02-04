-module(bowling).
-export([score_game/1]).

-spec score_game(Rolls) -> Score when
      Rolls :: [Roll],
      Roll  :: char() | non_neg_integer(),
      Score :: non_neg_integer().

score_game(Rolls) ->
	score_game(Rolls, 0).

-spec score_game(Rolls, ScoreAcc) -> Score when
      Rolls :: [Roll],
      Roll  :: char() | non_neg_integer(),
      ScoreAcc :: non_neg_integer(),
      Score    :: non_neg_integer().

score_game(["X", R2, "/" | Rest], Score) ->
	FrameScore = Score + 10 + 10,
	score_game([R2, "/" | Rest], FrameScore);

score_game(["X", R2, R3 | Rest], Score) ->
	FrameScore = Score + 10 + val(R2) + val(R3),
	score_game([R2, R3 | Rest], FrameScore);

score_game([_, "/", R3 | Rest], Score) ->
	FrameScore = Score + 10 + val(R3),
	score_game([R3 | Rest], FrameScore);

score_game([R1, R2 | Rest], Score) when R1 /= "X" andalso R2 /="X" ->
	FrameScore = Score + val(R1) + val(R2),
	score_game(Rest, FrameScore);

score_game([_,_], Score) -> Score;
score_game([],Score) -> Score.

val(Roll) when is_integer(Roll) -> Roll;
val("X") -> 10.




