class Game

  @@longest_player_name = 0

  ROCK     = /R/i
  PAPER    = /P/i
  SCISSORS = /S/i

  attr_accessor :p1, :p2, :winner, :loser, :longest_player_name

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
    padding = "    "
    underline = "-----------"
    @@longest_player_name.times {|p| padding << " "}
    (@@longest_player_name * 2).times {|u| underline << "-"}
    str << "#{@p1.to_s}\n" << "#{padding} > #{@winner.to_s}\n#{@p2.to_s}\n#{underline}\n"
  end

  def longest_player_name
    @@longest_player_name
  end

  def longest_player_name=(name)
    @@longest_player_name = name
  end

end
