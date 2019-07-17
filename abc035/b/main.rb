S = gets.chomp.chars
T = gets.to_i
x = 0
y = 0
wc = 0
S.each do |ch|
  if ch == 'L'
    x -= 1
  elsif ch == 'R'
    x += 1
  elsif ch == 'U'
    y += 1
  elsif ch == 'D'
    y -= 1
  else
    wc += 1
  end
end
m = x.abs + y.abs
if T == 1
  max = m + wc
  puts max
else
  min = if m - wc > 0
    m - wc
  else
    (m - wc).abs % 2
  end
  puts min
end
