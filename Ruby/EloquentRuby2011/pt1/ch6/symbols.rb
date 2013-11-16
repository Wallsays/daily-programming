a = :all
b = a
c = :all
# True! All true!
puts a == c
puts a === c
puts a.eql?(c)
puts a.equal?(c)

puts "--------------"

x = "all"
y = "all"
puts x == y
puts x === y
puts x.eql?(y)
puts x.equal?(y) # false except other

puts "--------------"

the_string = :all.to_s
the_symbol = 'all'.to_sym

x = Object.new
p x.public_methods
