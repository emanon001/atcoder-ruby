A, B = gets.split.map(&:to_i)

size = 100
ret = Array.new(size) { Array.new(size) }

size.times do |i|
  size.times do |j|
    color = i < size / 2 ? '.' : '#'
    ret[i][j] = color
  end
end

i = 0
j = 0
(B - 1).times do
  ret[i][j] = '#'
  if j + 2 >= size
    j = 0
    i += 2
  else
    j += 2
  end
end
i = size / 2 + 1
j = 0
(A - 1).times do
  ret[i][j] = '.'
  if j + 2 >= size
    j = 0
    i += 2
  else
    j += 2
  end
end

puts "#{size} #{size}"
puts ret.map(&:join).join("\n")
