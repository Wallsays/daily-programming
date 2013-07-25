require 'active_support/inflector'

arr = [ "Check", "Credit card", "Purchase order" ]

p Hash[arr.map! { |x| [ 
  'orders.payment_types.' + x.parameterize.underscore, x 
  ] } ]

puts   

p arr