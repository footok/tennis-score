# Tennis scoring system
Develop a scoring system for tennis using ruby with TDD.

Ruby code is in lib/ and test code is in spec/

# Environment setup
run
- bundle install

# Test is run by spec
In order to run test, please enter

- bundle exec rspec

# Rules
The scoring system for tennis works like this.

A match has one set and a set has many games

A game is won by the first player to have won at least 4 points in total and at least 2 points more than the opponent.

The running score of each game is described in a manner peculiar to tennis: scores from zero to three points are described as 0, 15, 30, 40, respectively
If at least 3 points have been scored by each player, and the scores are equal, the score is "deuce".

If at least 3 points have been scored by each side and a player has one more point than his opponent, the score of the game is "advantage" for the player in the lead.

There are many games to a set in tennis

A player wins a set by winning at least 6 games and at least 2 games more than the opponent.

If one player has won six games and the opponent five, an additional game is played. If the leading player wins that game, the player wins the set 7–5. If the trailing player wins the game, a tie-break is played.

A tie-break, played under a separate set of rules, allows one player to win one more game and thus the set, to give a final set score of 7–6. A tie-break is scored one point at a time. The tie-break game continues until one player wins seven points by a margin of two or more points. Instead of being scored from 0, 15, 30, 40 like regular games, the score for a tie breaker goes up incrementally from 0 by 1. i.e a player's score will go from 0 to 1 to 2 to 3 …etc.

# Constraints

We're just worried about one game, don't worry about sets, tie breakers, etc
Don't worry about validation, assume the client passes in correct data

# For example:

The interface will look something like this in Java:

  Game game = new Game("player 1", "player 2");
  game.pointWonBy("player 1");
  game.pointWonBy("player 2");
  // this will return "15-15"
  game.score();

  game.pointWonBy("player 1");
  game.pointWonBy("player 1");
  // this will return "40-15"
  game.score();

  game.pointWonBy("player 2");
  game.pointWonBy("player 2");
  // this will return "Deuce"
  game.score();
