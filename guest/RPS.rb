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

t.rounds.each do |r|
  puts "Winners: #{r.winners.length}"
  puts "Losers : #{r.losers.length}"
  puts "Games  : #{r.games.length}"
end

puts "Winner: #{t.rounds[-1].winners[0].name}"
puts t.rounds[-1].games[0].to_s
