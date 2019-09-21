H, W, A, B = gets.split.map(&:to_i)

if A > W / 2 || B > H / 2
  puts 'No'
  exit 0
end

B.times do
  puts ((W - A).times.map { '1' } + A.times.map { '0'}).join
end
(H - B).times do
  puts ((W - A).times.map { '0' } + A.times.map { '1' }).join
end
