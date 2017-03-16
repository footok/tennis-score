function Tennis() {
}

let score = { player1: 0, player2: 0};

Tennis.prototype.pointsWonBy = function(player) {

  player = player.toString();

  if (player === 'player1') {
    score.player1 += 1;
  } else if (player === 'player2') {
    score.player2 += 1;
  } else {
    return player + ' is not exists.';
  }
};

Tennis.prototype.scoreConverter = function() {
  let player1 = score.player1;
  let player2 = score.player2;

  if (player1 == 1) {
    player1 = 15;
  } else if (player1 == 2) {
    player1 = 30;
  } else if (player1 == 3) {
    player1 = 40;
  };
  
  if (player2 == 1) {
    player2 = 15;
  } else if (player2 == 2) {
    player2 = 30;
  } else if (player2 == 3) {
    player2 = 40;
  };

  return player1 + '-' + player2;
};

Tennis.prototype.scores = function() {
  let player1 = score.player1;
  let player2 = score.player2;

  if (player1 >= 3 && player2 >= 3) {
    if (player1 - player2 === 0) {
      return 'Deuce';
    } else if (player1 - player2 === 1) {
      return 'Advantage player 1';
    } else if (player2 - player1 === 1) {
      return 'Advantage player 2';
    } else if (player1 - player2 > 1) {
      return 'Player 1 wins';
    } else if (player2 - player1 > 1) {
      return 'Player 2 wins';
    }
  } else if (player1 >= 4 && (player1 - player2 > 1)) {
    return 'Player 1 wins';
  } else if (player2 >= 4 && (player2 - player1 > 1)) {
    return 'Player 2 wins';
  }

  return this.scoreConverter();
};
