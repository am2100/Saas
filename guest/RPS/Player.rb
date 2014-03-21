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

