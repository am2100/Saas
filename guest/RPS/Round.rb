# Author: Jim Noble
# jimnoble@xjjz.co.uk
#
# Round.rb
#
# A Round of Rock/Paper/Scissors games in an RPS Tournament.
#
# Requires an array of RPS Players. See Player.rb
#
# p1 = Player.new("Jim", "R")
# p2 = Player.new("Jacqui", "P")
# p3 = Player.new("Robin", "S")
# p4 = Player.new("Zebedee", "R")
# r  = [p1, p2, p3, p4]
#
# r.to_s

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
