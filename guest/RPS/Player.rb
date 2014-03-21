# Author: Jim Noble
# jimnoble@xjjz.co.uk
#
# Player.rb
#
# A Rock/Paper/Scissors player.
#
# Valid strategies include: R, r, P, p, S, s
#
# p = Player.new("Jim Noble", "r")
#
# p.to_s

class Player 
  attr_accessor :name, :strategy

  def initialize(name, strategy)
    @name = name
    @strategy = strategy
  end

  def to_s
    "#{@name} [#{@strategy.upcase}]"
  end
end

