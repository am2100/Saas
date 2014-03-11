class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class RPS
  @tournament_data
  @this_round
  @next_round
  attr_accessor :tournament_data, :this_round, :next_round

  def initialize(arr)
    @tournament_data = arr.flatten
    validate_data
    build_first_round
    begin_tournament
  end

  def validate_data
    puts @tournament_data.to_s
    raise WrongNumberOfPlayersError unless Math.log(@tournament_data.length / 2) / Math.log(2) == 
  end

  def build_first_round
  end

  def begin_tournament
  end

  def play_this_round
  end

  def play_next_round
  end

  def play_game
  end

  def promote_winner
  end
  
end

g = RPS.new([["banana", "orange"], ["apple", "fig"]])
