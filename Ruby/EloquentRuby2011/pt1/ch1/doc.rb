# Document: An example Ruby class
class Document
  attr_accessor :title, :author, :content
  
  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end
end

=begin 
 some comment
=end

def count_words_in( the_string )
  the_words = the_string.split; the_words.size
end

doc = Document.new("asd", "me", "wef ewef wf fwfwqef 1r 13r fe ")

# doc.words.each do |word|
#   puts word
# end
# doc.words.each { |word| puts word } # more correct

puts doc.instance_of? Document
puts doc.instance_of?( self.class.superclass.class )
puts self.class.superclass.class

pi = Float('3.12159') #throw exc on bad arg unless when .to_f
'3.12159'.to_f == pi


