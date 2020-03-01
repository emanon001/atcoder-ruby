N, M = gets.split.map(&:to_i)
SC = M.times.map do
  s, c = gets.split.map(&:to_i)
  [s - 1, c]
end

table = {}
SC.each do |s, c|
  if table[s] && table[s] != c
    puts '-1'
    exit 0
  end
  table[s] = c
end

if table[0] == 0 && N > 1
  puts '-1'
  exit 0
end

ans = []
N.times do |i|
  if table[i]
    ans.push(table[i])
  else
    if i == 0
      if N > 1
        ans.push(1)
      else
        ans.push(0)
      end
    else
      ans.push(0)
    end
  end
end
puts ans.join('')