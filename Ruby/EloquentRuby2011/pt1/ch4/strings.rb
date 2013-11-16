puts a_string_with_a_backslash = 'This is a backslash: \\'
puts double_quoted = "I have a tab: \t and a newline: \n"

puts str = '"Stop", she said, "I can\'t live without \'s and "s."'
puts str = %q{"Stop", she said, "I can't live without 's and "s."}
puts str = %q<"Stop", she said, "I can't live without 's and "s.">
puts str = %q$"Stop", she said, "I can't live without 's and "s."$

puts str = %Q<The time in now #{Time.now}>

puts a_multiline_string = "a multi-line
string"
puts another_one = %q{another multi-line
string}

puts yet_another = %Q{another multi-line string with \
no newline}

heres_one = <<EOF
This is the beginning of my here document.
And this is the end.
EOF

puts ' hello'.lstrip
puts "It was a dark and stormy night\n".chomp
puts "hello".chop

puts 'It is warm outside'.sub( 'warm', 'cold' )

# does at most one substitution,
puts 'yes yes'.sub( 'yes', 'no' )  
# will replace as many substrings as it possibly can
puts 'yes yes'.gsub( 'yes', 'no' ) 

puts 'It was a dark and stormy night'.split
puts 'Bill:Shakespeare:Playwright:Globe'.split( ':' )

puts "It was a dark and stormy night".index( "dark" ) # Returns 9
puts "-------------------"

@author = "Clarke"
@author.each_char {|c| puts c}
@author.each_byte { |b| puts b }

@content = "It was a dark\nand stormy night"
@content.each_line { |line| puts line }

def html_escape(s)
  s.to_s.gsub(/&/, "&amp;").gsub(/\"/, "&quot;").
      gsub(/>/, "&gt;").gsub(/</, "&lt;")
end

first_name = 'Karen'
given_name = first_name

first_name[0] = 'D'
# And you have also changed given_name. You should treat Ruby strings
# like any other mutable data structure.
first_name = first_name.upcase
# first_name.upcase!
# first_name = "k" + first_name[1..first_name.size] 
p first_name
p given_name

puts first_name[-1]

puts "abcde"[2..4]
