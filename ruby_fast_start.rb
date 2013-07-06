class String
  def shuffle(s)
    s.split('').?.?
  end
end

class Word
  def palindrome?(string)
     string == string.reverse
  end
end

"foobar".shuffle

w = Word.new       
w.palindrome?("foobar")

class Word2 < String             # Word inherits from String.
   # Returns true if the string is its own reverse.
   def palindrome?
     self == self.reverse        # self is the string itself.
   end
end

s = Word2.new("level")    # Make a new Word, initialized with "level".
# "level"                  
>> s.palindrome?            # Words have the palindrome? method.
# true                     
>> s.length                 # Words also inherit all the normal string methods.
# 5

# ======= Empty/Blank/nil ====================================================

"".blank?
# => true
"      ".empty?
# => false
"      ".blank?
# => true
nil.blank?
# => true

"foobar".empty?
# => false
"".empty?
# => true

>> nil.to_s
# => ""

nil.empty?
# NoMethodError: You have a nil object when you didn't expect it!
# You might have expected an instance of Array.
# The error occurred while evaluating nil.empty?
nil.to_s.empty?      # Message chaining
# => true

"foo".nil?
# => false
"".nil?
# => false
nil.nil?
# => true


# ======= Arrays and ranges ====================================================


"foo bar     baz".split     # Split a string into a three-element array
# => ["foo", "bar", "baz"]

"fooxbarxbazx".split('x')
# => ["foo", "bar", "baz"]

a = [42, 8, 17]
# => [42, 8, 17]
a[0]               # Ruby uses square brackets for array access.
# => 42
a[1]
 # => 8
a[2]
# => 17
a[-1]              # Indices can even be negative!
# => 17

a                  # Just a reminder of what 'a' is
# => [42, 8, 17]
a.first
# => 42
a.second
# => 8
a.last
# => 17
a.last == a[-1]    # Comparison using ==
# => true

a
# => [42, 8, 17]
a.sort
# => [8, 17, 42]
a.reverse
# => [17, 8, 42]
a.shuffle
# => [17, 42, 8]
a
# => [42, 8, 17]

a
# => [42, 8, 17]
a.sort!
# => [8, 17, 42]
a
# => [8, 17, 42]

 a.push(6)                  # Pushing 6 onto an array
# => [42, 8, 17, 6]
 a << 7                     # Pushing 7 onto an array
# => [42, 8, 17, 6, 7]
 a << "foo" << "bar"        # Chaining array pushes
# => [42, 8, 17, 6, 7, "foo", "bar"]

 a
# => [42, 8, 17, 7, "foo", "bar"]
 a.join                       # Join on nothing
# => "428177foobar"
 a.join(', ')                 # Join on comma-space
# => "42, 8, 17, 7, foo, bar"

0..9
# => 0..9
0..9.to_a              # Oops, call to_a on 9
# NoMethodError: undefined method `to_a' for 9:Fixnum
(0..9).to_a            # Use parentheses to call to_a on the range
# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

a = %w[foo bar baz quux]         # Use %w to make a string array.
# => ["foo", "bar", "baz", "quux"]
a[0..2]
# => ["foo", "bar", "baz"]

('a'..'e').to_a
# => ["a", "b", "c", "d", "e"]

# ======= Blocks ========================================================


(1..5).each { |i| puts 2 * i }
# 2
# 4
# 6
# 8
# 10
# => 1..5



3.times { puts "Betelgeuse!" }   # 3.times takes a block with no variables.
# "Betelgeuse!"
# "Betelgeuse!"
# "Betelgeuse!"
# => 3
(1..5).map { |i| i**2 }          # The ** notation is for 'power'.
# => [1, 4, 9, 16, 25]
%w[a b c]                        # Recall that %w makes string arrays.
# => ["a", "b", "c"]
%w[a b c].map { |char| char.upcase }
# => ["A", "B", "C"]
%w[A B C].map { |char| char.downcase }
# => ["a", "b", "c"]

('a'..'z').to_a                     # An alphabet array
# => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
# "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
('a'..'z').to_a.shuffle             # Shuffle it.
# => ["c", "g", "l", "k", "h", "z", "s", "i", "n", "d", "y", "u", "t", "j", "q",
# "b", "r", "o", "f", "e", "w", "v", "m", "a", "x", "p"]
('a'..'z').to_a.shuffle[0..7]       # Pull out the first eight elements.
# => ["f", "w", "i", "a", "h", "p", "c", "x"]
('a'..'z').to_a.shuffle[0..7].join  # Join them together to make one string.
# => "mznpybuj"

# ======= Hashes and symbols ==============================================

userr = {}                          # {} is an empty hash.
# => {}
user["first_name"] = "Michael"     # Key "first_name", value "Michael"
# => "Michael"
user["last_name"] = "Hartl"        # Key "last_name", value "Hartl"
# => "Hartl"
user["first_name"]                 # Element access is like arrays.
# => "Michael"
user                               # A literal representation of the hash
# => {"last_name"=>"Hartl", "first_name"=>"Michael"}

 user = { "first_name" => "Michael", "last_name" => "Hartl" }
# => {"last_name"=>"Hartl", "first_name"=>"Michael"}

"name".split('')
# => ["n", "a", "m", "e"]
:name.split('')
# NoMethodError: undefined method `split' for :name:Symbol
"foobar".reverse
# => "raboof"
:foobar.reverse
# NoMethodError: undefined method `reverse' for :foobar:Symbol


user = { :name => "Michael Hartl", :email => "michael@example.com" }
# => {:name=>"Michael Hartl", :email=>"michael@example.com"}
user[:name]              # Access the value corresponding to :name.
# => "Michael Hartl"
 user[:password]          # Access the value of an undefined key.
# => nil

user = { name: "Michael Hartl", email: "michael@example.com" }

 params = {}        # Define a hash called 'params' (short for 'parameters').
# => {}
 params[:user] = { name: "Michael Hartl", email: "mhartl@example.com" }
# => {:name=>"Michael Hartl", :email=>"mhartl@example.com"}
 params
# => {:user=>{:name=>"Michael Hartl", :email=>"mhartl@example.com"}}
 params[:user][:email]
# => "mhartl@example.com"


# The last example uses the useful inspect method, which returns 
# a string with a literal representation of the object it’s called on:
puts (1..5).to_a            # Put an array as a string.
# 1
# 2
# 3
# 4
# 5
 puts (1..5).to_a.inspect    # Put a literal array.
# [1, 2, 3, 4, 5]
 puts :name, :name.inspect
# name
# :name
 puts "It worked!", "It worked!".inspect
# It worked!
# "It worked!"

 p :name             # Same as 'puts :name.inspect'
# :name