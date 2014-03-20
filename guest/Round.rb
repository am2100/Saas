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

  def to_s
    str = ""
    @games.each {|g| str << g.to_s}
    return str
  end
end
