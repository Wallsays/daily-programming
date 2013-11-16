class Document
  attr_accessor :writable
  attr_reader :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def title=( new_title )
    # if @writabled
    p @writabled
    p @read_only
    unless @read_only
      @title = new_title
    end
    @author = case @title
              when 'War And Peace'
                'Tolstoy'
              when 'Romeo And Julie'
                'Shakespeare'
              else
                "Don't know"
              end
  end

  # Similar author= and content= methods omitted...

end

doc = Document.new("121","32","234 234 2")
doc.title='War And Peace'
p doc

case doc
  when Document
    puts "It's a document!"
  when String
    puts "It's a string!"
  else
    puts "Don't know what it is!"
end

case doc.title
  when /War And .*/
    puts 'Maybe Tolstoy?'
  when /Romeo And .*/
    puts 'Maybe Shakespeare?'
  else
    puts 'Absolutely no idea...'
end

puts 'Sorry Dennis Ritchie, but 0 is true!' if 0
puts 'Sorry but "false" is not false' if 'false'

doc = Document.new( 'A Question', 'Shakespeare', 'To be...' )
flag = defined?( doc )
# p flag