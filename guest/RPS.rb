class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class Player 
  attr_accessor :name, :strategy

  def initialize(name, strategy)
    @name = name
    @strategy = strategy
  end
end

class Game

  ROCK     = /R/i
  PAPER    = /P/i
  SCISSORS = /S/i

  attr_accessor :p1, :p2, :winner, :loser

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @winner = @p1 # player 1 has a slightly higher probability of
    @loser  = @p2 # winning, so assume in the first instance that
                 # they will win.

    # Player 2 will win with the following strategy combinations.
    if (
         (p1.strategy =~ ROCK && p2.strategy =~ PAPER) ||
         (p1.strategy =~ PAPER && p2.strategy =~ SCISSORS) ||
         (p1.strategy =~ SCISSORS && p2.strategy =~ ROCK)
       ) 
      @winner = @p2
      @loser  = @p1
    end
  end
end

class Round
  attr_accessor :players, :games, :winners, :losers

  def initialize(players)
    @players = players
    @games   = Array.new
    @winners = Array.new
    @losers  = Array.new

    until (@players.empty?)
      @games << Game.new(players.shift, players.shift)
    end
    
    @games.each do |g|
      @winners << g.winner
      @losers  << g.loser
    end

  end
end

class Tournament
  attr_accessor :round, :tournament_data, :rounds

  def initialize(tournament_data)
    @round           = 1
    @tournament_data = tournament_data.flatten
    @rounds          = Array.new
    @players         = Array.new

    validate_data
    create_players
    play_tournament
  end

  def play_tournament
    until(@players.length == 1)
      build_round
      @players = @rounds[@round - 1].winners
      puts @players
      @round += 1
    end
  end

  def create_players
    puts "\nCREATE_PLAYERS\n=============\n"
    until (@tournament_data.empty?)
      player = Player.new(@tournament_data.shift, @tournament_data.shift)
      @players << player
    end
  end

  def build_round
    puts "\nBUILD ROUND #{@round}\n============="
    @rounds << Round.new(@players)
    @players.clear
  end

  def validate_data
    puts "VALIDATE DATA\n============="
    raise WrongNumberOfPlayersError unless well_formed_tournament?
    raise NoSuchStrategyError unless valid_strategies?
  end

  def well_formed_tournament?
    puts "WELL FORMED TOURNAMENT?\n======================"
    num_players = @tournament_data.length / 2
    Math.log(num_players)/Math.log(2) % 1 == 0.0
  end     

  def valid_strategies?
    puts "VALID STRATEGIES?\n================="
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

class RPS

#  @tournament_data
#  @this_round
#  @next_round

  attr_accessor :tournament_data, :this_round, :next_round

  def initialize(arr)
    puts "\nINIT\n===="
    @this_round = Array.new
    @next_round = Array.new
    @tournament_data = arr.flatten

    validate_data
    build_first_round
  end

  def validate_data
    puts "VALIDATE DATA\n============="
    raise WrongNumberOfPlayersError unless well_formed_tournament?
    raise NoSuchStrategyError unless valid_strategies?
  end

  def build_first_round
    puts "\nBUILD FIRST ROUND\n================="
    until (@tournament_data.empty?)
      player = Player.new(@tournament_data.shift, @tournament_data.shift)
      @next_round << player
    end
  end

  def start 
    puts "\nSTART\n====="
    play_next_round
  end

  def play_next_round
    puts "\nPLAY NEXT ROUND\n==============="
    if (@next_round.length > 1)
      puts "@next_round.length #{@next_round.length}"
      @this_round = @next_round.dup
      @next_round.clear
      puts "@this_round #{@this_round.to_s}"
      puts "@next_round #{@next_round.to_s}"
      play_this_round
    else
      puts "\nWINNER: #{@next_round[0].name} WITH: #{@next_round[0].strategy}"
    end
  end

  def play_this_round
    puts "\nPLAY THIS ROUND\n==============="
    until (@this_round.empty?)
#      puts "@this_round.length #{@this_round.length}"
#      p1 = @this_round.shift
#      puts "p1 = #{p1.to_s}"
#      p2 = @this_round.shift
#      puts "p2 = #{p2.to_s}"
#      @next_round << play_game(p1, p2)
      @next_round << play_game(@this_round.shift, @this_round.shift)
#      winner = play_game(p1, p2)
#      puts winner
#      promote_winner(winner)
      puts "\n@next_round #{@next_round.to_s}"
    end
    play_next_round
  end

  def play_game(p1, p2)
    puts "\nPLAY GAME\n========="
    puts "p1 #{p1}"
    puts "p2 #{p2}"
    # Strategic options
    rock     = /R/i
    paper    = /P/i
    scissors = /S/i

    winner = p1 # player 1 has a slightly higher probability of
                # winning, so assume in the first instance that
                # they will win.

    # Player 2 will win with the following strategy combinations.
    if (
         (p1.strategy =~ rock && p2.strategy =~ paper) ||
         (p1.strategy =~ paper && p2.strategy =~ scissors) ||
         (p1.strategy =~ scissors && p2.strategy =~ rock)
       ) 
      winner = p2
    end

    return winner

  end

  def promote_winner(winner)
    puts "\nPROMOTE WINNER\n=============="
    @next_round << winner
  end

  def well_formed_tournament?
    puts "WELL FORMED TOURNAMENT?\n======================"
    num_players = @tournament_data.length / 2
    Math.log(num_players)/Math.log(2) % 1 == 0.0
  end     

  def valid_strategies?
    puts "VALID STRATEGIES?\n================="
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
a1 = [[[["Robin", "R"], ["Jim", "P"]], [["Jacqui", "S"], ["Pierre", "r"]]], [[["Zebedee", "p"], ["Sylvan", "s"]], [["Elly", "R"], ["Wilf", "P"]]]]

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

p1 = Player.new("Jim", "r")
p2 = Player.new("Jacqui", "p")
p3 = Player.new("Pierre", "s")
p4 = Player.new("Robin", "r")
p5 = Player.new("Zebedee", "p")
p6 = Player.new("Sylvan", "s")
p7 = Player.new("Elly", "r")
p8 = Player.new("Mike", "p")

g = Game.new(p1, p2)
puts "winner #{g.winner.name}"
puts "loser #{g.loser.name}"

p_array = [p1, p2, p3, p4, p5, p6, p7, p8]

r = Round.new(p_array)
puts "winners: #{r.winners}"

t = Tournament.new(a1)
=begin
t.rounds[0].games.each do |g|
  puts "\nGAME\n===="
  puts "#{g.p1.name} vs #{g.p2.name}"
  puts "winner: #{g.winner.name} with: #{g.winner.strategy}\n\n"
end
=end
