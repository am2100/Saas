# Author: Jim Noble
# jimnoble@xjjz.co.uk
#
# Game.rb
#
# A Game of Rock/Paper/Scissors
#
# Requires two Players. See Players.rb
#
# p1 = Player.new("Jim", "R")
# p2 = Player.new("Jacqui", "P")
# g = Game.new(p1, p2)
#
# puts g

class Game

  @@longest_player_name = 0

  ROCK     = /R/i
  PAPER    = /P/i
  SCISSORS = /S/i

  attr_accessor :winner, :loser

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2

    # check player names to see if they are the longest yet
    if (@p1.name.length > @@longest_player_name) then @@longest_player_name = @p1.name.length end
    if (@p2.name.length > @@longest_player_name) then @@longest_player_name = @p2.name.length end

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
    str = ""
    padding = "----"
    @@longest_player_name.times {|p| padding << "-"}
    str << "#{@p1}\n" << "#{padding}> #{@winner}\n#{@p2}\n\n"
  end

end
