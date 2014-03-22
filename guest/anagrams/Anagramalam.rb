# Author: Jim Noble
# jimnoble@xjjz.co.uk
#
# Anagramalam.rb
#
# A program that takes a list of words and outputs an array of anagram
# arrays
#

class Anagramalam

  @longest_word
  @input
  @anagrams
  @output

  # * Find the longest word in the dictionary.
  #
  # * Create an array of arrays, one for every possible length of word
  #   plus one, so that a word's length can act as its index. 
  # 
  # * Add each word in the dictionary to an array using word length as
  #   an index.
  #
  def initialize(words)

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

  # * Take a word and turn it into a lowercase alphabetically sorted symbol.
  def make_hash_key(str)
    str.downcase.chars.sort.join.to_sym
  end
  
  # * Create a hash.
  # * Create lowercase alphabetically sorted word symbols from each word and use them as hash keys. 
  # * Collect anagrams in arrays referenced by these keys.
  # * Store the arrays in the output array.
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
    @output = @anagrams.values
  end

  def print_array
    @output.each {|a| puts a.to_s}
  end

  def print_hash
    @anagrams.each {|a| puts a.to_s}
  end
  
  # * Print the word or words with the most anagrams in the dictionary
  def print_most_interesting
    most_interesting = 0
    @output.each do |a|
      if a.length > most_interesting then most_interesting = a.length end
    end

    @output.each do |a|
      if a.length == most_interesting then puts a.to_s end
    end
  end
  # * Don't bother printing words without anagrams.
  def print_only_anagrams
    @output.each do |a|
      if a.length > 1 then puts a.to_s end
    end
  end
end
