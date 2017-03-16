describe("Tennis", function() {
  var game;

  beforeEach(function() {
    game = new Tennis();
  });

  afterEach(function() {
    score.player1 = 0;
    score.player2 = 0;
  });

  describe("pointsWonBy", function() {

    it("should give 1 point to player1", function() {
      game.pointsWonBy('player1');
      expect(score.player1).toEqual(1);
    });

    it("should give 1 point to player2", function() {
      game.pointsWonBy('player2');
      expect(score.player2).toEqual(1);
    });

    it("should give 3 point to player2", function() {
      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      expect(score.player2).toEqual(3);
    });
  });

  describe("scoreConverter", function() {
    it("should return current score 15-40", function() {
      game.pointsWonBy('player1');

      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      expect(game.scoreConverter()).toEqual('15-40');
    });
  });

  describe("scores", function() {
    it("should return Deuce", function() {
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');

      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      expect(game.scores()).toEqual('Deuce');
    });

    it("should return Advantage player 1", function() {
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');

      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      game.pointsWonBy('player2');

      game.pointsWonBy('player1');
      expect(game.scores()).toEqual('Advantage player 1');
    });

    it("should return Advantage player 2", function() {
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');

      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      expect(game.scores()).toEqual('Advantage player 2');
    });

    it("should return Player 1 wins", function() {
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');

      game.pointsWonBy('player2');
      game.pointsWonBy('player2');

      game.pointsWonBy('player1');
      expect(game.scores()).toEqual('Player 1 wins');
    });

    it("should return Player 2 wins", function() {
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');
      game.pointsWonBy('player1');

      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      game.pointsWonBy('player2');

      game.pointsWonBy('player1');
      game.pointsWonBy('player2');

      game.pointsWonBy('player2');
      game.pointsWonBy('player2');
      expect(game.scores()).toEqual('Player 2 wins');
    });
  });
});
