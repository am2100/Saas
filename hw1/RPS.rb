class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def validate_data(tournament)
  raise WrongNumberOfPlayersError unless tournament.flatten.length % 2 == 0
end

# a method that takes a flat array and returns an array of two element
# strategies
def build_first_round(arr1, arr2)
  until (arr1.empty?)
    arr2 << arr1.shift(2)
  end
  arr2
end

def play_this_round(arr)
  if arr.length > 1
    return play_games(arr)
  else
    return false
  end
end

def play_games(arr)
  until (arr.empty?)
    p1 = arr.shift
    p2 = arr.shift
    winner = play_game(p1, p2)
    add_to_next_round(winner, next_round)
  end
  return true
end

def play_game(p1, p2)

#  raise WrongNumberOfPlayersError unless game.size == 2
  strategies = [p1[1], p2[1]]

  strategies.each do |s|
    unless (s =~ /[RPS]/i) then # use i switch to make regex case
                                   # insensitive
      raise NoSuchStrategyError
    end
  end

  # Strategic options
  rock     = /R/i
  paper    = /P/i
  scissors = /S/i

  winner = p1        # player 1 has a slightly higher probability of
                     # winning, so assume in the first instance that
                     # they will win.

  # Player 2 will win with the following strategy combinations.
  if (
       (p1[1] =~ rock && p2[1] =~ paper) ||
       (p1[1] =~ paper && p2[1] =~ scissors) ||
       (p1[1] =~ scissors && p2[1] =~ rock)
     ) 
    winner = p2
  end

  # Any other case must be a win for Player 1
  # or a draw (Player 1 wins)

  return winner
end


def add_to_next_round(player, arr)
  arr << player
end

tournament = [ [ ["Alan", "P"], ["Bernie", "R"] ], [ ["Charles", "S"], ["Donald", "R"] ] ]

# init tournament
validate_data(tournament)

this_round = Array.new
next_round = Array.new

build_first_round(tournament.flatten, this_round)
puts this_round.to_s

#if play_this_round then play_next_round

#=end
