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
         (@p1.strategy =~ ROCK && @p2.strategy =~ PAPER) ||
         (@p1.strategy =~ PAPER && @p2.strategy =~ SCISSORS) ||
         (@p1.strategy =~ SCISSORS && @p2.strategy =~ ROCK)
       ) 
      @winner = @p2
      @loser  = @p1
    end
  end

  def to_s
    str_len = @p1.name.length > @p2.name.length ? @p1.name.length : @p2.name.length
    str = "\n"
    str << "#{@p1.name}\n"
    str_len.times {|t| str << " "}
    str << " > #{@winner.name}\n"
    str << "#{@p2.name}\n"
    puts str
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

    @winners = @games.collect {|g| g.winner}
    @losers  = @games.collect {|g| g.loser}  
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

  def tournament_report

  end

  def play_tournament
    until(@players.length == 1)
      build_round
      rounds[-1].games.each {|g| g.to_s}
#      puts t.rounds[-1].games[0].to_s      
      @players = @rounds[@round - 1].winners.select {|w| w}
      @round += 1
    end
    tournament_report
  end

  def create_players
    puts "\nCREATE_PLAYERS\n==============\n"
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

t = Tournament.new(a1)

t.rounds.each do |r|
  puts "Winners: #{r.winners.length}"
  puts "Losers : #{r.losers.length}"
  puts "Games  : #{r.games.length}"
end

puts "Winner: #{t.rounds[-1].winners[0].name}"
puts t.rounds[-1].games[0].to_s
