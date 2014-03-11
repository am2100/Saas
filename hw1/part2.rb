class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)

  raise WrongNumberOfPlayersError unless game.size == 2

  game.each do |g|
    unless (g[1] =~ /[RPS]/i) then # use i switch to make regex case
                                   # insensitive
      raise NoSuchStrategyError
    end
  end

  # Player strategies
  p1 = game[0][1]
  p2 = game[1][1]

  # Strategic options
  rock     = /R/i
  paper    = /P/i
  scissors = /S/i

  winner = game[0]   # player 1 has a slightly higher probability of
                     # winning, so assume in the first instance that
                     # they will win.

  # Player 2 will win with the following strategy combinations.
  if (
       (p1 =~ rock && p2 =~ paper) ||
       (p1 =~ paper && p2 =~ scissors) ||
       (p1 =~ scissors && p2 =~ rock)
     ) 
    winner = game[1]
  end

  # Any other case must be a win for Player 1
  # or a draw (Player 1 wins)
  puts "The winning play was: #{winner[1]}"
  puts "The winning player is: #{winner[0]}"
end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
end

# p1 wins with R
g1 = [ [ "Bob", "R" ], [ "John", "S" ] ]

# p2 wins with R
g2 = [ [ "Bob", "S" ], [ "John", "R" ] ]

# p1 wins with P
g3 = [ [ "Bob", "P" ], [ "John", "R" ] ]

# p2 wins with P
g4 = [ [ "Bob", "R" ], [ "John", "P" ] ]

# p1 wins with S
g5 = [ [ "Bob", "S" ], [ "John", "P" ] ]

# p2 wins with S
g6 = [ [ "Bob", "P" ], [ "John", "S" ] ]

# p1 wins by default
g7 = [ [ "Bob", "R" ], [ "John", "R" ] ]
g8 = [ [ "Bob", "P" ], [ "John", "P" ] ]
g9 = [ [ "Bob", "S" ], [ "John", "S" ] ]

# WrongNumberOfPlayersError 
g10 = [ [ "Bob", "R" ], [ "John", "P" ], [ "Sarah", "Q" ] ]

# NoSuchStrategyError
g11 = [ [ "John", "P" ], [ "Sarah", "q" ] ]

# lowercase strategy test
g12 = [ [ "Scott", "r" ], [ "Darren", "p" ] ]

rps_game_winner(g1)
rps_game_winner(g2)
rps_game_winner(g3)
rps_game_winner(g4)
rps_game_winner(g5)
rps_game_winner(g6)
rps_game_winner(g7)
rps_game_winner(g8)
rps_game_winner(g9)
rps_game_winner(g12)
# rps_game_winner(g10)
# rps_game_winner(g11)

