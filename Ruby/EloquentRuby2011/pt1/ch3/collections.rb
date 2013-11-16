poem_words = [ 'twinkle', 'little', 'star', 'how', 'I', 'wonder' ]
poem_words = %w{ twinkle twinkle little star how I wonder }
freq = { "I" => 1, "don't" => 1, "like" => 1, "spam" => 963 }

# default varible 
def load_font( name, size = 12 )
  # Go font hunting...
end


def echo_all( *args )
  args.each { |arg| puts arg }
end

@author = "Me"
def add_authors( *names )
  @author += " #{names.join(' ')}"
end

add_authors("Jack","Roo")
p @author

p poem_words.map { |word| word.length }

@words = poem_words
@word_count = poem_words.size

def average_word_length_old
  total = 0.0
  @words.each { |word| total += word.size }
  total / @word_count
end

def average_word_length
  # total = @words.inject(0){ |result, word| word.size + result}
  # prev line return int next float
  total = @words.inject(0.0){ |result, word| word.size + result}
  total / @word_count
end

p average_word_length

# require 'xmlsimple'

unique = []
@words.each { |word| unique << word unless unique.include?(word) }
p unique

# What we really need is a collection that doesn’t allow duplicates 
# but does feature very fast and easy answers 
# to the “is this object in there?” question
require 'set'
word_set = Set.new( @words )
p word_set
