require 'prime'

X = gets.to_i
x = X
while true
  if x.prime?
    puts x
    exit 0
  end
  x += 1
end