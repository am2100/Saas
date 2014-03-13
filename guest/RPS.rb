class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class RPS
  @tournament_data
  @this_round
  @next_round
  attr_accessor :tournament_data, :this_round, :next_round

  def initialize(arr)
    @this_round = Array.new
    @next_round = Array.new
    @tournament_data = arr.flatten
    validate_data
    build_first_round
  end

  def validate_data
    raise WrongNumberOfPlayersError unless well_formed_tournament?
    raise NoSuchStrategyError unless valid_strategies?
  end

  def build_first_round
    until (@tournament_data.empty?)
      @this_round << @tournament_data.shift(2)
    end
  end

  def start
    play_this_round
    play_next_round
  end

  def play_this_round
    until (@this_round.empty?)
      p1 = @this_round.shift
      p2 = @this_round.shift
      winner = play_game(p1, p2)
      promote_winner(winner)
    end
  end

  def play_next_round
    if (@next_round.length == 1)
      # tournament is finished
    else
      @this_round = @next_round
      @next_round.clear
      play_this_round
    end
  end

  def play_game(p1, p2)
    
  end

  def promote_winner(winner)
    @next_round << winner
  end

  def well_formed_tournament?
    num_players = @tournament_data.length / 2
    Math.log(num_players)/Math.log(2) % 1 == 0.0
  end     

  def valid_strategies?
    strategies = @tournament_data.values_at(* @tournament_data.each_index.select { |i| i.odd? })
    is_valid = true

    strategies.each do |s|
      unless (s.length == 1 && s =~ /[RPS]/i) then
        is_valid = false
      end
    end

    return is_valid
  end

end

# Valid upper and lowercase strategies
a1 = [[[["Robin", "R"], ["Jim", "P"]], [["Robin", "S"], ["Jim", "r"]]], [[["Robin", "p"], ["Jim", "s"]], [["Robin", "R"], ["Jim", "P"]]]]

# Invalid strategy - wrong letter
a2 = [["Robin", "P"], ["Jim", "c"]]

# Invalid strategy - multiple letters
a3 = [["Robin", "RP"], ["Jim", "s"]]

# Odd number of players
a4 = [["Robin", "r"], ["Jim", "p"], ["Jacqui", "S"]]

# Even number of players, but not a power of 2
a5 = [["Robin", "r"], ["Jim", "p"], ["Jacqui", "S"], ["Robin", "r"], ["Jim", "p"], ["Jacqui", "S"]]

tournament = RPS.new(a1)
tournament.start
