class BaseDocument
  
  def title
    raise "Not Implemented"
  end
  
  def title=
    raise "Not Implemented"
  end

  def author
    raise "Not Implemented"
  end
  
  def author=
    raise "Not Implemented"
  end
  
  def content
    raise "Not Implemented"
  end
  
  # And so on for the content=
  # words and word_count methods...

end


class Document < BaseDocument
  attr_accessor :title, :author, :content

  def initialize( title, author, content )
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

class LazyDocument < BaseDocument
  attr_writer :title, :author, :content
  
  def initialize( path )
  @path = path
  @document_read = false
  end

  def read_document
    return if @document_read
    File.open( @path ) do | f |
      @title = f.readline.chomp
      @author = f.readline.chomp
      @content = f.read
    end
    @document_read = true
  end
  
  def title
    read_document
    @title
  end

  def title=( new_title )
    read_document
    @title = new_title
  end

  # And so on...
end

class Title
  attr_reader :long_name, :short_name
  attr_reader :isbn

  def initialize(long_name, short_name, isbn)
    @long_name = long_name
    @short_name = short_name
    @isbn = isbn
  end

end

class Author
  attr_reader :first_name, :last_name
  
  def initialize( first_name, last_name )
    raise "first_name isn't a String" unless first_name.kind_of? String
    @first_name = first_name
    @last_name = last_name
  end
end

two_cities = Title.new( 'A Tale Of Two Cities',
                        '2 Cities', '0-999-99999-9' )
dickens = Author.new( 'Charles', 'Dickens' )
doc = Document.new( two_cities, dickens, 'It was the best...' )

puts doc.author.first_name

def is_longer_than?( number_of_characters )
  @content.length > number_of_characters
end

def wds; @content.split; end

open_file = File.open( '../ch7/objects.rb' )
puts open_file
require 'stringio'
open_string = StringIO.new( "So say we all!\nSo say we all!\n" )
puts open_string
