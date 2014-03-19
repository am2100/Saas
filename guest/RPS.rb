require './Player'
require './Game'
require './Round'
require './Tournament'

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


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

p = Player.new("Jim Noble", "R")
puts p.to_s
