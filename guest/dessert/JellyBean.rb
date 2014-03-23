# Author: Jim Noble
# jimnoble@xjjz.co.uk
#
# JellyBean.rb
#

class JellyBean < Dessert
  def initialize(name, calories, flavour)
    super(name, calories)
    @flavour = flavour
  end

  def delicious?
    @flavour == "black licorice" ? false : true
  end

  def to_s
    super.to_s << "Flavour:   #{@flavour}\n"
  end
end
