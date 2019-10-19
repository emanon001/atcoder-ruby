N = gets.to_i
S = gets.chomp.chars
x = 0
max = 0
S.each do |ch|
  if ch == 'I'
    x += 1
    max = x if x > max
  elsif ch == 'D'
    x -= 1
  end
end
puts max
