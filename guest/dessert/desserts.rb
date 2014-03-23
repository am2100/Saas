# Author: Jim Noble
# jimnoble@xjjz.co.uk
#
# desserts.rb
#
# A bit of basic object oriented programming
#

require './Dessert'
require './JellyBean'

d1 = Dessert.new("Bread and Butter Pudding", 1000)
d1.name = "Sticky Toffee Pudding"
d1.calories = 10000
puts d1

jb1 = JellyBean.new("Jelly bean", 10, "black licorice")
jb1.name = "Big Jelly bean"
jb1.calories = 15
puts jb1
