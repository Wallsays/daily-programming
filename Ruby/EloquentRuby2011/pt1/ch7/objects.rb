require_relative "../ch1/doc.rb"

puts "------------------------"
doc = Document.new( 'Ethics', 'Spinoza', 'By that which is...' )
puts doc.word_count

# RomanceNovel is a subclass of Document,
# which is a subclass of Object
class RomanceNovel < Document
  # Lot's of steamy stuff omitted...

 
  private
  # Methods are private starting here
  # or you can making them private after the fact
  # private :word_count
  # This method works because self is the right thing,
  # the document instance, when you call it.
  def print_word_count
    n = word_count
    puts "The number of words is #{word_count}"
  end

end

puts -3.abs
puts "abc".upcase
puts :abc.length

puts /abc/.class
puts true.class # Returns Trueclass
puts false.nil? # False is close, but not nil
puts true.class.class # Returns Class

nil.class # Returns NilClass
nil.nil?  # Yes, finally true!


doc = Document.new( 'Emma', 'Austin', 'Emma Woodhouse, ...' )
puts doc
p doc.instance_variables

rn = RomanceNovel.new( 'Emma', 'Austin', 'Emma Woodhouse, ...' )
# puts rn.print_word_count # produce error on call private method
# but it is possible to call it via send coz it is std Object method and visibility be damned
puts rn.send( :print_word_count )

class Person
  attr_accessor :salary
  attr_reader :name
  attr_writer :password
end
