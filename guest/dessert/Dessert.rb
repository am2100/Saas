# Author: Jim Noble
# jimnoble@xjjz.co.uk
#
# Dessert.rb
#

class Dessert

  attr_accessor :name, :calories

  def initialize(name, calories)
    @name     = name
    @calories = calories  
  end

  def healthy?
    @calories < 200 ? true : false
  end

  def delicious?
    true
  end

  def to_s
    "\n#{@name}\nCalories:  #{@calories}\nHealthy?   #{healthy?}\nDelicious? #{delicious?}\n"
  end
end
