puts /\d\d:\d\d (AM|PM)/ =~ '10:24 PM'
puts /PM/ =~ '10:24 PM'
puts /May/ =~ 'Sometime in June'

# Since =~ returns a number when it finds a match and 
# nil if it doesn’t, you can use regular 
# expression matches as booleans
the_time = '10:24 AM'
puts "It's morning!" if /AM/ =~ the_time

@content = "10:24 AM and some text"
@content.gsub!( /\d\d:\d\d (AM|PM)/, '**:** **' )
puts @content

puts /abc*/ =~ "abccccc"  # 0
p   /abbc*/ =~ "abccccc"  # nil
