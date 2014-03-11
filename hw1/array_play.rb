game = [ ["Quentin"], ["Robin"] ]

round = [ [ ["Simon"], ["Theresa"] ], [ ["Ursula"], ["Venetia"] ] ]

tournament =
[
  [
    [
      [
        ["Alan"],
        ["Bob"]
      ],
      [
        ["Charles"],
        ["David"]
      ],
    ],
    [
      [
        ["Edgar"],
        ["Freddie"]
      ],
      [
        ["George"],
        ["Horatio"]
      ],
    ]
  ],
  [
    [
      [
        ["Ian"],
        ["Jim"]
      ],
      [
        ["Kim"],
        ["Liam"]
      ],
    ],
    [
      [
        ["Margot"],
        ["Norris"]
      ],
      [
        ["Oliver"],
        ["Peter"]
      ],
    ]
  ]
]

def num_levels(array, levels)
  # if array has more levels, look at the next level down
  if array[0].kind_of?(Array)
    print array
    puts "\n\n"
    return num_levels(array[0], levels + 1)
  else
  # otherwise look at the next level down
    puts "No more levels"
    return levels
  end
end

#puts "A game has #{num_levels(game, 1)} levels of nested arrays."

#puts "A round has #{num_levels(round, 1)} levels of nested arrays."
# levels = num_levels(tournament, 0)
# puts levels

def find_strategy_5(array)
  if array[0].kind_of?(String)
    puts array.to_s
  else
    array.each do |a|
      find_strategy_5(a)
    end
  end
end

find_strategy_5(game)
puts "\n\n"
find_strategy_5(round)
puts "\n\n"
find_strategy_5(tournament)

puts tournament.flatten.to_s
