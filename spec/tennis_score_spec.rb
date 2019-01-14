require 'tennis_score'

describe TennisScore do
  let(:tennis_score) { TennisScore.new(param) }
  let(:param) { {set_score: {player1: 0, player2: 0}} }

  describe 'points_won_by and score' do
    context 'when pass a player as an argument' do
      it 'set a game score for the player' do
        tennis_score.points_won_by('player1')
        expect(tennis_score.score).to eql("0:0, 15:0")
      end

      it 'set a game score for the player' do
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player2')
        expect(tennis_score.score).to eql("0:0, 15:15")
      end
    end

    context 'when the score is 40:40' do
      it 'returns Deuce' do
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        expect(tennis_score.score).to eql("0:0, Deuce")
      end
    end

    context 'when the score is Deuce' do
      it 'returns Deuce' do
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player2')
        expect(tennis_score.score).to eql("0:0, Deuce")
      end
    end

    context 'when player1 scores after Deuce' do
      it 'returns Advantage player 1' do
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player1')
        expect(tennis_score.score).to eql("0:0, Advantage player 1")
      end
    end

    context 'when player2 scores after Deuce' do
      it 'returns Advantage player 2' do
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        expect(tennis_score.score).to eql("0:0, Advantage player 2")
      end
    end

    context 'when player1 scores 2 points in a row after Deuce' do
      it 'returns set score' do
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player2')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        expect(tennis_score.score).to eql("1:0")
      end
    end

    context 'when player1 wons 2 games' do
      it 'returns set score' do
        # player1 won first game
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.score
        # player1 won second game
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        expect(tennis_score.score).to eql("2:0")
      end
    end

    context 'when player1 wins 6 games and 2 games more than the opponent' do
      let(:param) { {set_score: {player1: 6, player2: 1}} }
      it 'returns winner' do
        expect(tennis_score.score).to eql("Player 1 won")
      end
    end

    context 'when player2 wins 6 games and 2 games more than the opponent' do
      let(:param) { {set_score: {player1: 4, player2: 6}} }
      it 'returns winner' do
        expect(tennis_score.score).to eql("Player 2 won")
      end
    end

    context 'when player2 wins 6 games and 2 games more than the opponent' do
      let(:param) { {set_score: {player1: 5, player2: 6}} }
      it 'returns winner' do
        expect(tennis_score.score).to eql("5:6, 0:0")
      end
    end

    context 'when player1 wins 7 games and player2 wins 5 games' do
      let(:param) { {set_score: {player1: 6, player2: 5}} }
      it 'returns set score' do
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        tennis_score.points_won_by('player1')
        expect(tennis_score.score).to eql("Player 1 won")
      end
    end

    describe 'tie_breaker' do
      context 'when player1 wins 6 games and player2 wins 7 games' do
        let(:param) { {set_score: {player1: 6, player2: 6}} }
        it 'returns winner' do
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          # score 6:7
          tennis_score.score
          expect(tennis_score.score).to eql("Player 2 won")
        end
      end

      context 'when player1 wins 6 points and player2 wins 6 points' do
        let(:param) { {set_score: {player1: 6, player2: 6}} }
        it 'returns current score' do
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          # score 6:7
          tennis_score.score
          expect(tennis_score.score).to eql("6:6, 6:6")
        end
      end

      context 'when player1 wins 7 points by a margin of two or more points.' do
        let(:param) { {set_score: {player1: 6, player2: 6}} }
        it 'returns winner' do
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player2')
          tennis_score.points_won_by('player1')
          tennis_score.points_won_by('player1')
          # score 6:7
          tennis_score.score
          expect(tennis_score.score).to eql("Player 1 won")
        end
      end
    end
  end
end
