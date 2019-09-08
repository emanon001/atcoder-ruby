N = gets.to_i
S = gets.split.map(&:to_i)
if S.size != 2 ** N
  puts 'No'
  exit 0
end
sorted = S.sort_by { |n| -n }
n = 1
pos = 1
prev = nil
some_count = 1
while pos < 2 ** N
  next_pos = 2 ** (n + 1)
  if S[pos] > prev
    puts ''
    exit 0
  end
  (pos...next_pos).each do |s|

  end
  pos = next_pos
  n += 1
  prev = S[next_pos - 1]
end
