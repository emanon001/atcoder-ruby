N = gets.to_i

require 'prime'
puts Prime.each(N - 1).to_a.size