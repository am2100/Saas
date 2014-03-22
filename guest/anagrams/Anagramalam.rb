# Author: Jim Noble
# jimnoble@xjjz.co.uk
#
# Anagramalam.rb
#
# A program that takes a list of words and outputs an array of anagram arrays
#

class Anagramalam
  def initialize(words)
    @input        = Array.new
    @output       = Array.new
    @longest_word = 0

    IO.foreach(words) do |w|
      if (w.chomp.length > @longest_word)
        @longest_word = w.length
      end
    end

    @input = Array.new(@longest_word + 1) {Array.new}

    IO.foreach(words) do |w|
      w.chomp!
      @input[w.length] << w
    end
    
    combine_anagrams
  end

  def make_hash_key(str)
    str.downcase.chars.sort.join.to_sym
  end

  def combine_anagrams
    @anagrams = Hash.new

    @input.each do |a|
      a.each do |str|
        key = make_hash_key(str)
        if @anagrams.has_key?(key)
          @anagrams[key] << str
        else
          @anagrams[key] = Array.new << str
        end
      end
    end

    @anagrams.each {|a| puts a.to_s}

    # check to see if the sorted line already exists as a hash name

    # if it doesn't, create it, and assign a new array as it's value. Add word to value array.

    # if it does, add word to existing value array
  end
end
