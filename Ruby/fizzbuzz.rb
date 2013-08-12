puts fizzbuzz


def fizzbuzz
  res=""
  (1..100). to_a.each do |elem|
    res+="Fizz" if (elem%3).zero?
    res+="Buzz" if (elem%5).zero?
    res+="#{elem}" unless ((elem%3).zero? or (elem%5).zero?);
    res+=","
  end
  res
end

def fizzbuzz_2
  (1..100).each do |i|
    puts (a = [
            (i % 3).zero? ? "Fizz" : nil,
            (i % 5).zero? ? "Buzz" : nil
    ].compact.join).empty? ? i : a
  end
end


def fizzbuzz_3
  (1..100).map do |i|
    puts i, [
            (i % 3).zero? ? "Fizz" : nil,
            (i % 5).zero? ? "Buzz" : nil
    ].compact.join
  end.compact
end

def fizzbuzz_4
  100.times do |i|
    num=i+1
    [ (num % 3).zero? ? "Fizz" : nil,
      (num % 5).zero? ? "Buzz" : nil,
      ((num % 3).zero? or (num % 5).zero?) ? nil : num,
      ","
      ].compact.join.display
  end
end

def fizzbuzz_5
  (1..100).each do |i|
    puts (s = "#{"Fizz" if (i % 3).zero?}#{"Buzz" if (i % 5).zero?}").empty? ? i : s
  end
end
