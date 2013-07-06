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

"".blank?
# => true
"      ".empty?
# => false
"      ".blank?
# => true
nil.blank?
# => true