class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class Tournament
  attr_accessor :round, :tournament_data, :rounds, :longest_player_name

  def initialize(tournament_data)
    @round           = 1
    @tournament_data = tournament_data.flatten
    @rounds          = Array.new
    @players         = Array.new

    validate_data
    create_players
    play_tournament
  end

  def to_s
    t_str = ""
    @rounds.each_with_index do |round, index|
      r_str = "ROUND #{index + 1}\n"
      r_str.length.times {|t| r_str << "="}
      r_str << "\n\n"
      round.games.each {|g| r_str << g.to_s}
      r_str << "\n"
      t_str << r_str
    end
    return t_str
  end

  def play_tournament
    until(@players.length == 1)
      build_round
      rounds[-1].games.each {|g| g.to_s}
      @players = @rounds[@round - 1].winners.select {|w| w}
      @round += 1
    end
#    tournament_report
  end

  def create_players
    # puts "\nCREATE_PLAYERS\n==============\n"
    until (@tournament_data.empty?)
      player = Player.new(@tournament_data.shift, @tournament_data.shift)
      @players << player
    end
  end

  def build_round
    # puts "\nBUILD ROUND #{@round}\n============="
    @rounds << Round.new(@players)
    @players.clear
  end

  def validate_data
    # puts "VALIDATE DATA\n============="
    raise WrongNumberOfPlayersError unless well_formed_tournament?
    raise NoSuchStrategyError unless valid_strategies?
  end

  def well_formed_tournament?
    # puts "WELL FORMED TOURNAMENT?\n======================"
    num_players = @tournament_data.length / 2
    Math.log(num_players)/Math.log(2) % 1 == 0.0
  end     

  def valid_strategies?
    # puts "VALID STRATEGIES?\n================="
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
