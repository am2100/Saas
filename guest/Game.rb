class Game

  @@longest_player_name

  ROCK     = /R/i
  PAPER    = /P/i
  SCISSORS = /S/i

  attr_accessor :p1, :p2, :winner, :loser, :longest_player_name

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
    str_len = @p1.to_s.length > @p2.to_s.length ? @p1.to_s.length : @p2.to_s.length
    str = "\n"
    str << "#{@p1.to_s}\n"
    str_len.times {|t| str << " "}
    str << " > #{@winner.to_s}\n"
    str << "#{@p2.to_s}\n"
    puts str
  end
end
