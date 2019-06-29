X = gets.to_i
max = Math.sqrt(Math.sqrt(X).to_i).to_i
(1..max).each do |x|
  if x ** 4 == X
    puts x
    exit 0
  end
end
