class TennisScore

  attr_accessor :score_status, :p1_score, :p2_score

  def initialize(score_status = {set_score: {player1: 0, player2: 0}})
    @score_status = score_status
    @p1_score = 0
    @p2_score = 0
  end

  def points_won_by player
    case player
    when 'player1'
      @p1_score += 1
    when 'player2'
      @p2_score += 1
    else
      puts "Player #{player} does not exist."
    end
  end

  def score
    return tie_breaker if @score_status[:set_score][:player1] == 6 && @score_status[:set_score][:player2] == 6
    return winner if @score_status[:set_score][:player1] >= 6 || @score_status[:set_score][:player2] >= 6
    return advantage_scoring if @p1_score >= 3 && @p2_score >= 3
    return normal_scoring if @p1_score >= 4 || @p2_score >= 4
    "#{set_score}, #{player_score(@p1_score).to_s}:#{player_score(@p2_score).to_s}" 
  end

  private

    def tie_breaker
      if @p1_score >= 7 && @p1_score - @p2_score >= 2
        return 'Player 1 won'
      elsif @p2_score >= 7 && @p2_score - @p1_score >= 2
        return 'Player 2 won'
      else
        "#{set_score}, #{@p1_score.to_s}:#{@p2_score.to_s}" 
      end
    end

    def winner
      normal_scoring if @p1_score >= 4 || @p2_score >= 4
      if @score_status[:set_score][:player1] - @score_status[:set_score][:player2] > 1
        return 'Player 1 won'
      elsif @score_status[:set_score][:player2] - @score_status[:set_score][:player1] > 1
        return 'Player 2 won'
      elsif @score_status[:set_score][:player2] - @score_status[:set_score][:player1] <= 1
        "#{set_score}, #{player_score(@p1_score).to_s}:#{player_score(@p2_score).to_s}" 
      else
        "#{set_score}" 
      end
    end

    def normal_scoring
      if @p1_score - @p2_score > 1 || @p2_score - @p1_score > 1
        update_set_score
        return "#{set_score}"
      end
    end

    def advantage_scoring
      if @p1_score - @p2_score == 0
        return "#{set_score}, Deuce"
      elsif @p1_score - @p2_score == 1
        return "#{set_score}, Advantage player 1"
      elsif @p2_score - @p1_score == 1
        return "#{set_score}, Advantage player 2"
      else
        update_set_score
        set_score
      end
    end

    def reset_players_points
      @p1_score = 0
      @p2_score = 0
    end

    def update_set_score
      if (@p1_score - @p2_score > 1)
        @score_status[:set_score][:player1] += 1
        reset_players_points
      else
        @score_status[:set_score][:player2] += 1
        reset_players_points
      end
    end

    def set_score
      "#{@score_status[:set_score][:player1].to_s}:#{@score_status[:set_score][:player2].to_s}"
    end

    def player_score score
      case score
      when 0
        0
      when 1
        15
      when 2
        30
      when 3
        40
      end
    end
end
